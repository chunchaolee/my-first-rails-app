class TasksController < ApplicationController
  # 用回呼方法 讓程式更DRY
  before_action :set_task, :only => [:show, :edit, :update, :destroy]

  # 我們要對需要認證的 actions 加上權限檢查，這裡我們使用 Rails 的 before_filter 函式
  # 它允許我們在執行特定的 actions 前先執行指定的函式，而我們在這個函式中檢查使用者是否有admin權限。
  before_action :authenticate, :except => [:index, :show]
  before_action :authenticate, :only => [:edit, :destroy]

  #首先建立index action
  def index
    #宣告實例變數tasks
    @tasks = Task.all
  end

  #建立CRUD的create ; new action
  def new
    @task = Task.new    
  end

  def create 
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_url, :notice => "Create Notice: 成功建立！"
    else
      render :action => :new
    end
  end

  def show
        
  end

  def edit
        
  end

  def update
    
    # 經過 find id 之後，再透過 update_attributes 將更改過的資料回送至資料庫
    if @task.update_attributes(task_params)
     # 加上了 redirect_to 的功能，導引至 task_path(@task)
      redirect_to task_path(@task), :notice => "Update Notice: 成功更新！" 
    else
      render :action => edit
    end

  end

  def destroy
  
  # 判斷時間，若現在時間已經超過due day則無法刪除
  if DateTime.current < set_task.date
    @task.destroy
    #用Flash來傳遞訊息。它的用處在於redirect時，能夠從這一個request傳遞文字訊息到下一個request，例如從destroy action傳遞「成功刪除」的訊息到index action。
    redirect_to tasks_url, :notice => "Destroy Notice: 成功刪除！"
  else
    redirect_to tasks_url, :alert => "Destroy Alert: OVERDUE! 無法刪除"
  end
end

  # Rails會檢查使用者傳進來的參數必須經過一個過濾的安全步驟，這個機制叫做Strong Parameters，所以用private method
  private

  # 重構程式碼
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    # require 會把 :task 這個model相關參數找出來，如果根本沒有回傳 :task 相關參數，就會產生錯誤
    # permit 就是設定哪些參數可以傳入
    params.require(:task).permit(:name, :date, :note)    
  end

end
