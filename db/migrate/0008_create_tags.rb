class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tagname
      t.references :host, index: true, foreign_key: true
      t.boolean :auto, default: true

      t.timestamps null: false
    end
  end
end
