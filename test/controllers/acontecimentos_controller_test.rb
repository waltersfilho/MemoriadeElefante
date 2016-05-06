require 'test_helper'

class AcontecimentosControllerTest < ActionController::TestCase
  setup do
    @acontecimento = acontecimentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acontecimentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acontecimento" do
    assert_difference('Acontecimento.count') do
      post :create, acontecimento: { descricao: @acontecimento.descricao, link: @acontecimento.link, titulo: @acontecimento.titulo }
    end

    assert_redirected_to acontecimento_path(assigns(:acontecimento))
  end

  test "should show acontecimento" do
    get :show, id: @acontecimento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acontecimento
    assert_response :success
  end

  test "should update acontecimento" do
    patch :update, id: @acontecimento, acontecimento: { descricao: @acontecimento.descricao, link: @acontecimento.link, titulo: @acontecimento.titulo }
    assert_redirected_to acontecimento_path(assigns(:acontecimento))
  end

  test "should destroy acontecimento" do
    assert_difference('Acontecimento.count', -1) do
      delete :destroy, id: @acontecimento
    end

    assert_redirected_to acontecimentos_path
  end
end
