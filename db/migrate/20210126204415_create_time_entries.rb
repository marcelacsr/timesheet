class CreateTimeEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :time_entries do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.datetime :date
      t.datetime :first_period_in
      t.datetime :first_period_out
      t.datetime :second_period_in
      t.datetime :second_period_out
      t.timestamps
    end
  end
end
