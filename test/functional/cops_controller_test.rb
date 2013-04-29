require 'test_helper'

class CopsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Cop.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Cop.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Cop.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to cop_url(assigns(:cop))
  end

  def test_edit
    get :edit, :id => Cop.first
    assert_template 'edit'
  end

  def test_update_invalid
    Cop.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Cop.first
    assert_template 'edit'
  end

  def test_update_valid
    Cop.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Cop.first
    assert_redirected_to cop_url(assigns(:cop))
  end

  def test_destroy
    cop = Cop.first
    delete :destroy, :id => cop
    assert_redirected_to cops_url
    assert !Cop.exists?(cop.id)
  end
end
