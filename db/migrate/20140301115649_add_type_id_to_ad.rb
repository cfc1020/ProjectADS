class AddTypeIdToAd < ActiveRecord::Migration
  def change
    add_column :ads, :type_id, :integer
  end
end
