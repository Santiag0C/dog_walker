require './lib/dog'
require './lib/walker'
require 'minitest/pride'
require 'minitest/autorun'
require 'pry'

class WalkerTest < Minitest::Test
  def test_instance
    walker = Walker.new("Al", 3)
    assert_instance_of Walker, walker
  end

  def test_argument
    walker = Walker.new("Al", 3)
    assert_equal "Al", walker.name
    assert_equal 3, walker.num_of_bag
  end

  def test_add_clients
    walker = Walker.new("Al", 3)
    sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    walker.add_clients(sodie)
    #binding.pry

    assert_equal 1, walker.add_clients(sodie).count
  end

  def test_walk_no_bags
    walker = Walker.new("Al", 0)
    sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    #walker.add_clients(sodie)
    #assert_equal 2, walker.walk
    #assert_equal 0,
    #walker.walk(sodie)
    assert_equal "not enogh bags", walker.walk(sodie)
  end

  def test_walk
    walker = Walker.new("Al", 3)
    sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    #walker.add_clients(sodie)
    #assert_equal 2, walker.walk
    assert_equal 0, sodie.walks
    walker.walk(sodie)
    assert_equal 1, sodie.walks
    assert_equal 2, walker.num_of_bag
  end

  def test_list
    walker = Walker.new("Al", 3)
    sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    max = Dog.new("Maxin", 11, "Cocker Spaniel", false)
    mati = Dog.new("Max", 11, "Cocker Spaniel", false)
    walker.add_clients(sodie)
    walker.add_clients(max)
    walker.add_clients(mati)
    assert_equal 3, walker.count_clients
    assert_equal 3, walker.list_all_names.count
  end

  def test_lisr_elderly
    walker = Walker.new("Al", 3)
    sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    max = Dog.new("Maxin", 11, "Cocker Spaniel", false)
    mati = Dog.new("Max", 5, "Cocker Spaniel", false)
    mark = Dog.new("Mark", 3, "Cocker Spaniel", false)
    walker.add_clients(sodie)
    walker.add_clients(max)
    walker.add_clients(mati)
    walker.add_clients(mark)
    assert_equal ({"Sodie"=>sodie,"Maxin"=>max}), walker.list_elderly

  end
  def test_all_names
    walker = Walker.new("Al", 3)
    sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    max = Dog.new("Maxin", 11, "Cocker Spaniel", false)
    mati = Dog.new("Max", 5, "Cocker Spaniel", false)
    mark = Dog.new("Marke", 3, "Cocker Spaniel", false)
    walker.add_clients(sodie)
    walker.add_clients(max)
    walker.add_clients(mati)
    walker.add_clients(mark)
    assert_equal ["Sodie", "Maxin", "Max", "Marke"], walker.list_all_names
  end
  def test_names_ending_in_y_and_ie
    walker = Walker.new("Al", 3)
    sodie = Dog.new("Sody", 9, "Shih-Tzu", true)
    max = Dog.new("Maxie", 11, "Cocker Spaniel", false)
    mati = Dog.new("Max", 5, "Cocker Spaniel", false)
    walker.add_clients(sodie)
    walker.add_clients(max)
    walker.add_clients(mati)
    assert_equal ["Sody", "Maxie"], walker.names_ending_in_y_ey
  end

  def test_for_breed
    walker = Walker.new("Al", 3)
    sodie = Dog.new("Sody", 9, "Shih-Tzu", true)
    max = Dog.new("Maxie", 11, "Cocker Spaniel", false)
    mati = Dog.new("Max", 5, "Cocker Spaniel", false)
    walker.add_clients(sodie)
    walker.add_clients(max)
    walker.add_clients(mati)
    assert_equal 2, walker.check_for_beeds("Cocker Spaniel")

  end

end
