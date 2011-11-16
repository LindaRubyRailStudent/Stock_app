require 'test_helper'

class StockResourcesControllerTest < ActionController::TestCase
  setup do
    @stock_resource = stock_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_resource" do
    assert_difference('StockResource.count') do
      post :create, stock_resource: @stock_resource.attributes
    end

    assert_redirected_to stock_resource_path(assigns(:stock_resource))
  end

  test "should show stock_resource" do
    get :show, id: @stock_resource.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_resource.to_param
    assert_response :success
  end

  test "should update stock_resource" do
    put :update, id: @stock_resource.to_param, stock_resource: @stock_resource.attributes
    assert_redirected_to stock_resource_path(assigns(:stock_resource))
  end

  test "should destroy stock_resource" do
    assert_difference('StockResource.count', -1) do
      delete :destroy, id: @stock_resource.to_param
    end

    assert_redirected_to stock_resources_path
  end
end
