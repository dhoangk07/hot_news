address = []
File.open('text.txt').each do |line|
  address += line.split(' ') 
end
  result = []
address.each do |elem|
  if !(elem =~ /\A[^@\s]+@[^@\s]+\z/)
   result << elem
  end
end
puts result
