class Politico < ActiveRecord::Base
  belongs_to :partido
  has_many :acontecimento
end
