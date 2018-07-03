class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string		:title, limit: 100, null: false
      t.datetime	:year, null: false
      t.string 		:description
      t.string 		:genre

      t.timestamps
    end

    add_index :movies, :title
    add_index :movies, :year
    add_index :movies, [:title, :year], unique: true
  end
end
