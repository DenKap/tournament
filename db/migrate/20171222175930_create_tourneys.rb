class CreateTourneys < ActiveRecord::Migration[5.1]
  def change
    create_table :tourneys do |t|
      t.string  :name
      t.timestamps
    end

    add_index :tourneys, :name, unique: true
  end
end
