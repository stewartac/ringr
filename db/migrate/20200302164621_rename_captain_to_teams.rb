class RenameCaptainToTeams < ActiveRecord::Migration[6.0]
  def change
    rename_column :teams, :user_id, :captain_id
  end
end
