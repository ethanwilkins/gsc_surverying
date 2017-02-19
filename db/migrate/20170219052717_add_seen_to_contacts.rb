class AddSeenToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :seen, :boolean
  end
end
