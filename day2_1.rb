# frozen_string_literal: true
sum = 0
bag = { 'r' => 12, 'g' => 13, 'b' => 14}
File.readlines('input2').each do |line|
  impossible = false
  game, grabs = line.split(":")
  #take out Game x: , save game id
  game_id = game.scan(/\d+/).first
  # split up grabs into individual grabs
  grab_array = grabs.split(";")

  grab_array.each do |grab|
    colour_samples = grab.split(',')
    colour_samples.each do |sample|
      amount = sample.scan(/\d+/).first
      colour = sample.scan(/[a-z]/).first

      if amount.to_i > bag[colour]
        impossible = true
      end
    end
  end

  unless impossible
    sum += game_id.to_i
  end
end

print(sum)
