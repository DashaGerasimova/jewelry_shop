require "rails_helper"

describe Jewel do
  describe "create" do

    before do
      @true_jewel = Jewel.new(name: "nasda", desc: "something", size: 20, jewel_type: "jewel", image: "a.png", price: 86)

      @wrong_size_jewel = Jewel.new(name: "nasda", desc: "something", size: 1, jewel_type: "jewel", image: "a.png", price: 86)
      @wrong_type_jewel = Jewel.new(name: "nasda", desc: "something", size: 20, jewel_type: "", image: "a.png", price: 86)
      @wrong_name_jewel = Jewel.new(name: "", desc: "something", size: 20, jewel_type: "jewel", image: "a.png", price: 86)
      @wrong_image_jewel = Jewel.new(name: "asfs", desc: "something", size: 20, jewel_type: "jewel", image: "a.peneg", price: 86)
    end

    describe "correct jewel" do
      it "should create correct jewel" do
        expect(@true_jewel.save).to be true
      end
    end

    describe "incorrect jewel" do
      it "shouldn't create jewel with incorrect size" do
        expect(@wrong_size_jewel.save).to be false
      end

      it "shouldn't create jewel with incorrect type" do
        expect(@wrong_type_jewel.save).to be false
      end 

      it "shouldn't create jewel with incorrect name" do
        expect(@wrong_name_jewel.save).to be false
      end

      it "shouldn't create jewel with incorrect image" do
        expect(@wrong_image_jewel.save).to be false
      end  
    end
  end

  describe "update" do
  	before do 

  	end
  end
end