#me = Customer.create(name: 'Paul Barry', email: 'mail@paulbarry.com')
#test = Customer.create(name: 'John Doe', email: 'test@example.com')
#Customer.create(name: 'Nowhere Man', email: 'man@nowhere.com')

#muffin = Product.create(name: 'Muffin', price: 2.99)
#smoothie = Product.create(name: 'Smoothie', price: 3.75)
#coffee = Product.create(name: 'Coffee', price: 3.99)

#order = Order.create(customer: me, placed_at: '2013-09-27')
#LineItem.create(order: order, quantity: 1, product: muffin)
#LineItem.create(order: order, quantity: 1, product: smoothie)

#order = Order.create(customer: me, placed_at: Time.current)
#LineItem.create(order: order, quantity: 1, product: smoothie)

#order = Order.create(customer: test, placed_at: Time.current)
#LineItem.create(order: order, quantity: 1, product: muffin)
#LineItem.create(order: order, quantity: 1, product: coffee)

categories = Category.all

clothing = Category.create!(name: 'Clothing')
stuff = Category.create!(name: 'Stuff')


  clothing.products << Product.create!( name: 'Hat', price: 14.99, inventory: 10 )
  clothing.products << Product.create!( name: 'Hoodie', price: 22.99, inventory: 8 )
  stuff.products << Product.create!( name: 'iPhone Case', price: 9.99, inventory: 110) 
  stuff.products << Product.create!( name: 'Journal', price:  12.99, inventory: 0)
  clothing.products << Product.create!( name: 'Shirt', price:  17.99, inventory: 130)
  stuff.products << Product.create!( name: 'Sticker', price: 2.99, inventory: 0)

# The rest is fake data to simulate having a large product catalog
# 1000.times do
 #  categories.sample.products << Product.create!(
  #   name: Faker::Lorem.words(2).join(' ').titleize,
   #  price: (rand(20) + rand(99)/100.0))
# end


