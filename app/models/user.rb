class User < ActiveRecord::Base
  validates :password,
    presence: true,
    length: {minimum: 6, maximum: 15},
    confirmation: true
    validates :username, presence: true, uniqueness: true
end
