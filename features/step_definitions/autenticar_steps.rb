Dado /^que no estoy autenticado$/ do
 visit "/users/sign_out"
end

Dado /^que estoy autenticado con el correo "([^"]*)" y el password "([^"]*)"$/ do |email, password|
  unless User.exists?(:email=>email)
    User.new(:email=>email, :password=>password).save! unless email.blank?
  end
  if not email.blank?
    Cuando %{voy a login}
    Y %{completo "Email" con "#{email}"}
    Y %{completo "Password" con "#{password}"}
    Y %{apreto "Sign in"}
  end
end

