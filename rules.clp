;-----------
;-FUNCIONES-
;-----------

(deffunction preguntaNumerica (?pregunta ?min ?max)
    (format t "%s" ?pregunta)
    (bind ?respuesta (read))
    (while (not (and (>= ?respuesta ?min) (<= ?respuesta ?max))) do
        (format t "%s El valor de la respuesta tiene que estar entre %d i %d." ?pregunta ?min ?max)
        (bind ?respuesta (read))
    )
    ?respuesta
)

(deffunction elementoEnLista (?elemento $?lista)
    (bind ?b (member$ ?elemento ?lista))
    (if (neq ?b FALSE) then (bind ?b TRUE))
)

;------------
;----MAIN----
;------------

(defmodule MAIN (export ?ALL))

(defrule inicio
    (declare (salience 100))
    =>
    (printout t "BIENVIENIDO AL CREADOR DE VISITAS DEL MUSEO ..." crlf crlf)
    (focus PREGUNTAS)
)

;---------------------
;-MÓDULO DE PREGUNTAS-
;---------------------

(defmodule PREGUNTAS (import MAIN ?ALL) (export ?ALL))

(deftemplate Cliente
    (slot diasVisita (type INTEGER))
    (slot horasDiarias (type INTEGER))
    (slot tipoGrupo (type INTEGER))
    (slot conocimientoArte (type INTEGER))
    (slot tipoVisita (type INTEGER))
    (multislot interesEpocas (type INTEGER))
    (multislot interesTematicas (type INTEGER))
    (multislot interesAutores (type INTEGER))
    (slot relevanciaInteresante (type INTEGER))
    (slot descansoDiario (type INTEGER))
    (slot justificacionRespuesta (type INTEGER)) ; 1 -> Sí, 0 -> No
)

