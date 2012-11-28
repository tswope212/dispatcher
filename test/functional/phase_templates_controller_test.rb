require 'test_helper'

class PhaseTemplatesControllerTest < ActionController::TestCase
  setup do
    @phase_template = phase_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phase_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phase_template" do
    assert_difference('PhaseTemplate.count') do
      post :create, phase_template: { name: @phase_template.name }
    end

    assert_redirected_to phase_template_path(assigns(:phase_template))
  end

  test "should show phase_template" do
    get :show, id: @phase_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phase_template
    assert_response :success
  end

  test "should update phase_template" do
    put :update, id: @phase_template, phase_template: { name: @phase_template.name }
    assert_redirected_to phase_template_path(assigns(:phase_template))
  end

  test "should destroy phase_template" do
    assert_difference('PhaseTemplate.count', -1) do
      delete :destroy, id: @phase_template
    end

    assert_redirected_to phase_templates_path
  end
end
