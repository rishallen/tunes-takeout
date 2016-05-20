class OmniAuthUser < ActiveRecord::Migration
  def change
    remove_column :users, :confirm_password
    add_column :users, :email, :string       # for the unique user identifier from the provider

  end
end
