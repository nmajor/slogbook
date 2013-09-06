require 'test_helper'

class SlogsControllerTest < ActionController::TestCase
  setup do
    @slog = slogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slog" do
    assert_difference('Slog.count') do
      post :create, slog: { body: @slog.body, title: @slog.title, user_id: @slog.user_id }
    end

    assert_redirected_to slog_path(assigns(:slog))
  end

  test "should show slog" do
    get :show, id: @slog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @slog
    assert_response :success
  end

  test "should update slog" do
    put :update, id: @slog, slog: { body: @slog.body, title: @slog.title, user_id: @slog.user_id }
    assert_redirected_to slog_path(assigns(:slog))
  end

  test "should destroy slog" do
    assert_difference('Slog.count', -1) do
      delete :destroy, id: @slog
    end

    assert_redirected_to slogs_path
  end
end
