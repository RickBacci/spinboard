class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :url
      t.string :user_id

      t.timestamps null: false
    end
  end
end
