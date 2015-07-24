class ChangeCoinsDefaultInUsers < ActiveRecord::Migration
  def change
  	    change_column :users, :coins, :integer, :default => 0
  end
end
