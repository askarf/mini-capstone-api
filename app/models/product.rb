class Product < ApplicationRecord
  def is_discounted?
    if price <= 10
      true
    else
      false
    end
  end

  def tax
    tax = price * 0.09
    tax
  end

  def total
    total = price + tax
    total
  end

  def supplier
    supplier = Supplier.find_by(id: supplier_id)
    supplier
  end

  def images
    Image.where(product_id: id)
  end

  # validates :name, presence: truesup
  # validates :name, uniqueness: true
  # validates :name, length: { in: 2..20 }
  # validates :price, presence: true
  # validates :price, numericality: { greater_than: 0 }
  # validates :description, presence: true
  # validates :description, length: { in: 10..500 }
end
