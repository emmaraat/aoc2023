class GameSumCalculator
  attr_reader :sum
  def initialize()
    @sum = 0
  end

  def parse_file(filename)
    File.readlines(filename).each do |line|
      grab_array = parse_grab_array(line)

      this_game_bag = initialize_game_bag

      update_game_bag(this_game_bag, grab_array)

      @sum += calculate_game_bag_value(this_game_bag)
    end
  end

  private

  def parse_grab_array(line)
    line.split(":")[1].split(";")
  end

  def initialize_game_bag
    { 'r' => 0, 'g' => 0, 'b' => 0 }
  end

  def update_game_bag(game_bag, grab_array)
    grab_array.each do |grab|
      update_game_bag_with_grab(game_bag, grab)
    end
  end

  def update_game_bag_with_grab(game_bag, grab)
    colour_samples = grab.split(',')
    colour_samples.each do |sample|
      amount = sample.scan(/\d+/).first
      colour = sample.scan(/[a-z]/).first

      game_bag[colour] = amount.to_i if amount.to_i > game_bag[colour]
    end
  end

  def calculate_game_bag_value(game_bag)
    game_bag.values.inject(:*)
  end
end

# Example usage:
calculator = GameSumCalculator.new
calculator.parse_file('input2')
result = calculator.sum
puts result
