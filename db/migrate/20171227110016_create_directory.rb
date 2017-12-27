class CreateDirectory < ActiveRecord::Migration[5.1]
  def change
    create_table :directories do |t|
      t.string :name
      t.belongs_to :user, index: true
    end

    add_reference :directories, :parent, references: :directories, index: true
    add_foreign_key :directories, :directories, column: :parent_id
  end
end
