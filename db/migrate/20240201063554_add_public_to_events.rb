class AddPublicToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :public, :boolean, default: false
  end
end
