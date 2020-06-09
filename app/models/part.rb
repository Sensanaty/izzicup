class Part < ApplicationRecord
  validates :part_number, :date_added, :description, :quantity_available, :condition, :base_price, :cost, :minimum_order, :quote_type, :tag, presence: true
  validates_numericality_of :quantity_available, :base_price, :cost, :minimum_order, greater_than: 0
  validates_numericality_of :price_medium, :price_high, :cost_medium, :cost_high, greater_than_or_equal_to: 0
  validates_numericality_of :minimum_order, less_than_or_equal_to: :quantity_available, unless: -> { quantity_available.nil? || quantity_available == 0 }
  before_save :upcase_fields

  private

  def upcase_fields
    self.part_number = self.part_number.upcase
    self.description = self.description.upcase
    self.condition = self.condition.upcase
    self.quote_type = self.quote_type.upcase
    self.tag = self.tag.upcase
  end
end
