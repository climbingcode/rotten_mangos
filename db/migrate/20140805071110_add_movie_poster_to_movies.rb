class AddMoviePosterToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :movieposter, :string
  end
end
