class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :hostname
      t.string :signature
      t.string :clientip
      t.string :internalip
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
