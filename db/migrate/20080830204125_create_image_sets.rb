class CreateImageSets < ActiveRecord::Migration
  def self.up
    create_table :image_sets do |t|
      t.string :name
      t.string :perm

      t.timestamps
    end
  end

  def self.down
    drop_table :image_sets
  end
end
