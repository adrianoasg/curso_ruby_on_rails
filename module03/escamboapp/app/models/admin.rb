class Admin < ActiveRecord::Base
  enum role: {:full_access => 0, :restricted_access => 1}

  scope :whith_full_access, -> { where(role: 'full_access') }

  # def self.whith_full_access
  #   where(role: 'full_access')
  # end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def role_br
    if self.role == 'full_access'
      'Acesso Completo'
    else 
      'Acesso Restrito'
    end
  end
end
