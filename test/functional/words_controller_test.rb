require 'test_helper'

class WordsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:words)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_words
    assert_difference('Words.count') do
      post :create, :words => { }
    end

    assert_redirected_to words_path(assigns(:words))
  end

  def test_should_show_words
    get :show, :id => words(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => words(:one).id
    assert_response :success
  end

  def test_should_update_words
    put :update, :id => words(:one).id, :words => { }
    assert_redirected_to words_path(assigns(:words))
  end

  def test_should_destroy_words
    assert_difference('Words.count', -1) do
      delete :destroy, :id => words(:one).id
    end

    assert_redirected_to words_path
  end
end
