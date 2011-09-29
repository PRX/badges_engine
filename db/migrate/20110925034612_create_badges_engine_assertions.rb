class CreateBadgesEngineAssertions < ActiveRecord::Migration
  def change
    create_table :badges_engine_assertions do |t|
      t.integer :user_id
      t.integer :badge_id
      t.string :evidence
      t.date :expires
      t.date :issued_on
      
      t.string :token
      t.boolean :is_baked
      
      t.timestamps
    end
  end
end
