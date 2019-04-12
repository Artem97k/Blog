class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  validates :header, :presence => true, :length => { :in => 1..70 }
  validates :body, :presence => true, :length => { :minimum => 10 }
end
