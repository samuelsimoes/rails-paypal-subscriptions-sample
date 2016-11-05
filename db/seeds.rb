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
                  name: 'Stupid plan',
                  description: 'Stupid plan is just for stupids.',
                  paypal_description: 'Stupid plan is just for stupids.',
                  price: 0.50
                },
                {
                  name: 'Mini plan',
                  description: 'Mini plan allows you some things.',
                  paypal_description: 'Mini plan allows you some things.',
                  price: 10.50
                },
                {
                  name: 'Super plan',
                  description: 'Super plan is powerful.',
                  paypal_description: 'Super plan is powerful.',
                  price: 30.50
                }
              ])
end
