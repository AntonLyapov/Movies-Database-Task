class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string	:text
      t.timestamps

      t.belongs_to :user,	foreign_key: true
      t.belongs_to :movie, 	foreign_key: true
    end
  end
end
