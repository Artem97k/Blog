class User < ActiveRecord::Base
  has_many :articles, :dependent => :destroy
  validates :login, :presence => true, :length => { :in => 5..20 }, :uniqueness => true
  validates :password, :presence => true, :length => { :in => 5..20 }
end
