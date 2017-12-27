class CreateSound < ActiveRecord::Migration[5.1]
  def change
    create_table :sounds do |t|
      t.string :name, null: false, index: true
      t.string :url, null: false
    end
  end
end
