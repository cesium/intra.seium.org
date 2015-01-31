class AddEditionsRelations < ActiveRecord::Migration
  def change
		change_table :activities do |t|
			t.belongs_to :edition, index: true
		end

		create_table :companies_editions, id:false do |t|
			t.belongs_to :company, index: true
			t.belongs_to :edition, index: true
		end

		create_table :editions_users, id:false do |t|
			t.belongs_to :edition, index: true
			t.belongs_to :user, index: true
		end

		create_table :editions_speakers, id:false do |t|
			t.belongs_to :edition, index: true
			t.belongs_to :speaker, index: true
		end
  end
end
