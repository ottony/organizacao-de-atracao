class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string   :title
      t.string   :media
      t.datetime :day

      t.timestamps null: false
    end
  end
end
