class Project < ActiveRecord::Base
  validates_presence_of :name

  has_many :todos
  belongs_to :user
end
