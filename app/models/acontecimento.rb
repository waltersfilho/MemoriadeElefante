class Acontecimento < ActiveRecord::Base
    has_many :politico
    acts_as_votable
end
