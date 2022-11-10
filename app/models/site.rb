class Site < ApplicationRecord
  belongs_to :portfolio
  has_many :spaces

  attribute :average_square_footage
  attribute :total_square_footage
  attribute :number_of_spaces

  def number_of_spaces
    self.spaces.count
  end

  def average_square_footage
    square_footages = self.spaces.collect(&:square_footage).sort 
    numerator = square_footages.reduce(0) { |a, v| a + v }
    denominator = square_footages.count
    average = numerator.to_f / denominator.to_f 
    average    
  end

  def total_square_footage
    self.spaces.collect(&:square_footage).inject(:+) 
  end
end
