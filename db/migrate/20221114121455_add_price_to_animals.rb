class AddPriceToAnimals < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :price, :integer
  end
end
