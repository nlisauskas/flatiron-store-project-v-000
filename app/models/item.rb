class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def available_items
  end
end
