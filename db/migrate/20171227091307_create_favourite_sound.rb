class CreateFavouriteSound < ActiveRecord::Migration[5.1]
  def change
    create_table :favourite_sounds do |t|
      t.belongs_to :user, index: true
      t.belongs_to :sound, index: true
      t.timestamps
    end

    add_index :favourite_sounds, [:user_id, :sound_id], unique: true
  end
end
