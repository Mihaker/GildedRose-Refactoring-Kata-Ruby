require 'rspec'

require File.join(File.dirname(__FILE__), 'gilded_rose')

require 'rspec'
require_relative 'gilded_rose'

# gilded_rose_spec.rb

require_relative 'gilded_rose'

RSpec.describe GildedRose do
  describe "#update_quality" do
    context "з різними предметами" do
      let(:items) do
        [
          Item.new("Aged Brie", 5, 10),
          Item.new("Conjured Mana Cake", 3, 6),
          Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
          Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
          Item.new("Normal Item", 4, 8)
        ]
      end

      it "оновлює якість коректно" do
        gilded_rose = GildedRose.new(items)
        
        gilded_rose.update_quality
        expect(items[0].quality).to eq(11)
        expect(items[1].quality).to eq(5)
        expect(items[2].quality).to eq(80)
        expect(items[3].quality).to eq(21)
        expect(items[4].quality).to eq(7)
      end

      it "оновлює sell_in коректно" do
        gilded_rose = GildedRose.new(items)
        
        gilded_rose.update_quality
        expect(items[0].sell_in).to eq(4)
        expect(items[1].sell_in).to eq(2)
        expect(items[2].sell_in).to eq(0)
        expect(items[3].sell_in).to eq(14)
        expect(items[4].sell_in).to eq(3)
      end
    end
  end
end
