class CreateExperimentsScientists < ActiveRecord::Migration
  def change
    create_table :experiments_scientists do |t|
      t.integer :experiment_id
      t.integer :scientist_id
    end
  end
end
