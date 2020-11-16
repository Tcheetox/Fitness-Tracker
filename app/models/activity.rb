class Activity < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :date, presence: true
  validates :duration, presence: true
  validates :rating, presence: true
  validates :user_id, presence: true

  enum rating: { awful: 0, bad: 1, neutral: 2, good: 3, excellent: 4 }

  enum name: {
         swimming: 0,
         running: 1,
         biking: 2,
         badminton: 3,
         basketball: 4,
         boxing: 5,
         fitness: 6,
         football: 7,
         gymnastic: 8,
         judo: 9,
         motorbiking: 10,
         rugby: 11,
         tennis: 12,
         yoga: 13
       }

  def kcal
    {
      'swimming' => 7,
      'running' => 10,
      'biking' => 8,
      'badminton' => 6,
      'basketball' => 7,
      'boxing' => 8,
      'fitness' => 9,
      'football' => 7,
      'gymnastic' => 4,
      'judo' => 9,
      'motorbiking' => 6,
      'rugby' => 7,
      'tennis' => 13,
      'yoga' => 3
    }[
      name
    ] * duration
  end

  def self.dist(_name)
    {
      'swimming' => true,
      'running' => true,
      'biking' => true,
      'badminton' => false,
      'basketball' => false,
      'boxing' => false,
      'fitness' => false,
      'football' => false,
      'gymnastic' => false,
      'judo' => false,
      'motorbiking' => true,
      'rugby' => false,
      'tennis' => false,
      'yoga' => false
    }[
      _name
    ]
  end

  def dist
    Activity.dist(name)
  end

  def has_dist
    dist && !distance.blank? ? true : false
  end

  def pace
    has_dist ? distance / duration : 0
  end
end
