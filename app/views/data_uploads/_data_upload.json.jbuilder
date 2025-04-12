json.extract! data_upload, :id, :name, :file, :created_at, :updated_at
json.url data_upload_url(data_upload, format: :json)
json.file url_for(data_upload.file)
