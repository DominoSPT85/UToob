class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :text, length: {maximum: 500}
end
