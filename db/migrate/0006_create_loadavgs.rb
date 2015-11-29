class CreateLoadavgs < ActiveRecord::Migration
  def change
    create_table :loadavgs do |t|
      t.timestamp :dt
      t.references :host
      t.float :load1
      t.float :load5
      t.float :load15
    end
  end
end
