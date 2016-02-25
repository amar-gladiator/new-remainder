class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members
  has_many :remainders


  accepts_nested_attributes_for :members, :allow_destroy => true

end
