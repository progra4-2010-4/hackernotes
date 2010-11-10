#language: es
@core
Característica: gestionar notas
    Para administrar mis notas
    Como un usuario de la aplicación
    Quiero poder agregarlas, verlas, editarlas y borrarlas

    Antecedentes:
        Dado que existen los siguientes usuarios:
            |email             | password    |
            |ragnar@dann.net   | foobar      |
            |dagny@taggart.com | supersecret |
        Y que existen las siguientes notas:
            |content                 | title        |  user              |
            | soy un contenido XYZ   | tengo título |  ragnar@dann.net   |
            | soy otro contenido ABC |              |  dagny@taggart.com |
            | segunda nota de ella   | sip, segunda |  dagny@taggart.com |
            | soy algo más           | salgo primera|  dagny@taggart.com |

    Escenario: entrar directamente a agregar notas
        Dado que estoy autenticado con el correo "ragnar@dann.net" y el password "foobar"
        Cuando voy a la página raíz
        Entonces debería estar en la página de agregar nota


    Esquema del escenario: ver o esconder notas de usuarios
        Dado que estoy autenticado con el correo "<correo>" y el password "<password>"
        Cuando visito la página de notas de "<usuario>"
        Entonces <acción>

        Ejemplos:
            | correo            | password    | usuario           | acción |
            | ragnar@dann.net   | foobar      | ragnar@dann.net   | debería ver "Ragnar's notes"   |
            | dagny@taggart.com | supersecret | dagny@taggart.com | debería ver "Dagny's notes"    |
            | ragnar@dann.net   | foobar      | dagny@taggart.com | no debería ver "Dagny's notes" |
            |                   |             | ragnar@dann.net   | no debería ver "Ragnar's notes"  |

    Escenario: ver mis propias notas, pero no las de otros
        Dado que estoy autenticado con el correo "dagny@taggart.com" y el password "supersecret"
        Cuando visito la página de notas de "dagny@taggart.com"
        Entonces debería ver "soy otro"
        Y debería ver "sip, segunda"
        Y debería ver "salgo primera"
        Pero no debería ver "tengo título"

    Esquema del escenario: editar notas 
        Dado que estoy autenticado con el correo "<correo>" y el password "<password>"
        Cuando quiero editar cualquier nota de "<usuario>"
        Entonces <acción>

        Ejemplos:
            | correo            | password    | usuario           | acción |
            | ragnar@dann.net   | foobar      | ragnar@dann.net   | debería ver "Editing note"   |
            | dagny@taggart.com | supersecret | dagny@taggart.com | debería ver "Editing note "    |
            | ragnar@dann.net   | foobar      | dagny@taggart.com | no debería ver "Editing note" |
            |                   |             | ragnar@dann.net   | no debería ver "Editing note"|

    Escenario: borrar mis notas
        Dado que estoy autenticado con el correo "dagny@taggart.com" y el password "supersecret"
        Y que visito la página de notas de "dagny@taggart.com"
        Y borro la 3era nota
        Entonces mostrame la página
        Y debería ver las siguientes notas:
            | Title | Content | 
            | salgo primera | soy algo más |
            | sip, segunda  | segunda nota de ella |

