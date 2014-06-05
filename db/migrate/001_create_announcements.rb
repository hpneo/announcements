class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :content
      t.references :user
      t.string :semester
      t.timestamps
    end
    add_index :announcements, :user_id
  end
end
