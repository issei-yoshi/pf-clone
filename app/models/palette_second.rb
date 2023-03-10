class PaletteSecond < ApplicationRecord
  belongs_to :user
  has_many :like_seconds, dependent: :destroy
  has_many :palette_second_tags, dependent: :destroy
  has_many :tag_seconds, through: :palette_second_tags

  with_options presence: true do
    validates :main
    validates :sub
    validates :body
    validates :bg
  end

  scope :with_tag, ->(tag_second_name) { joins(:tag_seconds).where(tag_seconds: { name: tag_second_name }) }
end
