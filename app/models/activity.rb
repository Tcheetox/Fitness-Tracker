class Activity < ApplicationRecord
    validates :name, presence: true
    validates :date, presence: true
    validates :duration, presence: true
end
