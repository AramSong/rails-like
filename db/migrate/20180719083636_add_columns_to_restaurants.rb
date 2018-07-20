class AddColumnsToRestaurants < ActiveRecord::Migration[5.0]
  def change
    # add_column :DB명, :컬럼명, :타입
    add_column :restaurants, :contents,			:text
  end
end
