class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.belongs_to :portfolio, foreign_key: true
      t.string :name
      t.string :address
      t.timestamps
    end
  end
end
