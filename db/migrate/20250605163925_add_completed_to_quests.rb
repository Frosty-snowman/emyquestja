class AddCompletedToQuests < ActiveRecord::Migration[7.0]
  def change
    add_column :quests, :completed, :boolean, default: false
  end
end