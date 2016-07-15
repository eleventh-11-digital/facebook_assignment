class CreateFriends < ActiveRecord::Migration
	def change
		create_table :friends do |t|
			t.integer :user_id
			t.string :users
			t.timestamps null:false
		end
	end
end
