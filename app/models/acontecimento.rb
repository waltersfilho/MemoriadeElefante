class Acontecimento < ActiveRecord::Base
    belongs_to :politico
    acts_as_votable
end
