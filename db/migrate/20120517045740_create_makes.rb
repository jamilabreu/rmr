class CreateMakes < ActiveRecord::Migration
  def change
    create_table :makes do |t|
      t.integer   :make_id
      t.string    :make
      t.string    :make_slug
      t.string    :name
      t.string    :trim
      t.integer   :year
      t.string    :body
      t.string    :engine_position
      t.integer   :engine_cc
      t.integer   :engine_num_cyl
      t.string    :engine_type
      t.integer   :engine_valves_per_cyl
      t.integer   :engine_rpm
      t.integer   :engine_torque_rpm
      t.string    :engine_fuel
      t.integer   :top_speed
      t.string    :drive
      t.string    :transmission      
      t.integer   :seats
      t.integer   :doors
      t.float     :weight
      t.float     :length
      t.float     :width
      t.float     :height
      
      t.timestamps
    end
  end
end
