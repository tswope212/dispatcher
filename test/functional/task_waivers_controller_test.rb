require 'test_helper'

class TaskWaiversControllerTest < ActionController::TestCase
  setup do
    @task_waiver = task_waivers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_waivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_waiver" do
    assert_difference('TaskWaiver.count') do
      post :create, task_waiver: {  }
    end

    assert_redirected_to task_waiver_path(assigns(:task_waiver))
  end

  test "should show task_waiver" do
    get :show, id: @task_waiver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_waiver
    assert_response :success
  end

  test "should update task_waiver" do
    put :update, id: @task_waiver, task_waiver: {  }
    assert_redirected_to task_waiver_path(assigns(:task_waiver))
  end

  test "should destroy task_waiver" do
    assert_difference('TaskWaiver.count', -1) do
      delete :destroy, id: @task_waiver
    end

    assert_redirected_to task_waivers_path
  end
end
