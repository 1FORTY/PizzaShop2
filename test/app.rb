orders = "product_1 = 11,product_2 = 4,product_3 = 11,"
# orders - это общая переменная, так что она не в счёт

s1 = orders.split(',')

s1.each do |x|
  s2 = x.split('=').map(&:strip)
  
  s3 = s2[0].split('_')

  key = s3[1]
  value = s2[1]
  #puts "Key: #{key}, value: #{value}"
end

################################
# Вот это вот делает одно и тоже
################################

s1 = orders.split(',').map { |x| x.split('=').map(&:strip).map { |z| z.split('_') }}

s1.each do |x|
  key = x[0][1]
  value = x[1][0]
  puts "Key: #{key}, value: #{value}"
end

