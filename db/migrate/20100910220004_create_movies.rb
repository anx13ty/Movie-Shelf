class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :media_format
      t.string :title
      t.integer :copies_at_home
      t.integer :order
      t.text :notes
      t.integer :rating
      t.timestamps
    end
  end
  
  def self.down
    drop_table :movies
  end
end
