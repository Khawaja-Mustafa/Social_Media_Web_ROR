class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timattr_accessible :name, :email, :imageeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # account can have many posts, and if account destroyed than post would also be destroyed
  has_many :posts, dependent: :destroy;
  has_one_attached :avatar
  # for comments
  has_many :comments
  # For Likes
  has_many :likes, dependent: :destroy

  # Avatar uploading
  # User Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar
 
  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end
end
