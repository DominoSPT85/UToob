class Movie < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { in: 2..50}
  validates :duration, length: {maximum: 30}
  validates :genre, presence: true

  def self.by_movie_title
    order(:title)
  end

end
