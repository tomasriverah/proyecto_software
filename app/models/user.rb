class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :set_default_role
  belongs_to :role, optional:true
 

  def update_role(role)
    self.update(role_id: role)
  end


  private

  def set_default_role
    self.update(role_id: Role.find_by(code: 'default').id)
  end
end

