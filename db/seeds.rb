# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do
  Plan.create([
    {
      name: 'Mini plan',
      description: 'Mini plan allows you the mini plan things.',
      paypal_description: 'Mini plan allows you the mini plan things.',
      price: 10.50
    },
    {
      name: 'Super plan',
      description: 'Super plan allows you the mini plan things.',
      paypal_description: 'Super plan allows you the mini plan things.',
      price: 30.50
    }
  ])
end
