# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :carretes
  has_many :comentarios
  has_many :servicios
  has_many :servicecomments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :set_default_role
  belongs_to :role, optional: true

  def update_role(role)
    update(role_id: role)
  end
  
  private

  def set_default_role
    update(role_id: Role.find_by(code: 'default').id)
  end
end
