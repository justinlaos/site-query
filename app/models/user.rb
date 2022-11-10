class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  def generate_jwt
    JWT.encode({ id: id, exp: 60.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end

  has_many :portfolios
  has_many :sites, :through => :portfolios
  has_many :spaces, :through => :sites

  attribute :number_of_portfolio
  attribute :number_of_spaces
  attribute :number_of_sites

  def number_of_portfolio
    self.portfolio.count
  end

  def number_of_spaces
    self.spaces.count
  end

  def number_of_sites
    self.sites.count
  end
end
