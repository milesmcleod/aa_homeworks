fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish',
  'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(array)
  array.each do |fish|
    if array.all? { |comp_fish| fish.length >= comp_fish.length }
      return fish
    end
  end
end

puts sluggish_octopus(fishes)

class Array

  def fishy_merge_sort
    return self if self.length <= 1
    middle = self.length/2
    left = self[0...middle].fishy_merge_sort
    right = self[middle..-1].fishy_merge_sort
    Array.fishy_merge_helper(left, right)
  end

  def self.fishy_merge_helper(left, right)
    new_array = []
    until left.empty? || right.empty?
      case left.first.length <=> right.first.length
      when 1
        new_array << right.shift
      when 0
        new_array << right.shift
      when -1
        new_array << left.shift
      end
    end
    new_array + left + right

  end

end

def dominant_octopus(array)
  array.fishy_merge_sort.last
end

puts dominant_octopus(fishes)

def clever_octopus(array)
  big_fish = ''
  array.each do |fish|
    big_fish = fish if fish.length > big_fish.length
  end
  big_fish
end

puts clever_octopus(fishes)

tiles_array = ["up", "right-up", "right", "right-down",
  "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, array)
  array.each_with_index do |move, idx|
    return idx if move == direction
  end
end

puts slow_dance('up', tiles_array)
puts slow_dance('right-down', tiles_array)

MOVES = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def constant_dance(direction, moves_hash)
  return moves_hash[direction]
end

puts constant_dance('up', MOVES)
puts constant_dance('right-down', MOVES)
