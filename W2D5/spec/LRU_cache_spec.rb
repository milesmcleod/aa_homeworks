require 'rspec'
require 'LRU_cache'

describe LRUCache do
  subject(:cache) { LRUCache.new(4)}

  describe '#initialize' do

    it 'takes an argument for the maximum cache length' do
      expect(cache.length).to eq(4)
    end

    it 'initializes with an empty array for storing values' do
      expect(cache.cache).to eq([])
    end

  end

  describe '#add' do

    it 'adds an element if it\'s not already in the list' do
      cache.add('beans')
      expect(cache.cache).to eq(['beans'])
    end

    it 'removes the oldest element in a list when room is needed' do
      cache.add(1); cache.add(2); cache.add(3); cache.add(4)
      cache.add(5)
      expect(cache.cache).to eq([2, 3, 4, 5])
    end

    it 'updates the order when re-adding an existing element' do
      cache.add(1); cache.add(2); cache.add(3); cache.add(4)
      cache.add(2)
      expect(cache.cache).to eq([1, 3, 4, 2])
    end

  end

  describe '#count' do

    it 'gives the current length of the cache' do
      expect(cache.count).to eq(0)
      cache.add('beans')
      expect(cache.count).to eq(1)
    end

  end

end
