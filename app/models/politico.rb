class Politico < ActiveRecord::Base
  paginates_per 10
  belongs_to :partido
  belongs_to :user
  belongs_to :cargo
  has_many :comentarios
  has_many :acontecimentos
  has_attached_file :photo, styles: { medium: "600x400>", thumb: "150x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  validates :photo, attachment_presence: true
  validates_with AttachmentSizeValidator, attributes: :photo, less_than: 5.megabytes
  acts_as_votable
end
