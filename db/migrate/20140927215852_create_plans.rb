class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.string :paypal_description
      t.text :description

      t.timestamps
    end
  end
end
