require 'test_helper'

class PoliticosControllerTest < ActionController::TestCase
  setup do
    @politico = politicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:politicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create politico" do
    assert_difference('Politico.count') do
      post :create, politico: { cargo_atual: @politico.cargo_atual, cargo_eleito: @politico.cargo_eleito, cidade: @politico.cidade, estado: @politico.estado, idade: @politico.idade, municipio: @politico.municipio, nome: @politico.nome, partido_id: @politico.partido_id, status: @politico.status }
    end

    assert_redirected_to politico_path(assigns(:politico))
  end

  test "should show politico" do
    get :show, id: @politico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @politico
    assert_response :success
  end

  test "should update politico" do
    patch :update, id: @politico, politico: { cargo_atual: @politico.cargo_atual, cargo_eleito: @politico.cargo_eleito, cidade: @politico.cidade, estado: @politico.estado, idade: @politico.idade, municipio: @politico.municipio, nome: @politico.nome, partido_id: @politico.partido_id, status: @politico.status }
    assert_redirected_to politico_path(assigns(:politico))
  end

  test "should destroy politico" do
    assert_difference('Politico.count', -1) do
      delete :destroy, id: @politico
    end

    assert_redirected_to politicos_path
  end
end
