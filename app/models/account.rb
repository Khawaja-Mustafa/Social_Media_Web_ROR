class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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

  # For friends
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :account


  # Avatar uploading
  # User Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar
 

  # chatting function
  validates_uniqueness_of :username
  scope :all_except, ->(account) { where.not(id: account) }
  after_create_commit { broadcast_append_to "accounts" }
  has_many :messages



  
  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end
end
