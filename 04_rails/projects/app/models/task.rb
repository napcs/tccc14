class Task < ActiveRecord::Base
  attr_accessible :description, :difficulty, :name, :priority, :status
  include HasStatusSupport
  belongs_to :project
end
