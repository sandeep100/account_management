class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.integer :account_id
      t.integer :transaction_id
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end
