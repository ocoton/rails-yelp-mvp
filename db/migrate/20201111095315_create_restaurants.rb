class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name, presence: true
      t.string :address, presence: true
      t.string :phone_number
      t.string :category, inclusion: { in: %w[chinese italian japanese french belgian],
        message: "#{value} is not a valid category" }
# add validates
      t.timestamps
    end
  end
end
