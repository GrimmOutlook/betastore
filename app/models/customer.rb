class Customer < ActiveRecord::Base
  
  has_many :orders
  has_many :line_items, :through => :orders
  has_many :products, :through => :line_items
  has_many :password_resets
  has_many :credit_cards

  validates_presence_of :name, :email

  has_secure_password validations: false

end
