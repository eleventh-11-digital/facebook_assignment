class AddFriendIdToFriends < ActiveRecord::Migration
	def change
		remove_column :friends, :user, :string
		add_column :friends, :happy3friends, :integer
	end
end
