class CreateActivations < ActiveRecord::Migration
  def change
    create_table :activations do |t|
      t.string :key
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
