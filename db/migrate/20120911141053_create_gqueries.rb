class CreateGqueries < ActiveRecord::Migration
  def change
    create_table :gqueries do |t|
      t.string :question
      t.integer :interval
      t.integer :user_id

      t.timestamps
    end
  end
end
