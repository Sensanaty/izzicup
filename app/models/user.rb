class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save { self.username.gsub!(/\s/, '') }
  validates :username, presence: true, uniqueness: true, length: 4..25
end
