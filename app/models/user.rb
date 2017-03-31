class User < ApplicationRecord
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :group_users, dependent: :destroy
  has_many :groups, :through => :group_users
  accepts_nested_attributes_for :group_users, allow_destroy: true


end
