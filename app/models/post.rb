class Post < ApplicationRecord
  validates :image, presence: true
  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
