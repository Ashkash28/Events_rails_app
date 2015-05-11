class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :users, :through => :attendees
  has_many :users, :through => :comments


  validates :name, :date, :city,  :presence => true

  validate do
     errors[:date] << "Event Date must be in the future" if date && date < Date.today
   end 
end
