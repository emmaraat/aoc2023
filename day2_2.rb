# frozen_string_literal: true
sum = 0

File.readlines('input2').each do |line|
  grabs = line.split(":")[1]
  grab_array = grabs.split(";")

  this_game_bag = { 'r' => 0, 'g' => 0, 'b' => 0}
  grab_array.each do |grab|
    colour_samples = grab.split(',')
    colour_samples.each do |sample|
      amount = sample.scan(/\d+/).first
      colour = sample.scan(/[a-z]/).first

      if amount.to_i > this_game_bag[colour]
        this_game_bag[colour] = amount.to_i
      end
    end
  end

  sum += this_game_bag.values.inject(:*)
end

print(sum)
