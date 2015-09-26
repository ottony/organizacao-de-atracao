class AddReferencesUserAttraction < ActiveRecord::Migration
  def change
    add_reference :attractions, :user, index: true
  end
end
