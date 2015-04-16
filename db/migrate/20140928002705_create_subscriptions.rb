class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :paypal_payer_id
      t.string :paypal_profile_id
      t.datetime :paid_until
      t.references :plan, index: true

      t.timestamps
    end
  end
end
