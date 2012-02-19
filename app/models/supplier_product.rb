class SupplierProduct < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :product

  validates_associated :supplier
  validates_associated :product
  validates :supplier_id, :presence => true
  validates :product_id, :presence => true
end
