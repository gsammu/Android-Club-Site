class FixUsersPasswordColumn < ActiveRecord::Migration
  def change
    rename_column :users, :papassword_digest, :password_digest
  end
end
