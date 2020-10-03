
hh = {}
loop do

  print "Enter product id: "
  id = gets.strip

  print "Enter amount(how much items you want to order): "
  n = gets.strip.to_i

  x = hh[id].to_i + n
  hh[id] = x

  total = 0
  hh.each do |key, value|
    total = total + value
  end

  puts "Total: #{total}"
  puts hh.inspect
  puts "======================================"
end
