class EstablishmentsController < ApplicationController
  before_action :set_establishment, only: [:show, :edit, :update, :download, :destroy]
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

  def download
    #template = Sablon.template(File.expand_path("#{Rails.root}/public/recipe_template.docx"))
    template = Sablon.template(File.expand_path("#{Rails.root}/public/1.-RESOLUCION.docx"))
    context = {
      EL_O_LA: "el",
      sr_o_sra: "Sr",
      APELLIDOS_Y_NOMBRES_O_RAZON_SOCIAL_: "JESUS ANTONY ARRATIA CAMA",
      NOMBRE: "BODEGA ARRATIA",
      AVJRPASAJE: "pasaje",
      DIRECCION: "Av. 28 de Agosto",
    }
    template.render_to_file File.expand_path("#{Rails.root}/public/constancia.docx"), context
    
    send_file(
      "#{Rails.root}/public/constancia.docx",
      filename: "mi_constancia.docx",
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
      params.require(:establishment).permit(:nombre, :direccion, :tipo_direccion, :nombre_propietario, :genero_propietario, :num_soli, :aforo, :letras_aforo, :actividad, :area, :primera_inspeccion, :segunda_inspeccion, :cumple, :num_recibo, :num_resolucion, :tipo_inspeccion, :riesgo, architects_attributes: [:id, :nombre])
    end

    def set_values_for_select
      @tipo_direccion = Establishment.tipo_direccions.map { |c| [c[0].titleize, c[0]] }
      @genero_propietario = Establishment.genero_propietarios.map { |c| [c[0].titleize, c[0]] }
      @actividad = Establishment.actividads.map { |c| [c[0].titleize, c[0]] }
      @tipo_inspeccion = Establishment.tipo_inspeccions.map { |c| [c[0].titleize, c[0]] }
      @riesgo = Establishment.riesgos.map { |c| [c[0].titleize, c[0]] }
    end
end
