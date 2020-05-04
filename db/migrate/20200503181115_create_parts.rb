class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string :part_number,          null: false
      t.datetime :date_added,         default: DateTime.current
      t.string :description,          null: false
      t.integer :quantity_available,  null: false
      t.integer :quantity_reserved,   default: 0
      t.integer :quantity_sold,       default: 0
      t.string :condition,            null: false
      t.integer :base_price,          null: false
      t.integer :cost,                null: false
      t.integer :minimum_order,       null: false
      t.integer :medium_order,        default: 0
      t.integer :max_order,           default: 0
      t.string :lead_time,            default: ""
      t.string :tag,                  null: false
      t.string :quote_type,           default: ""

      t.timestamps
    end
  end
end
