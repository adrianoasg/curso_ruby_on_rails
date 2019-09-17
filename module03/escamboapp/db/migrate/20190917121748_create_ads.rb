class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.string :title, limit: 255
      t.text :description
      t.references :member, null: false, foreign_key: true
      t.string :category
      t.string :references

      t.timestamps
    end
  end
end
