class CreateVirtualmems < ActiveRecord::Migration
  def change
    create_table :virtualmems do |t|
      t.timestamp :dt
      t.references :host
      t.integer :total, :limit => 8
      t.integer :available, :limit => 8
      t.integer :used, :limit => 8
      t.float :usedpercent
      t.integer :free, :limit => 8
      t.integer :active, :limit => 8
      t.integer :inactive, :limit => 8
      t.integer :buffers, :limit => 8
      t.integer :cached, :limit => 8
      t.integer :wired, :limit => 8
      t.integer :shared, :limit => 8
    end
  end
end
