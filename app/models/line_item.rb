class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  def new_record?

  end
end
