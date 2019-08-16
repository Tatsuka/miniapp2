class RemoveNameFromTopics < ActiveRecord::Migration[5.2]
  def change
    remove_column :topics, :name, :string
  end
end
