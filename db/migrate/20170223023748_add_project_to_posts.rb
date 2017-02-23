class AddProjectToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :project, :string
    add_column :posts, :section, :string
  end
end
