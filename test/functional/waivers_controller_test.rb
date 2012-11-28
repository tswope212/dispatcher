require 'test_helper'

class WaiversControllerTest < ActionController::TestCase
  setup do
    @waiver = waivers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:waivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create waiver" do
    assert_difference('Waiver.count') do
      post :create, waiver: { signature_type: @waiver.signature_type, text: @waiver.text }
    end

    assert_redirected_to waiver_path(assigns(:waiver))
  end

  test "should show waiver" do
    get :show, id: @waiver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @waiver
    assert_response :success
  end

  test "should update waiver" do
    put :update, id: @waiver, waiver: { signature_type: @waiver.signature_type, text: @waiver.text }
    assert_redirected_to waiver_path(assigns(:waiver))
  end

  test "should destroy waiver" do
    assert_difference('Waiver.count', -1) do
      delete :destroy, id: @waiver
    end

    assert_redirected_to waivers_path
  end
end
