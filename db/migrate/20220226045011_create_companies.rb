class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :rating
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end

    add_index :companies, :category_id
  end
end
