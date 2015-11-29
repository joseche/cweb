class CreateCputimes < ActiveRecord::Migration
  def change
    create_table :cputimes do |t|
      t.timestamp :dt
      t.references :host
      t.string :cpuname
      t.float :user
      t.float :sys
      t.float :idle
      t.float :nice
    end
  end
end
