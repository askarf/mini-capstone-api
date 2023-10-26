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
end
