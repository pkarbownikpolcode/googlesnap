require 'test_helper'

class GqueriesControllerTest < ActionController::TestCase
  setup do
    @gquery = gqueries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gqueries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gquery" do
    assert_difference('Gquery.count') do
      post :create, gquery: { interval: @gquery.interval, question: @gquery.question, user_id: @gquery.user_id }
    end

    assert_redirected_to gquery_path(assigns(:gquery))
  end

  test "should show gquery" do
    get :show, id: @gquery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gquery
    assert_response :success
  end

  test "should update gquery" do
    put :update, id: @gquery, gquery: { interval: @gquery.interval, question: @gquery.question, user_id: @gquery.user_id }
    assert_redirected_to gquery_path(assigns(:gquery))
  end

  test "should destroy gquery" do
    assert_difference('Gquery.count', -1) do
      delete :destroy, id: @gquery
    end

    assert_redirected_to gqueries_path
  end
end
