require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "que el título sea explícito" do
    nota = Note.new :content=>"algún contenido X"
    nota.user  = users(:lfborjas) # User.new(:email=>"lfborjas@dominio.com") 
    nota.title = "título XYZ"

    assert nota.save
    assert_equal nota.title, "título XYZ"
  end

  test "que el título se asigne solo" do 
    contenido = "soy un contenido largo que tendrá título"
    nota = Note.new :content=> contenido
    nota.user = users :johndoe

    assert nota.save
    assert_equal nota.title, contenido[0..Note::TitleLength]

  end
  
  test "que el usuario se asigne bien" do 
    nota = Note.new :content => "X"
    usuario = users :lfborjas
    nota.user = usuario
    
    assert nota.save
    assert_equal nota.user, usuario
  end


  test "que no haya usuario" do
    nota = Note.new :content => "Y"
    
    assert !nota.save
    assert_not_nil  nota.errors[:user]
  end

  test "que el contenido sea obligatorio" do
    nota = Note.new 
    usuario = users :johndoe
    nota.user = usuario

    assert !nota.save
    assert_not_nil nota.errors[:content]
  end

  test "que haya errores en contenido y usuario" do
    nota = Note.new
    
    assert !nota.save
    assert_not_nil nota.errors[:user]
    assert_not_nil nota.errors[:content]
    assert !!nota.errors[:title] #nota.errors.on :title
  
  end


end
