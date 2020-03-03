class RemoveCaptainFromTeams < ActiveRecord::Migration[6.0]
  def change
    remove_column :teams, :captain_id
    add_reference :teams, :user
  end
end
