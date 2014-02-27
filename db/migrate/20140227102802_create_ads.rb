class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :content

      t.integer :user_id

      t.timestamps
    end
    add_index :ads, [:user_id, :created_at]
  end
end
