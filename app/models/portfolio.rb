class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :sites
  has_many :spaces, :through => :sites

  attribute :average_square_footage
  attribute :total_square_footage
  attribute :number_of_spaces
  attribute :number_of_sites

  def number_of_spaces
    self.spaces.count
  end

  def number_of_sites
    self.sites.count
  end

  def average_square_footage
    square_footages = self.spaces.collect(&:square_footage).sort 
    numerator = square_footages.reduce(0) { |a, v| a + v }
    denominator = square_footages.count
    average = numerator.to_f / denominator.to_f 
    average    
  end

  def total_square_footage
    self.sites.collect(&:total_square_footage).inject(:+) 
  end
end
