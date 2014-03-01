class AddStateToAd < ActiveRecord::Migration
  def change
    add_column :ads, :state, :string
  end
end
