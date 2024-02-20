class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.float :latitude
      t.float :longitude
      t.boolean :visiting_now

      t.timestamps
    end
  end
end
