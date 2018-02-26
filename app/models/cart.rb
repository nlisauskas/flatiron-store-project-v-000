class Cart < ActiveRecord::Base
    has_many :line_items
    has_many :items, through: :line_items
    belongs_to :user

    def total
        @total = 0
        self.line_items.each do |line_item|
            @total += line_item.item.price * line_item.quantity
        end
        @total
    end

    def add_item(item_id)
       line_item = self.line_items.find_by(item_id: item_id)
        if line_item
          line_item.quantity += 1
          #require 'pry'; binding.pry
        else
          line_item=self.line_items.build(item_id: item_id)
        end
        line_item
    end

    def checkout
        self.line_items.each do |line_item|
            line_item.item.inventory -= line_item.quantity
            line_item.item.save

        end
                #require 'pry'; binding.pry

        user.current_cart = nil
        user.save

        self.status = 1
        self.save
        #require 'pry'; binding.pry
    end

end
