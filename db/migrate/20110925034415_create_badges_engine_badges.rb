class CreateBadgesEngineBadges < ActiveRecord::Migration
  def change
    create_table :badges_engine_badges do |t|
      t.integer :issuer_id
      t.string :version
      t.string :name
      t.string :image
      t.string :description
      t.string :criteria

      t.timestamps
    end
  end
end
