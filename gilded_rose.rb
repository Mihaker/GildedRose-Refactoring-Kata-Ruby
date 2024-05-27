class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        if item.sell_in < 0
          item.quality += 2
        else
          item.quality += 1
        end
  
      when "Conjured Mana Cake"
        item.quality -= 1
  
      when "Sulfuras, Hand of Ragnaros"  
  
      when "Backstage passes to a TAFKAL80ETC concert"
        if item.sell_in > 10
          item.quality += 1
        elsif item.sell_in > 5
          item.quality += 1
        elsif item.sell_in > 0
          item.quality += 1
        else
          item.quality = 0
        end
        item.quality = 50 if item.quality > 50

      else
        if item.quality > 0
          item.quality -= 1
        end
      end
      
      unless item.name == "Sulfuras, Hand of Ragnaros"
        item.sell_in -= 1
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
