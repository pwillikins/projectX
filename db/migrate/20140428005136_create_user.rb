class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :band_name
      t.string :tour_info
    end
  end
end
