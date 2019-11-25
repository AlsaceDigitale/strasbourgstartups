class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :startup_users
  has_many :startups, through: :startup_users

  def name
    [first_name, last_name].delete_if{|x| x.blank?}.join(" ")
  end
end
