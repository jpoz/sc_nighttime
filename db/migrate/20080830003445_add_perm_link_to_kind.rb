class AddPermLinkToKind < ActiveRecord::Migration
  def self.up
    add_column :kinds, :perm, :string
  end

  def self.down
    remove_column :kinds, :perm
  end
end
