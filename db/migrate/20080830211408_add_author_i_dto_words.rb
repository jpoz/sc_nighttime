class AddAuthorIDtoWords < ActiveRecord::Migration
  def self.up
    add_column :words, :author_id, :integer
  end

  def self.down
    remove_column :words, :author_id
  end
end
