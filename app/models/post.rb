class Post < ApplicationRecord
	has_attached_file :avatar, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	belongs_to :user
	has_many :comments
end
