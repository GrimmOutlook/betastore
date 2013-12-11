class Product < ActiveRecord::Base

  has_many :line_items
  has_many :orders, :through => :line_items
  has_many :product_categorizations
  has_many :categories, :through => :product_categorizations
  

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def self.search(term)
  	where("name ILIKE ?", "%#{term"}%")
  end
end