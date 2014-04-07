class AddSlugToAds < ActiveRecord::Migration
  def change
    add_column :ads, :slug, :string
    add_index  :ads, :slug
  end
end
