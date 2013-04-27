class Project < ActiveRecord::Base
  attr_accessible :description, :name, :status
  include HasStatusSupport
  has_many :tasks, :dependent => :destroy

  validates_presence_of :name, :status

end
