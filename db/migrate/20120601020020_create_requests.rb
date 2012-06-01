class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :car
      t.references :user

      t.timestamps
    end
    add_index :requests, :car_id
    add_index :requests, :user_id
  end
end
