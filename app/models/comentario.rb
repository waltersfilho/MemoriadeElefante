class Comentario < ActiveRecord::Base
    belongs_to :politico
    belongs_to :user
    validates :user,
           presence: true
    validates :politico,
           presence: true
    acts_as_votable
end
