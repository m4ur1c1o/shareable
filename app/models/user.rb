class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects

  validates_presence_of :first_name, :last_name, :email, :password
  validates_uniqueness_of :email

  enum role: { company: 0, admin: 1 }
end
