class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.references  :make
      t.references  :user
      t.string      :vin
      t.string      :plate_number
      t.string      :pop_features
      t.boolean     :for_sale, :default => false
      t.boolean     :approved, :default => false
      t.string      :image1
      t.string      :image2
      t.string      :image3
      t.string      :image4
      t.string      :image5
      t.string      :image6
      
      t.timestamps
    end
  end
end
