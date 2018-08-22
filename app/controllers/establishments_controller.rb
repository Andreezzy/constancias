class EstablishmentsController < ApplicationController
  include ApplicationHelper
  before_action :set_establishment, only: [:show, :edit, :update, :download_resolution, :download_certificado, :destroy]
  before_action :set_values_for_select, only: [:edit, :new]

  # GET /establishments
  # GET /establishments.json
  def index
    @establishments = Establishment.all
  end

  # GET /establishments/1
  # GET /establishments/1.json
  def show
  end

  # GET /establishments/new
  def new
    @establishment = Establishment.new
    4.times { @establishment.architects.build }
  end

  # GET /establishments/1/edit
  def edit
    #raise I18n.with_locale(:es) { 145.to_words }.inspect
    (4-@establishment.architects.count).times { @establishment.architects.build }
  end

  # POST /establishments
  # POST /establishments.json
  def create
    @establishment = Establishment.new(establishment_params)

    respond_to do |format|
      if @establishment.save
        format.html { redirect_to @establishment, notice: 'Establishment was successfully created.' }
        format.json { render :show, status: :created, location: @establishment }
      else
        format.html { render :new }
        format.json { render json: @establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /establishments/1
  # PATCH/PUT /establishments/1.json
  def update
    respond_to do |format|
      if @establishment.update(establishment_params)
        format.html { redirect_to @establishment, notice: 'Establishment was successfully updated.' }
        format.json { render :show, status: :ok, location: @establishment }
      else
        format.html { render :edit }
        format.json { render json: @establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /establishments/1
  # DELETE /establishments/1.json
  def destroy
    @establishment.destroy
    respond_to do |format|
      format.html { redirect_to establishments_url, notice: 'Establishment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download_resolution
    #raise @establishment.dispone?.inspect
    type_resolution = @establishment.tipo_inspeccion
    @establishment.update(generate_resolution: true)
    template = Sablon.template(File.expand_path("#{Rails.root}/public/resolucion-#{type_resolution}.docx"))
    context = {
      EL_O_LA: @establishment.set_el_o_la,
      sr_o_sra: @establishment.genero_propietario,
      APELLIDOS_Y_NOMBRES_O_RAZON_SOCIAL_: @establishment.nombre_propietario,
      NOMBRE: @establishment.nombre,
      AVJRPASAJE: @establishment.set_tipo_direccion,
      DIRECCION: @establishment.direccion,
      FECHA_DE_INSPECCION: @establishment.set_fecha_inspeccion(@establishment.primera_inspeccion),
      del_prresente_año: "del presente año",
      CUMPLE_01: set_boolean(@establishment.cumple),
      disponer: @establishment.dispone?,
      DEL_O_DE_LA: @establishment.set_del_o_de_la
    }
    template.render_to_file File.expand_path("#{Rails.root}/public/resolucion.docx"), context
    
    send_file(
      "#{Rails.root}/public/resolucion.docx",
      filename: "resolucion-#{@establishment.id}.docx",
      type: "application/docx"
    )
  end

  def download_certificado
    type_resolution = @establishment.tipo_inspeccion
    template = Sablon.template(File.expand_path("#{Rails.root}/public/certificado-#{type_resolution}.docx"))
    context = {
      EL_O_LA: "el",
      sr_o_sra: "Sr",
      APELLIDOS_Y_NOMBRES_O_RAZON_SOCIAL_: "JESUS ANTONY ARRATIA CAMA",
      NOMBRE: "BODEGA ARRATIA",
      AVJRPASAJE: "pasaje",
      DIRECCION: "Av. 28 de Agosto",
    }
    template.render_to_file File.expand_path("#{Rails.root}/public/certificado.docx"), context
    
    send_file(
      "#{Rails.root}/public/certificado.docx",
      filename: "certificado-#{@establishment.id}.docx",
      type: "application/docx"
    )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_establishment
      @establishment = Establishment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def establishment_params
      params.require(:establishment).permit(:nombre, :direccion, :tipo_direccion, :nombre_propietario, :genero_propietario, :num_soli, :aforo, :letras_aforo, :actividad, :area, :primera_inspeccion, :segunda_inspeccion, :cumple, :cumple_2, :num_recibo, :num_resolucion, :tipo_inspeccion, :riesgo, architects_attributes: [:id, :nombre])
    end

    def set_values_for_select
      @tipo_direccion = Establishment.tipo_direccions.map { |c| [c[0].titleize, c[0]] }
      @genero_propietario = Establishment.genero_propietarios.map { |c| [c[0].titleize, c[0]] }
      @actividad = Establishment.actividads.map { |c| [c[0].titleize, c[0]] }
      @tipo_inspeccion = Establishment.tipo_inspeccions.map { |c| [c[0].titleize, c[0]] }
      @riesgo = Establishment.riesgos.map { |c| [c[0].titleize, c[0]] }
    end
end
