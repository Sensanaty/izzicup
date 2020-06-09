class AddMinimumOrdersAndPricesToParts < ActiveRecord::Migration[6.0]
  def change
    add_column :parts, :price_medium, :integer, default: 0
    add_column :parts, :price_high, :integer, default: 0
    add_column :parts, :cost_medium, :integer, default: 0
    add_column :parts, :cost_high, :integer, default: 0
  end
end
