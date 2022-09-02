class Post < ApplicationRecord
	belongs_to :account
  has_one_attached :post_image
  has_many :comments, dependent: :destroy

	before_create :set_active
  	scope :active, -> { where active: true }
  def set_active
    self.active = true
  end

  has_many :likes, dependent: :destroy
  # def liked?(account)
  #   !!self.likes.find{|like| like.account_id == account.id}
  # end

end