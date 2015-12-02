class CreateSwapmems < ActiveRecord::Migration
  def change
    create_table :swapmems do |t|
      t.timestamp :dt
      t.references :host
      t.integer :total, :limit => 8
      t.integer :used, :limit => 8
      t.float :usedpercent
      t.integer :free, :limit => 8
      t.integer :active, :limit => 8
      t.integer :sin, :limit => 8
      t.integer :sout, :limit => 8
    end
  end
end
