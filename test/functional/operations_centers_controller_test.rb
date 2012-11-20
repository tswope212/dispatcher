require 'test_helper'

class OperationsCentersControllerTest < ActionController::TestCase
  setup do
    @operations_center = operations_centers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operations_centers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operations_center" do
    assert_difference('OperationsCenter.count') do
      post :create, operations_center: { description: @operations_center.description, name: @operations_center.name }
    end

    assert_redirected_to operations_center_path(assigns(:operations_center))
  end

  test "should show operations_center" do
    get :show, id: @operations_center
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operations_center
    assert_response :success
  end

  test "should update operations_center" do
    put :update, id: @operations_center, operations_center: { description: @operations_center.description, name: @operations_center.name }
    assert_redirected_to operations_center_path(assigns(:operations_center))
  end

  test "should destroy operations_center" do
    assert_difference('OperationsCenter.count', -1) do
      delete :destroy, id: @operations_center
    end

    assert_redirected_to operations_centers_path
  end
end
