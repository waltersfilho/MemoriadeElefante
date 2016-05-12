class Comentario < ActiveRecord::Base
    belongs_to :politico
    belongs_to :user
    acts_as_votable
    validates :user,
           presence: true
    validates :politico,
           presence: true
end
