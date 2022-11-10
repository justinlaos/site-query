class CreateSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :spaces do |t|
      t.belongs_to :site, foreign_key: true
      t.string :name
      t.integer :space_type, default: 0
      t.integer :square_footage, default: 0
      t.timestamps
    end
  end
end
