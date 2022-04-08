class CreateTestingButtons < ActiveRecord::Migration[5.2]
  def change
    create_table :testing_buttons do |t|

      t.timestamps
    end
  end
end
