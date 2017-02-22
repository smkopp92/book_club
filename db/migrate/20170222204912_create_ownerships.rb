class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.integer :book_id, null: false
      t.belongs_to :user, null: false
    end
  end
end
