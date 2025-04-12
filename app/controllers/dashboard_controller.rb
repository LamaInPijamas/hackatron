# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  require 'csv'
  require 'time'

  def index
    # --- Przetwarzanie pliku z danymi obciążenia (Load Data) ---
    load_upload = DataUpload.find_by(file_type: 'load')
    if load_upload.present? && load_upload.file.attached?
      load_csv = CSV.parse(load_upload.file.download, headers: true)
      time_header = load_csv.headers.include?("time") ? "time" : "_time"
      @times_load  = load_csv[time_header].map { |t| Time.parse(t) }
      @load_values = load_csv["Load (kW)"].map(&:to_f)
    else
      flash.now[:alert] = "Nie znaleziono pliku z danymi obciążenia. Proszę przesłać plik."
      @times_load  = []
      @load_values = []
    end

    # --- Przetwarzanie pliku z danymi ceny i PV (Price and PV Data) ---
    price_upload = DataUpload.find_by(file_type: 'price_panel')
    if price_upload.present? && price_upload.file.attached?
      price_csv = CSV.parse(price_upload.file.download, headers: true)
      time_header_price = price_csv.headers.include?("time") ? "time" : "_time"
      @times_price   = price_csv[time_header_price].map { |t| Time.parse(t) }
      @energy_prices = price_csv["Energy price (PLN/MWh)"].map(&:to_f)
      @pv_generation = price_csv["PV_3MW_generation (kWh)"].map(&:to_f)
    else
      flash.now[:alert] = "Nie znaleziono pliku z danymi ceny/PV. Proszę przesłać plik."
      @times_price   = []
      @energy_prices = []
      @pv_generation = []
    end

    # --- Gwarancja, że zmienne są zawsze ustawione ---
    @times_load   ||= []
    @load_values  ||= []
    @times_price  ||= []
    @energy_prices||= []
    @pv_generation||= []
  end
end
