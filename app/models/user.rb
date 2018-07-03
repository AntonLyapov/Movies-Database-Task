class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :comments

  # validates :name, length: { in: 3..50 }
  validates :role, inclusion: { in: ['user', 'admin', 'moderator'] }

  has_attached_file :avatar,
  styles: { medium: "400x400#", thumb: "100x100#" },
  default_url: ":style/missing.png"

  validates_attachment :avatar,
  content_type: { content_type: ["image/jpeg", "image/png"] },
  size: { in: 100.kilobytes..1.megabytes }

  def regular?
  	role == 'user'
  end

  def admin?
  	role == 'admin'
  end

  def moderator?
  	role == 'moderator'
  end
end
