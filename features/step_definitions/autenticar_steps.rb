Dado /^que no estoy autenticado$/ do
  visit "/users/sign_out"
end


Dado /^que estoy autenticado con el correo "([^"]*)" y la contraseña "([^"]*)"$/ do | email , password |
 User.new(:email=>email, :password=>password).save! 

 Cuando %{voy a login}
 Y %{completo "Email" con "#{email}"}
 Y %{completo "Password" con "#{password}"}
 Y %{apreto "Sign in"}
end

