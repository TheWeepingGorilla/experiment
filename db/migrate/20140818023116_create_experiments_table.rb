class CreateExperimentsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.string :location
      t.datetime :start
      t.datetime :end
    end
  end
end
