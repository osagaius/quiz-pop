class CreateStatistics < ActiveRecord::Migration
	def change
		create_table :statistics do |t|

			t.timestamps null: false
			t.integer :user_id
			t.string :category
			t.boolean :correct
			t.string :question

		end
	end
end
