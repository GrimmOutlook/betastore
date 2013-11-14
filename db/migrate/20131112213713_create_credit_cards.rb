class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :cardholder_name
      t.string :card_number
      t.integer :exp_month, limit: 2
      t.integer :exp_year, limit: 4

      t.timestamps
    end
  end
end
