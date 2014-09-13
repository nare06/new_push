num_of_sticks = gets.chomp.to_i
l = gets.chomp.split.map(&:to_i)
b = 0
while b == 1
    puts l 
    l = l.map{|u| u - l.min}.reject(:blank?)
    b = l.count
    print b
end
