# frozen_string_literal: true

sum = 0

numberhash = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}
File.readlines('input1').each do |line|
  numberhash.each do |human_number, int_number|
    line = line.gsub(human_number, human_number + int_number + human_number)
    #nasty way to to prevent removing overlapping letters
    # I saw a nice example that used e.g. f4r as replacement
  end
  firstdigit = line.scan(/\d/).first
  lastdigit =  line.scan(/\d/).last
  sum += (firstdigit+lastdigit).to_i
end

print(sum)
