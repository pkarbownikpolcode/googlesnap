class CreateGresults < ActiveRecord::Migration
  def change
    create_table :gresults do |t|
      t.string :title
      t.string :url
      t.integer :position
      t.integer :gquery_id

      t.timestamps
    end
  end
end
