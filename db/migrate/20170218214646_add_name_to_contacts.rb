class AddNameToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :name, :string
    add_column :contacts, :organization, :string
    add_column :contacts, :work_phone, :string
    add_column :contacts, :home_phone, :string
    add_column :contacts, :fax, :string
    add_column :contacts, :email, :string
    add_column :contacts, :url, :string
    add_column :contacts, :comments, :text
  end
end
