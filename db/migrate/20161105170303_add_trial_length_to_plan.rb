class AddTrialLengthToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :trial_length, :integer, null: false, default: 0
  end
end
