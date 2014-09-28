class CreateSubscriptions < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :subscriptions, id: :uuid do |t|
      t.string :paypal_payer_id
      t.string :paypal_profile_id
      t.datetime :paid_until
      t.references :plan, index: true

      t.timestamps
    end
  end
end
