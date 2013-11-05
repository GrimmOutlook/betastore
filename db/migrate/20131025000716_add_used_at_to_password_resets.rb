class AddUsedAtToPasswordResets < ActiveRecord::Migration
  def change
    add_column :password_resets, :used_at, :timestamp
  end
end
