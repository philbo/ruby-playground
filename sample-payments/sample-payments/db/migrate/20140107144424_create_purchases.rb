class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :account, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
