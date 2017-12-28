class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.integer    :team_owner_id
      t.string     :name
      t.attachment :logo
      t.timestamps
    end

    add_index :teams, :name, unique: true
  end
end
