class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.datetime :transaction_date
      t.text :comment
      t.integer :amount, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
