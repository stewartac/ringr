class AddSportsToTeams < ActiveRecord::Migration[6.0]
  def change
            add_column :teams, :sport, :text
  end
end
