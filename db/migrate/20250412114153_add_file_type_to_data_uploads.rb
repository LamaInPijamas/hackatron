class AddFileTypeToDataUploads < ActiveRecord::Migration[8.0]
  def change
    add_column :data_uploads, :file_type, :string
  end
end
