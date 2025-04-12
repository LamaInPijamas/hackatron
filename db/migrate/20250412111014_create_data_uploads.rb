class CreateDataUploads < ActiveRecord::Migration[8.0]
  def change
    create_table :data_uploads do |t|
      t.string :name

      t.timestamps
    end
  end
end
