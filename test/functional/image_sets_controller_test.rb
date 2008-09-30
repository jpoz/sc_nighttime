require 'test_helper'

class ImageSetsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:image_sets)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_image_set
    assert_difference('ImageSet.count') do
      post :create, :image_set => { }
    end

    assert_redirected_to image_set_path(assigns(:image_set))
  end

  def test_should_show_image_set
    get :show, :id => image_sets(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => image_sets(:one).id
    assert_response :success
  end

  def test_should_update_image_set
    put :update, :id => image_sets(:one).id, :image_set => { }
    assert_redirected_to image_set_path(assigns(:image_set))
  end

  def test_should_destroy_image_set
    assert_difference('ImageSet.count', -1) do
      delete :destroy, :id => image_sets(:one).id
    end

    assert_redirected_to image_sets_path
  end
end
