class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :creator
  has_many :comments
  has_many :notices
  #validates :facebook, :youtube, :twitch, :intagram, :twitter, :website, :podcast, format: URI::regexp(%w[http https])
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable,
      :registerable, :lockable, :confirmable, :recoverable


  ROLES = {
    'admin'   => 'Administrador',
    'creator' => 'Criador',
    'user'    => 'Usuário',
  }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  has_many :notifications, foreign_key: :recipient_id
  belongs_to :account

  scope :managers, -> { where(role_id: 'manager') }

  def respond_to?(method_name, include_private = false)
    return false if method_name == :unique_session_id && admin?
    super
  end

  def lock!
    update locked_at: Time.zone.now
  end

  def unlock!
    update locked_at: nil
  end

  def admin?
    role_id == 'admin'
  end

  def creator?
    role_id == 'creator' || role_id == 'admin'
  end

  def creator
    Creator.find_by(user_id: id)
  end

  def role_name
    ROLES[role_id]
  end
end
