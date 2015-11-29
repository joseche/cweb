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
      t.float :iowait
      t.float :irq
      t.float :softirq
      t.float :steal
      t.float :guest
      t.float :guest_nice
      t.float :stolen
    end
  end
end
