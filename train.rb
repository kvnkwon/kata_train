require_relative 'train_gen'
train_times = {}
File.open('train_times.txt') do |train_all|
  train_all.each_line do |line|
  #strip takes away the /n's, split turned every line into an array.
  array = line.strip.split(',')
  #turn the array into hash
  train_times[array[0]] = array[1]
  end
end

train = Train.new(train_times)

puts train.time_leaving