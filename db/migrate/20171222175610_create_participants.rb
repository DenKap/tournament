class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.references(:tourney, index: true)
      t.references(:team, index: true)
      t.timestamps
    end
  end
end
