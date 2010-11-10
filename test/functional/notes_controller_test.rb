require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @note = notes(:one)
    @another = notes :two #esta no es de lfborjas
    sign_in users :lfborjas
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create note" do
    assert_difference('Note.count') do
      post :create, :note => @note.attributes
    end

    assert_redirected_to note_path(assigns(:note))
  end

  test "should show note" do
    get :show, :id => @note.to_param
    assert_response :success
  end
  
  test "should not show unexistent notes" do 
    #uso Note.last.id * 2 para asegurarme que sea un id que no existe
    get :show, :id => Note.last.id * 2
    assert_redirected_to notes_path
  end

  test "should not show other's notes" do 
    get :show, :id => @another.to_param 
    assert_redirected_to notes_path
  end

  test "should get edit" do
    get :edit, :id => @note.to_param
    assert_response :success
  end
  
  test "should not get unexistent edit" do 
    get :edit, :id => Note.last.id * 2
    assert_redirected_to notes_path
  end

  test "should not get another's edit" do 
    get :edit, :id => @another.to_param
    assert_redirected_to notes_path
  end

  test "should update note" do
    put :update, :id => @note.to_param, :note => @note.attributes
    assert_redirected_to note_path(assigns(:note))
  end

  test "should not update unexistent note" do 
    put :update, :id => Note.last.id * 2, :note => @note.attributes
    assert_redirected_to notes_path
  end

  test "should not update another's notes" do 
    put :update, :id => @another.to_param, :note => @note.attributes
    assert_redirected_to notes_path
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete :destroy, :id => @note.to_param
    end

    assert_redirected_to notes_path
  end

  test "should not destroy unexistent notes" do 
    assert_no_difference('Note.count') do 
      delete :destroy, :id => Note.count * 2
    end
  end

  test "should not destroy another's notes" do 
    assert_no_difference('Note.count') do 
      delete :destroy, :id => @another.to_param
    end
  end
end
