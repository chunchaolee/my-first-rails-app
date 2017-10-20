class Task < ApplicationRecord
  # 新增驗證要求
  validates_presence_of :name, :date, :note
end
