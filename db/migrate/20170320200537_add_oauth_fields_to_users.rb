class AddOauthFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :token, :string
    add_column :users, :secret, :string
    add_column :users, :oauth_data, :text

    add_index :users, [:provider, :uid]

    # currently the following index is set to have unique
  	# email addresses which will also not allow multiple users 
  	# with blank emails
  	# notice we didn't use unique true when we added the index again
  	remove_index :users, :email
  	add_index :users, :email
  end
end
