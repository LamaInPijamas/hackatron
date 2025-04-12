class DataUploadsController < ApplicationController
  before_action :set_data_upload, only: %i[ show edit update destroy ]

  # GET /data_uploads or /data_uploads.json
  def index
    @data_uploads = DataUpload.all
  end

  # GET /data_uploads/1 or /data_uploads/1.json
  def show
  end

  # GET /data_uploads/new
  def new
    @data_upload = DataUpload.new
  end

  # GET /data_uploads/1/edit
  def edit
  end

  # POST /data_uploads or /data_uploads.json
  def create
    @data_upload = DataUpload.new(data_upload_params)

    respond_to do |format|
      if @data_upload.save
        format.html { redirect_to @data_upload, notice: "Data upload was successfully created." }
        format.json { render :show, status: :created, location: @data_upload }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @data_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_uploads/1 or /data_uploads/1.json
  def update
    respond_to do |format|
      if @data_upload.update(data_upload_params)
        format.html { redirect_to @data_upload, notice: "Data upload was successfully updated." }
        format.json { render :show, status: :ok, location: @data_upload }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @data_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_uploads/1 or /data_uploads/1.json
  def destroy
    @data_upload.destroy!

    respond_to do |format|
      format.html { redirect_to data_uploads_path, status: :see_other, notice: "Data upload was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_data_upload
    # Use params[:id] or params.require(:id) – the important part is to access the ID correctly.
    @data_upload = DataUpload.find(params[:id])
  end

  def data_upload_params
    # Permit file_type along with name and file.
    params.require(:data_upload).permit(:name, :file, :file_type)
  end
end
