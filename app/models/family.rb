class Family < ApplicationRecord
    has_one_attached :image
    has_many :scores, dependent: :delete_all
    validates :family_name, presence: true 
    validates :image, presence: true 
    validates :family_pr, presence: true 
    validates :point, presence: true 
end
