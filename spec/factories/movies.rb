# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    sequence(:tmdb_id) { |n| n }
    sequence(:imdb_id) { |n| "MyString#{n}" }
    adult { false }
    overview { 'MyText' }
    vote_average { 1 }
    vote_count { 1 }
    release_date { '2024-03-28' }
  end
end
