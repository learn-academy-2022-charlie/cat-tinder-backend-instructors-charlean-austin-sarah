require 'rails_helper'

RSpec.describe Cat, type: :model do
  describe 'presence' do
    it 'should validate name' do
      cat = Cat.create age:6, enjoys:'fish', image: 'https://thiscatdoesnotexist.com/'
      p cat.errors[:name]
      expect(cat.errors[:name]).to_not be_empty
    end
    it 'should validate age' do
      cat = Cat.create name:'Mosey', enjoys: 'fish', image: 'https://thiscatdoesnotexist.com/'
      expect(cat.errors[:age]).to_not be_empty
    end
    it 'should validate enjoys' do
      cat = Cat.create name:'Mosey', age:6, image: 'https://thiscatdoesnotexist.com/'
      expect(cat.errors[:enjoys]).to_not be_empty
    end
    it 'should validate image' do
      cat = Cat.create name:'Mosey', enjoys: 'fish', age:6
      expect(cat.errors[:image]).to_not be_empty
    end
  end
  describe 'Minimum Length' do
    it 'will validate a minmum length of cat enjoys to 10' do
      cat = Cat.create name:'mosey', age:6, enjoys:'fish', image: 'https://thiscatdoesnotexist.com/'
      expect(cat.errors[:enjoys]).to_not be_empty
    end
  end
end
