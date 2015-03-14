class CreateJoinTableMutantTeam < ActiveRecord::Migration
  def change
    create_join_table :mutants, :teams do |t|
      t.index [:mutant_id, :team_id]
      t.index [:team_id, :mutant_id]
    end
  end
end
