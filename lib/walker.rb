require 'pry'
require './lib/dog'
class Walker
  attr_reader :name, :num_of_bag
  def initialize(name, num_of_bag)
    @name = name
    @num_of_bag = num_of_bag
    @clients = Hash.new(0)

  end
  def clients
    @clients
  end

  def add_clients(obj)
    # clients = obj
    clients[obj.name] = obj
    clients
  end

  def count_clients
    clients.length
  end

  def walk(dog)
    if @num_of_bag < 1
      "not enogh bags"
    else
     @num_of_bag -= 1
     dog.walk
   end
  end
  def list_all_names
    @clients.keys
  end

  def list_elderly
    @old_dog = {}
    @young_dog = {}
    @clients.each do |key, info|
      if info.age > 6
        @old_dog[key] = info
      else
        @young_dog[key] = info
        #binding.pry
      end
    end
    return @old_dog
  end
  def names_ending_in_y_ey
    arr = @clients.keys
    start_ie_and_y = [ ]
    arr.each do |name|
      if name[-2..-1] == "ie"
        start_ie_and_y << name
      elsif name[-1] == "y"
        start_ie_and_y << name
      end
    end
    start_ie_and_y
  end
  def check_for_beeds(breed)
    count = 0
    @clients.each do |key, hash|
      if hash.breed == breed
        count += 1
      else
        count
    end
  end
  count
  binding.pry
end
end