(defrule crearCliente "Preguntas para inicializar un cliente"
    (declare (salience 100))
    =>
    (printout t "Vamos a empezar con unas preguntas para conocer tu perfil." crlf crlf)
    
    (bind ?diasVisita (preguntaNumerica "¿De cuántos días dispones para visitar el museo? " 1 10))
    (bind ?horasDiarias (preguntaNumerica "¿Cuántas horas diarias dedicarás a la visita? (en minutos): " 30 480))
    (bind ?tipoGrupo (preguntaNumerica "¿Realizarás la visita solo (1), en familia con niños (2), en un grupo pequeño (3) o en un grupo grande (4)? " 1 4))
    (bind ?conocimientoArte (preguntaNumerica "¿Qué nivel de conocimiento sobre arte tienes? (1 - principiante, 2 - intermedio, 3 - avanzado): " 1 3))
    (bind ?tipoVisita (preguntaNumerica "¿Qué tipo de visita deseas realizar? (1 - por autor, 2 - por época, 3 - por temática): " 1 3))
    (bind ?relevanciaInteresante (preguntaNumerica "¿Quieres ver obras famosas o descubrir obras menos conocidas? (1 - poco conocidas, 2 - conocidas, 3 - famosas): " 1 3))
    (bind ?descansoDiario (preguntaNumerica "¿Cuánto tiempo quieres dedicar al descanso diario? (en minutos): " 0 ?horasDiarias))

    (printout t "Por favor, marca del 0 (nada) al 10 (mucho) cuánto te interesan los siguientes autores:" crlf)
    (bind ?monet (preguntaNumerica "Claude Monet: " 0 10))
    (bind ?velazquez (preguntaNumerica "Diego Velázquez: " 0 10))
    (bind ?greco (preguntaNumerica "El Greco: " 0 10))
    (bind ?goya (preguntaNumerica "Francisco de Goya: " 0 10))
    (bind ?vermeer (preguntaNumerica "Johannes Vermeer: " 0 10))
    (bind ?daVinci (preguntaNumerica "Leonardo da Vinci: " 0 10))
    (bind ?picasso (preguntaNumerica "Pablo Picasso: " 0 10))
    (bind ?cezanne (preguntaNumerica "Paul Cézanne: " 0 10))
    (bind ?dali (preguntaNumerica "Salvador Dalí: " 0 10))
    (bind ?vanGogh (preguntaNumerica "Vincent van Gogh: " 0 10))

    (printout t "Por favor, marca del 0 (nada) al 10 (mucho) cuánto te interesan las siguientes épocas:" crlf)
    (bind ?academicismo (preguntaNumerica "Academicismo: " 0 10))
    (bind ?barroco (preguntaNumerica "Barroco: " 0 10))
    (bind ?cubismo (preguntaNumerica "Cubismo: " 0 10))
    (bind ?expresionismo (preguntaNumerica "Expresionismo: " 0 10))
    (bind ?fauvismo (preguntaNumerica "Fauvismo: " 0 10))
    (bind ?impresionismo (preguntaNumerica "Impresionismo: " 0 10))
    (bind ?manierismo (preguntaNumerica "Manierismo: " 0 10))
    (bind ?modernismo (preguntaNumerica "Modernismo: " 0 10))
    (bind ?neoclasicismo (preguntaNumerica "Neoclasicismo: " 0 10))
    (bind ?postimpresionismo (preguntaNumerica "Postimpresionismo: " 0 10))
    (bind ?realismo (preguntaNumerica "Realismo: " 0 10))
    (bind ?renacimiento (preguntaNumerica "Renacimiento: " 0 10))
    (bind ?romanticismo (preguntaNumerica "Romanticismo: " 0 10))
    (bind ?simbolismo (preguntaNumerica "Simbolismo: " 0 10))
    (bind ?surrealismo (preguntaNumerica "Surrealismo: " 0 10))

    (printout t "Por favor, marca del 0 (nada) al 10 (mucho) cuánto te interesan las siguientes temáticas:" crlf)
    (bind ?abstracta (preguntaNumerica "Abstracta: " 0 10))
    (bind ?costumbrista (preguntaNumerica "Costumbrista: " 0 10))
    (bind ?historica (preguntaNumerica "Histórica: " 0 10))
    (bind ?mitologica (preguntaNumerica "Mitológica: " 0 10))
    (bind ?naturalezaMuerta (preguntaNumerica "Naturaleza muerta: " 0 10))
    (bind ?paisaje (preguntaNumerica "Paisaje: " 0 10))
    (bind ?religiosa (preguntaNumerica "Religiosa: " 0 10))
    (bind ?retrato (preguntaNumerica "Retrato: " 0 10))

    (printout t crlf "¿Te gustaría ver el porqué de tu recomendación? (0 - NO, 1 - SÍ): " crlf)
    (bind ?justificacionRespuesta (preguntaNumerica "Opción escogida: " 0 1))

    (assert
        (Cliente
            (diasVisita ?diasVisita)
            (horasDiarias ?horasDiarias)
            (tipoGrupo ?tipoGrupo)
            (conocimientoArte ?conocimientoArte)
            (tipoVisita ?tipoVisita)
            (relevanciaInteresante ?relevanciaInteresante)
            (descansoDiario ?descansoDiario)
            (interesEpocas ?academicismo ?barroco ?cubismo ?expresionismo ?fauvismo ?impresionismo ?manierismo
                           ?modernismo ?neoclasicismo ?postimpresionismo ?realismo ?renacimiento ?romanticismo ?simbolismo ?surrealismo)
            (interesTematicas ?abstracta ?costumbrista ?historica ?mitologica ?naturalezaMuerta ?paisaje ?religiosa ?retrato)
            (interesAutores ?monet ?velazquez ?greco ?goya ?vermeer ?daVinci ?picasso ?cezanne ?dali ?vanGogh)
            (justificacionRespuesta ?justificacionRespuesta)
        )
    )

    (printout t crlf "Perfil creado correctamente." crlf crlf)
    (focus ABSTRACCION)
)


;-------------------------
;--MÓDULO DE ABSTRACCION--
;-------------------------



;------------------------
;--MÓDULO DE ASOCIACION--
;------------------------


;--------------------------
;--MÓDULO DE REFINAMIENTO--
;--------------------------


;-----------------------
;--MÓDULO DE RESPUESTA--
;-----------------------

