require './lib/dog'
require 'minitest/pride'
require 'minitest/autorun'
require 'pry'

class DogTest < Minitest::Test
  def test_instance
    sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    assert_instance_of Dog, sodie
    max = Dog.new("Max", 11, "Cocker Spaniel", false)
    assert_instance_of Dog, max
  end

  def test_name
    sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    assert_equal "Sodie", sodie.name
  end

  def test_age
    sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    assert_equal 9, sodie.age
  end

  def test_breed
    sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    assert_equal "Shih-Tzu", sodie.breed
  end

  def test_if_small_breed
    sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    assert_equal true, sodie.small_breed
  end

  def test_walks
    sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    assert_equal 0, sodie.walks
    sodie.walk
    assert_equal 1, sodie.walks
    sodie.walk
    assert_equal 2, sodie.walks
  end

  def test_bark
    sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    assert_equal "Yap!", sodie.bark
    max = Dog.new("Max", 11, "Cocker Spaniel", false)
    assert_equal "ROOF", max.bark
  end
end
