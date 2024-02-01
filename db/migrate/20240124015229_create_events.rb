# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.float :price
      t.datetime :date

      t.timestamps
    end
  end
end
