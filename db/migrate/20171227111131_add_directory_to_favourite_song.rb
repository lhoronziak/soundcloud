class AddDirectoryToFavouriteSong < ActiveRecord::Migration[5.1]
  def change
    add_reference :favourite_sounds, :directory, foreign_key: true
  end
end
