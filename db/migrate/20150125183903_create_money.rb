class CreateMoney < ActiveRecord::Migration
  def change
    create_table :money do |t|
      t.text :title
      t.string :description
      t.integer :cost
      t.integer :feel
      t.integer :paytype

      t.timestamps null: false
    end
  end
end
