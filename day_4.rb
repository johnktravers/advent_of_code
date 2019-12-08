# Advent of Code Day 4: Secure Container

num = 156218
stop = 652527
count = 0


# ------------------------- Part 1 ------------------------- #

while num <= stop
  digs = num.digits.reverse
  double = false
  increasing = true

  digs.each_with_index do |digit, i|
    if digs[i + 1] && digit == digs[i + 1]
      double = true
    elsif digs[i + 1] && digit > digs[i + 1]
      increasing = false
    end
  end

  count += 1 if double && increasing
  num += 1
end

puts "Number of different possible passwords: #{count}"


# ------------------------- Part 2 ------------------------- #

num = 156218
stop = 652527
count = 0

while num <= stop
  digs = num.digits.reverse
  double = false
  increasing = true

  digs.each_with_index do |digit, i|
    # Check for two repeating digits that are not part of a larger set
    if num.to_s.scan(/((\w)\2*)/).map(&:first).any? { |set| set.length == 2 }
      double = true
    end

    increasing = false if digs[i + 1] && digit > digs[i + 1]
  end

  count += 1 if double && increasing
  num += 1
end

puts "Number of different possible passwords with two repeating digits: #{count}"
