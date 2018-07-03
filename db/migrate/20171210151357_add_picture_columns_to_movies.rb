class AddPictureColumnsToMovies < ActiveRecord::Migration[5.1]
  def up
    add_attachment :movies, :picture
  end

  def down
    remove_attachment :movies, :picture
  end
end
