class AddUsernameToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :username, :string
  end
end
