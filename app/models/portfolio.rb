class Portfolio < ApplicationRecord
  includes Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: lambda { |attr| attr['name'].blank? }
  after_initialize :set_defaults

  def self.angular
    where(title: "Angular")
  end

  def self.byPosition
    order("position ASC")
  end

  scope :ruby_on_rails_portfolio_items, -> { where(title: "Ruby on Rails") }

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: "600", width: "400")
    self.thumb_image ||= Placeholder.image_generator(height: "350", width: "200")
  end

end
