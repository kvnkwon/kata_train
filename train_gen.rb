class Train

  def initialize(train_times)
    @train_times = train_times
    @next_train = []
    @leave_time = ''
  end

  def time_leaving
    puts "What time are you leaving?"
    @leave_time = gets.chomp
    if @leave_time >= "24" || @leave_time =~ /[a-zA-Z]|\D|\d{3}/ || @leave_time == "0"
      puts "Please insert a valid time."
      @leave_time = ''
      time_leaving
    else
      next_train
    end
  end

  def next_train
    @train_times.each_key do |train|
      #skips over all the times that are less than the leave time.
      if @leave_time.to_f <= @train_times[train].to_f
        @next_train << train
        @next_train << @train_times[train]
        #break prevents it from listing any other times that are higher than the leave time.
        break
      end  
    end
    take_this_train
  end

  def take_this_train
    if @next_train[1] != " 24"
    puts "You should catch #{@next_train[0]} leaving at#{@next_train[1]}"
    else
    puts "You should catch #{@next_train[0]} leaving at#{@next_train[1]}\n\n"
    song
    end
  end

  def song
    puts "*** DON\'T STOP BELIEVING ***\n\n"
    puts "Just a small town girl
Living in a lonely world
She took the midnight train going anywhere
Just a city boy
Born and raised in South Detroit
He took the midnight train going anywhere

A singer in a smoky room
A smell of wine and cheap perfume
For a smile they can share the night
It goes on and on and on and on

Strangers waiting, up and down the boulevard 
Their shadows searching in the night 
Streetlights people, living just to find emotion 
Hiding, somewhere in the night."
  
  end
end