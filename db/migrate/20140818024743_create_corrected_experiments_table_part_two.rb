class CreateCorrectedExperimentsTablePartTwo < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :description
      t.string :location
      t.datetime :start
      t.datetime :end
    end
    drop_table :events
  end
end


