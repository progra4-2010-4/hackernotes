# language: es
Característica: Autenticar usuarios
    Para tomar notas
    Como un usuario
    Quiero estar autenticado

    Escenario: Persona no autenticada entra
        Dado que no estoy autenticado
        Cuando voy a la página raíz
        Entonces debería ver "Login"
        Y debería ver "Register"

    Escenario: Una persona se registra
        Dado que no estoy autenticado
        Cuando voy a la página de registro
        Y completo "Email" con "john@galt.com"
        Y completo "Password" con "foobarbaz"
        Y completo "Password confirmation" con "foobarbaz"
        Y apreto "Sign up"
        Entonces debería ver "signed up successfully"
        Y debería ver "john@galt.com"

    Escenario: Una persona autenticada entra
        Dado que estoy autenticado con el correo "ragnar@pirate.com" y la contraseña "danneskjoeld"
        Cuando voy a la página raíz
        Entonces debería ver "Logout"
        Y debería ver "ragnar@pirate.com"
