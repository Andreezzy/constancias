require 'test_helper'

class EstablishmentsControllerTest < ActionController::TestCase
  setup do
    @establishment = establishments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:establishments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create establishment" do
    assert_difference('Establishment.count') do
      post :create, establishment: { actividad: @establishment.actividad, aforo: @establishment.aforo, area: @establishment.area, cumple: @establishment.cumple, direccion: @establishment.direccion, genero_propietario: @establishment.genero_propietario, letras_aforo: @establishment.letras_aforo, nombre: @establishment.nombre, nombre_propietario: @establishment.nombre_propietario, num_recibo: @establishment.num_recibo, num_resolucion: @establishment.num_resolucion, num_soli: @establishment.num_soli, primera_inspeccion: @establishment.primera_inspeccion, riesgo: @establishment.riesgo, segunda_inspeccion: @establishment.segunda_inspeccion, tipo_direccion: @establishment.tipo_direccion, tipo_inspeccion: @establishment.tipo_inspeccion }
    end

    assert_redirected_to establishment_path(assigns(:establishment))
  end

  test "should show establishment" do
    get :show, id: @establishment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @establishment
    assert_response :success
  end

  test "should update establishment" do
    patch :update, id: @establishment, establishment: { actividad: @establishment.actividad, aforo: @establishment.aforo, area: @establishment.area, cumple: @establishment.cumple, direccion: @establishment.direccion, genero_propietario: @establishment.genero_propietario, letras_aforo: @establishment.letras_aforo, nombre: @establishment.nombre, nombre_propietario: @establishment.nombre_propietario, num_recibo: @establishment.num_recibo, num_resolucion: @establishment.num_resolucion, num_soli: @establishment.num_soli, primera_inspeccion: @establishment.primera_inspeccion, riesgo: @establishment.riesgo, segunda_inspeccion: @establishment.segunda_inspeccion, tipo_direccion: @establishment.tipo_direccion, tipo_inspeccion: @establishment.tipo_inspeccion }
    assert_redirected_to establishment_path(assigns(:establishment))
  end

  test "should destroy establishment" do
    assert_difference('Establishment.count', -1) do
      delete :destroy, id: @establishment
    end

    assert_redirected_to establishments_path
  end
end
