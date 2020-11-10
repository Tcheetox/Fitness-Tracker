class Activity < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :duration, presence: true
  validates :rating, presence: true
  validates :user_id, presence: true
  enum name: {
         swimming: 0,
         running: 1,
         biking: 2,
         badminton: 3,
         basketball: 4,
         boxing: 5,
         fitness: 6,
         football: 7,
         gym: 8,
         judo: 9,
         motorbiking: 10,
         rugby: 11,
         tennis: 12,
         yoga: 13
       }
end
