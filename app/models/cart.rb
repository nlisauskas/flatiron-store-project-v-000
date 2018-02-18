class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items


  def total
    total = 0
    self.line_items.each do |item|
      total += (item.price * item.quantity)
    end
    total
  end

  def add_item(item)
    if line_item = LineItem.find_by(cart_id: self.id, item_id: item)
      line_item.quantity += 1
      line_item.save
      line_item
    else
      line_item = LineItem.new(:cart_id => self.id, :item_id => item)
    end
    line_item
  end





end
