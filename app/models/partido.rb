class Partido < ActiveRecord::Base
    has_many :politico
    has_attached_file :photo, styles: { medium: "600x400>", thumb: "150x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
    validates :photo, attachment_presence: true
    validates_with AttachmentSizeValidator, attributes: :photo, less_than: 5.megabytes
end
