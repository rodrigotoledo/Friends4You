class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :latitude
      t.string :longitude
      t.boolean :visiting_now

      t.timestamps
    end
  end
end
