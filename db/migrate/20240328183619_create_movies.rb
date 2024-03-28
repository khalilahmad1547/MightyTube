# rubocop:disable Metrics/MethodLength
# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false, default: ''
      t.integer :tmdb_id, null: false, default: 0
      t.string :imdb_id, null: false, default: ''
      t.boolean :adult, null: false, default: false
      t.text :overview, null: false, default: ''
      t.integer :vote_average, null: false, default: 0
      t.integer :vote_count, null: false, default: 0
      t.date :release_date, null: false, default: -> { 'CURRENT_DATE' }

      t.timestamps
    end
    add_index :movies, :tmdb_id, unique: true
    add_index :movies, :imdb_id, unique: true
  end
end

# rubocop:enable Metrics/MethodLength
