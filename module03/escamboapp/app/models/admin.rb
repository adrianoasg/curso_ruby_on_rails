class Admin < ActiveRecord::Base
  # constants
  ROLES = {:full_access => 0, :restricted_access => 1}
  #enums
  enum role: ROLES

  # scopes
  scope :whith_full_access, -> { where(role: ROLES[:full_access]) }
  scope :whith_restricted_access, -> { where(role: ROLES[:restricted_access]) }

  # def self.whith_full_access
  #   where(role: 'full_access')
  # end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end