class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member
  
  # Validadates
  validates :title, :description, :category, :picture, :finish_date, presence: true
  validates :price, numericality: { greater_than: 0 }

  # scopes
  scope :descending_order, ->(quantity = 9) { limit(quantity).order(created_at: :desc) }
  scope :to_the, ->(member) { where(member: member) }

  # paperclip
  has_attached_file :picture, styles: { medium: "320x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # gem money-rails
  monetize :price_cents
end