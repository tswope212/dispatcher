require 'test_helper'

class CoordinationsControllerTest < ActionController::TestCase
  setup do
    @coordination = coordinations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coordinations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coordination" do
    assert_difference('Coordination.count') do
      post :create, coordination: {  }
    end

    assert_redirected_to coordination_path(assigns(:coordination))
  end

  test "should show coordination" do
    get :show, id: @coordination
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coordination
    assert_response :success
  end

  test "should update coordination" do
    put :update, id: @coordination, coordination: {  }
    assert_redirected_to coordination_path(assigns(:coordination))
  end

  test "should destroy coordination" do
    assert_difference('Coordination.count', -1) do
      delete :destroy, id: @coordination
    end

    assert_redirected_to coordinations_path
  end
end
