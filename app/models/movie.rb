# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :title, presence: true
  validates :tmdb_id, presence: true, numericality: { only_integer: true }
  validates :imdb_id, presence: true
  validates :adult, inclusion: { in: [true, false] }
  validates :overview, presence: true
  validates :vote_average, presence: true, numericality: { only_integer: true }
  validates :vote_count, presence: true, numericality: { only_integer: true }
  validates :release_date, presence: true
end
