class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.integer :click_count
      t.text :long_url
      t.string :short_url

      t.timestamps
    end
  end
end
