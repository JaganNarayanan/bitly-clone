class AddShortIndexToUrls < ActiveRecord::Migration[5.1]
	def change
		add_index :urls, :short, :unique => true 
	end
end
