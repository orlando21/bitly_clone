class User < ActiveRecord::Base

  has_many :urls

  authenticates_with_sorcery!
  validates_confirmation_of :password, message: 'should match confirmation', if: :password
  validates_uniqueness_of :username, :email
end
