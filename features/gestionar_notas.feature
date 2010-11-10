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
            | soy algo más           | salgo primera|  dagny@taggatt.com |

    Escenario: entrar directamente a agregar notas
        Dado que estoy autenticado con el correo "ragnar@dann.net" y el password "foobar"
        Cuando voy a la página raíz
        Entonces debería estar en la página de agregar nota
        Y debería ver "view all my notes"

    Esquema del escenario: ver o esconder notas de usuarios
        Dado que estoy autenticado con el correo "<correo>" y el password "<password>"
        Cuando voy a la página de notas de "<usuario>"
        Entonces <acción>

        Ejemplos:
            | correo            | password    | usuario           | acción |
            | ragnar@dann.net   | foobar      | ragnar@dann.net   | debería ver "Ragnar's notes"   |
            | dagny@taggart.com | supersecret | dagny@taggart.com | debería ver "Dagny's notes"    |
            | ragnar@dann.net   | foobar      | dagny@taggart.com | no debería ver "Dagny's notes" |
            |                   |             | ragnar@dann.net   | no debería ver "Ragnar's notes"|


    Esquema del escenario: editar notas 
        Dado que estoy autenticado con el correo "<correo>" y el password "<password>"
        Cuando quiero editar cualquier nota de "<usuario>"
        Entonces <acción>

        Ejemplos:
            | correo            | password    | usuario           | acción |
            | ragnar@dann.net   | foobar      | ragnar@dann.net   | debería ver "Edit note"   |
            | dagny@taggart.com | supersecret | dagny@taggart.com | debería ver "Edit note "    |
            | ragnar@dann.net   | foobar      | dagny@taggart.com | no debería ver "Edit note" |
            |                   |             | ragnar@dann.net   | no debería ver "Edit note"|

    Escenario: borrar mis notas
        Dado que estoy autenticado con el correo "dagny@taggart.com" y el password "supersecret"
        Y que voy a la página de notas de "dagny@taggart.com"
        Y borro la 3era nota
        Entonces debería ver las siguientes notas:
            | title | content | 
            | salgo primera | soy algo más |
            | sip, segunda  | segunda nota de ella |

