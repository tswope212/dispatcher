require 'test_helper'

class TeamAdminsControllerTest < ActionController::TestCase
  setup do
    @team_admin = team_admins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_admins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_admin" do
    assert_difference('TeamAdmin.count') do
      post :create, team_admin: {  }
    end

    assert_redirected_to team_admin_path(assigns(:team_admin))
  end

  test "should show team_admin" do
    get :show, id: @team_admin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team_admin
    assert_response :success
  end

  test "should update team_admin" do
    put :update, id: @team_admin, team_admin: {  }
    assert_redirected_to team_admin_path(assigns(:team_admin))
  end

  test "should destroy team_admin" do
    assert_difference('TeamAdmin.count', -1) do
      delete :destroy, id: @team_admin
    end

    assert_redirected_to team_admins_path
  end
end
