class Comment < ActiveRecord::Base
  belongs_to :article
  validates :body, :presence => true, :length => { :in => 3..300 }
end
