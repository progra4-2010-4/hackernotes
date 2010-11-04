#language: es
Característica: autenticar usuarios
    Para poder agregar notas
    Como un usuario
    Quiero estar autenticado

    Escenario: Un usuario no autenticado entra
        Dado que no estoy autenticado
        Cuando voy a la página raíz
        Entonces debería ver "Login"
        Y debería ver "Register"

    Escenario: Un usuario se registra
        Dado que no estoy autenticado
        Cuando voy a la página de registro
        Y completo "Email" con "correo@dominio.com"
        Y completo "Password" con "foobar"
        Y completo "Password confirmation" con "foobar"
        Y apreto "Sign up"
        Entonces debería ver "Logout"
        Y debería ver "correo@dominio.com"
        Y debería ver "signed up successfully"

    Escenario: Un usuario autenticado entra
        Dado que estoy autenticado con el correo "hola@mundo.com" y el password "foobar"
        Cuando voy a la página raíz
        Entonces debería ver "Logout"
        Y debería ver "hola@mundo.com"
