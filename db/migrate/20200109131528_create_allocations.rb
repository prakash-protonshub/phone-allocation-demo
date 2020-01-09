class CreateAllocations < ActiveRecord::Migration[5.2]
  def change
    create_table :allocations do |t|
    	t.decimal :number
      t.timestamps
    end
  end
end
