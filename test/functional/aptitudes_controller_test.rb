require 'test_helper'

class AptitudesControllerTest < ActionController::TestCase
  setup do
    @aptitude = aptitudes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aptitudes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aptitude" do
    assert_difference('Aptitude.count') do
      post :create, aptitude: { description: @aptitude.description, level: @aptitude.level }
    end

    assert_redirected_to aptitude_path(assigns(:aptitude))
  end

  test "should show aptitude" do
    get :show, id: @aptitude
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aptitude
    assert_response :success
  end

  test "should update aptitude" do
    put :update, id: @aptitude, aptitude: { description: @aptitude.description, level: @aptitude.level }
    assert_redirected_to aptitude_path(assigns(:aptitude))
  end

  test "should destroy aptitude" do
    assert_difference('Aptitude.count', -1) do
      delete :destroy, id: @aptitude
    end

    assert_redirected_to aptitudes_path
  end
end
