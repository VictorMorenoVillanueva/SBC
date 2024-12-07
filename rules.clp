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

(defmodule ABSTRACCION (import PREGUNTAS ?ALL) (export ?ALL))

(deftemplate VisitanteAbstraido
    (slot diasVisita (type INTEGER))
    (slot tiempoVisita (type INTEGER)) ; Tiempo total disponible calculado (horas diarias - descanso diario)
    (slot nivelArte (type STRING)) ; Principiante, Intermedio, Avanzado
    (slot tipoGrupoAbstracto (type STRING)) ; Solo, Familia, Grupo pequeño, Grupo grande
    (slot tipoVisitaAbstracto (type STRING)) ; Autor, Época, Temática
    (multislot epocasPreferidas (type STRING)) ; Épocas con alta preferencia (>= 7)
    (multislot tematicasPreferidas (type STRING)) ; Temáticas con alta preferencia (>= 7)
    (multislot autoresPreferidos (type STRING)) ; Autores con alta preferencia (>= 7)
    (slot relevanciaInteresAbstracta (type STRING)) ; Poco conocidas, Conocidas, Famosas
)

(defrule procesarCliente "Procesar la información del cliente para generar una abstracción"
    (declare (salience 99))
    (Cliente
        (diasVisita ?dias)
        (horasDiarias ?horas)
        (tipoGrupo ?tipogrupo)
        (conocimientoArte ?nivel)
        (tipoVisita ?tipo)
        (relevanciaInteresante ?fama)
        (descansoDiario ?descanso)
        (interesEpocas $?epocas)
        (interesTematicas $?tematicas)
        (interesAutores $?autores)
        (justificacionRespuesta ?justi)
    )
    =>
    ; Convertir valores numéricos en representaciones simbólicas
    (bind ?diasVisita ?dias)

    (bind ?tiempoVisita (- ?horas ?descanso))

    (bind ?tipoGrupoAbstracto
        (if (= ?tipogrupo 1) then "Solo"
        else (if (= ?tipogrupo 2) then "Familia" 
        else (if (= ?tipogrupo 3) then "Grupo pequeño" else "Grupo grande")))
    )

    (bind ?nivelArte
        (if (= ?nivel 1) then "Principiante"
        else (if (= ?nivel 2) then "Intermedio" else "Avanzado"))
    )

    (bind ?tipoVisitaAbstracto
        (if (= ?tipo 1) then "Autor"
        else (if (= ?tipo 2) then "Época" else "Temática"))
    )

    (bind ?relevanciaInteresAbstracta
        (if (= ?fama 1) then "Poco conocidas"
        else (if (= ?fama 2) then "Conocidas" else "Famosas"))
    )

    ; Filtrar épocas preferidas (>= 7)
    (bind ?epocasPreferidas (create$))
    (bind ?index 1)
    (foreach ?valor $?epocas
        (if (>= ?valor 7) then
            (bind ?epocasPreferidas (create$ ?epocasPreferidas (switch ?index
                (case 1 then "Academicismo")
                (case 2 then "Barroco")
                (case 3 then "Cubismo")
                (case 4 then "Expresionismo")
                (case 5 then "Fauvismo")
                (case 6 then "Impresionismo")
                (case 7 then "Manierismo")
                (case 8 then "Modernismo")
                (case 9 then "Neoclasicismo")
                (case 10 then "Postimpresionismo")
                (case 11 then "Realismo")
                (case 12 then "Renacimiento")
                (case 13 then "Romanticismo")
                (case 14 then "Simbolismo")
                (default "Surrealismo")))))
        (bind ?index (+ ?index 1)))

    ; Filtrar temáticas preferidas (>= 7)
    (bind ?tematicasPreferidas (create$))
    (bind ?index 1)
    (foreach ?valor $?tematicas
        (if (>= ?valor 7) then
            (bind ?tematicasPreferidas (create$ ?tematicasPreferidas (switch ?index
                (case 1 then "Abstracta")
                (case 2 then "Costumbrista")
                (case 3 then "Histórica")
                (case 4 then "Mitológica")
                (case 5 then "Naturaleza Muerta")
                (case 6 then "Paisaje")
                (case 7 then "Religiosa")
                (default "Retrato")))))
        (bind ?index (+ ?index 1)))

    ; Filtrar autores preferidos (>= 7)
    (bind ?autoresPreferidos (create$))
    (bind ?index 1)
    (foreach ?valor $?autores
        (if (>= ?valor 7) then
            (bind ?autoresPreferidos (create$ ?autoresPreferidos (switch ?index
                (case 1 then "Claude Monet")
                (case 2 then "Diego Velázquez")
                (case 3 then "El Greco")
                (case 4 then "Francisco de Goya")
                (case 5 then "Johannes Vermeer")
                (case 6 then "Leonardo da Vinci")
                (case 7 then "Pablo Picasso")
                (case 8 then "Paul Cézanne")
                (case 9 then "Salvador Dalí")
                (default "Vincent van Gogh")))))
        (bind ?index (+ ?index 1)))


    ; Crear la abstracción del visitante
    (assert
        (VisitanteAbstraido
            (diasVisita ?diasVisita)
            (tiempoVisita ?tiempoVisita)
            (nivelArte ?nivelArte)
            (tipoGrupoAbstracto ?tipoGrupoAbstracto)
            (tipoVisitaAbstracto ?tipoVisitaAbstracto)
            (epocasPreferidas ?epocasPreferidas)
            (tematicasPreferidas ?tematicasPreferidas)
            (autoresPreferidos ?autoresPreferidos)
            (relevanciaInteresAbstracta ?relevanciaInteresAbstracta)
        )
    )

    (if (eq ?justi 1)
        then
        (printout t "Información abstraida del usuario: " crlf)
        (printout t "Días de visita: " ?diasVisita crlf)
        (printout t "Tiempo diario de la visita (minutos): " ?tiempoVisita crlf)
        (printout t "Nivel arte: " ?nivelArte crlf)
        (printout t "Tipo de grupo: " ?tipoGrupoAbstracto crlf)
        (printout t "Tipo de visita: " ?tipoVisitaAbstracto crlf)
        (printout t "Épocas preferidas: " crlf)
        (foreach ?epoca $?epocasPreferidas (printout t ?epoca " ") crlf)
        (printout t crlf)
        (printout t "Temáticas preferidas: " crlf)
        (foreach ?tema $?tematicasPreferidas (printout t ?tema " ") crlf)
        (printout t crlf)
        (printout t "Autores preferidos: " crlf)
        (foreach ?autor $?autoresPreferidos (printout t ?autor " ") crlf)
        (printout t crlf "Nivel de relevancia deseado: " ?relevanciaInteresAbstracta crlf)
    )

    (focus ASOCIACION)
)

;------------------------
;--MÓDULO DE ASOCIACION--
;------------------------

(defmodule ASOCIACION (import ABSTRACCION ?ALL) (export ?ALL))

(deftemplate ObraAbstraida
    (slot relevancia (type INTEGER) (default 0))
)

(defrule assertObras
    (declare (salience 85))
    (VisitanteAbstraido)
    =>
    (assert (ObraAbstraida))
)

(defrule ajustarRelevanciaObra
    (declare (salience 84))
    (VisitanteAbstraido (relevanciaInteresAbstracta ?interes))
    ?obra <- (ObraAbstraida (relevancia ?relevancia&:(eq ?relevancia 0)))
    =>
    (switch ?interes
        (case "Poco conocidas" then
            (modify ?obra (relevancia 1)))
        (case "Conocidas" then
            (modify ?obra (relevancia 2)))
        (case "Famosas" then
            (modify ?obra (relevancia 3)))
    )
)

(defrule pasoRefinamiento
    (declare (salience 81))
    (ObraAbstraida (relevancia ?relevancia))
    =>
    (focus REFINAMIENTO)
)

;--------------------------
;--MÓDULO DE REFINAMIENTO--
;--------------------------

(defmodule REFINAMIENTO (import ASOCIACION ?ALL) (export ?ALL))

(deftemplate ProgramacionObras
    (multislot obrasRecomendadasDia1 (type STRING))
    (multislot tiempoCuadrosDia1 (type INTEGER))
    (slot duracionVisitaDia1 (default 0))
    (multislot obrasRecomendadasDia2 (type STRING))
    (multislot tiempoCuadrosDia2 (type INTEGER))
    (slot duracionVisitaDia2 (default 0))
    (multislot obrasRecomendadasDia3 (type STRING))
    (multislot tiempoCuadrosDia3 (type INTEGER))
    (slot duracionVisitaDia3 (default 0))
    (multislot obrasRecomendadasDia4 (type STRING))
    (multislot tiempoCuadrosDia4 (type INTEGER))
    (slot duracionVisitaDia4 (default 0))
    (multislot obrasRecomendadasDia5 (type STRING))
    (multislot tiempoCuadrosDia5 (type INTEGER))
    (slot duracionVisitaDia5 (default 0))
    (multislot obrasRecomendadasDia6 (type STRING))
    (multislot tiempoCuadrosDia6 (type INTEGER))
    (slot duracionVisitaDia6 (default 0))
    (multislot obrasRecomendadasDia7 (type STRING))
    (multislot tiempoCuadrosDia7 (type INTEGER))
    (slot duracionVisitaDia7 (default 0))
    (multislot obrasRecomendadasDia8 (type STRING))
    (multislot tiempoCuadrosDia8 (type INTEGER))
    (slot duracionVisitaDia8 (default 0))
    (multislot obrasRecomendadasDia9 (type STRING))
    (multislot tiempoCuadrosDia9 (type INTEGER))
    (slot duracionVisitaDia9 (default 0))
    (multislot obrasRecomendadasDia10 (type STRING))
    (multislot tiempoCuadrosDia10 (type INTEGER))
    (slot duracionVisitaDia10 (default 0))
)

(deftemplate ObrasUsadas
    (slot nombre (type STRING))
)

(defrule eliminarInstanciasRelevancia 
    (declare (salience 60))
    (Cliente (relevanciaInteresante ?relevancia))
    ?obra <- (object (is-a Obra) (relevancia ?rel&:(neq ?rel ?relevancia)))
    =>
    (send ?obra delete)
)

(defrule primerasObrasDia1
   (declare (salience 59))
   (not (ProgramacionObras (obrasRecomendadasDia1 $?obras1) (duracionVisitaDia1 ?duracion1) (tiempoCuadrosDia1 $?tiempos1)))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre1)
           (relevancia ?rel1&:(eq ?rel1 ?rel))
           (duracion ?dur1))           
   (not (ObrasUsadas (nombre ?nombre1)))
   =>
   (assert (ObrasUsadas (nombre ?nombre1)))
   (assert (ProgramacionObras (obrasRecomendadasDia1 ?nombre1) (duracionVisitaDia1 ?dur1) (tiempoCuadrosDia1 ?dur1)))
)

(defrule añadirObrasDia1
   (declare (salience 58))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog1 <- (ProgramacionObras (obrasRecomendadasDia1 $?obras1)
                                (duracionVisitaDia1 ?duracionVisitaDia1)
                                (tiempoCuadrosDia1 $?tiempoCuadros1))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre)
           (relevancia ?rel1&:(eq ?rel1 ?rel))
           (duracion ?dur1&:(<= (+ ?dur1 ?duracionVisitaDia1) ?tiempo)))
   (not (ObrasUsadas (nombre ?nombre)))
   =>
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog1 (obrasRecomendadasDia1 $?obras1 ?nombre)
                  (duracionVisitaDia1 (+ ?duracionVisitaDia1 ?dur1))
                  (tiempoCuadrosDia1 $?tiempoCuadros1 ?dur1))
)

(defrule primerasObrasDia2
   (declare (salience 57))
   (not (ProgramacionObras (obrasRecomendadasDia2 $?obras2) (duracionVisitaDia2 ?duracion2) (tiempoCuadrosDia2 $?tiempos2)))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre2)
           (relevancia ?rel2&:(eq ?rel2 ?rel))
           (duracion ?dur2))           
   (not (ObrasUsadas (nombre ?nombre2)))
   =>
   (assert (ObrasUsadas (nombre ?nombre2)))
   (assert (ProgramacionObras (obrasRecomendadasDia2 ?nombre2) (duracionVisitaDia2 ?dur2) (tiempoCuadrosDia2 ?dur2)))
)

(defrule añadirObrasDia2
   (declare (salience 56))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog2 <- (ProgramacionObras (obrasRecomendadasDia2 $?obras2)
                                (duracionVisitaDia2 ?duracionVisitaDia2)
                                (tiempoCuadrosDia2 $?tiempoCuadros2))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre)
           (relevancia ?rel2&:(eq ?rel2 ?rel))
           (duracion ?dur2&:(<= (+ ?dur2 ?duracionVisitaDia2) ?tiempo)))
   (not (ObrasUsadas (nombre ?nombre)))
   =>
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog2 (obrasRecomendadasDia2 $?obras2 ?nombre)
                  (duracionVisitaDia2 (+ ?duracionVisitaDia2 ?dur2))
                  (tiempoCuadrosDia2 $?tiempoCuadros2 ?dur2))
)

(defrule primerasObrasDia3
   (declare (salience 55))
   (not (ProgramacionObras (obrasRecomendadasDia3 $?obras3) (duracionVisitaDia3 ?duracion3) (tiempoCuadrosDia3 $?tiempos3)))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre3)
           (relevancia ?rel3&:(eq ?rel3 ?rel))
           (duracion ?dur3))           
   (not (ObrasUsadas (nombre ?nombre3)))
   =>
   (assert (ObrasUsadas (nombre ?nombre3)))
   (assert (ProgramacionObras (obrasRecomendadasDia3 ?nombre3) (duracionVisitaDia3 ?dur3) (tiempoCuadrosDia3 ?dur3)))
)

(defrule añadirObrasDia3
   (declare (salience 54))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog3 <- (ProgramacionObras (obrasRecomendadasDia3 $?obras3)
                                (duracionVisitaDia3 ?duracionVisitaDia3)
                                (tiempoCuadrosDia3 $?tiempoCuadros3))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre)
           (relevancia ?rel3&:(eq ?rel3 ?rel))
           (duracion ?dur3&:(<= (+ ?dur3 ?duracionVisitaDia3) ?tiempo)))
   (not (ObrasUsadas (nombre ?nombre)))
   =>
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog3 (obrasRecomendadasDia3 $?obras3 ?nombre)
                  (duracionVisitaDia3 (+ ?duracionVisitaDia3 ?dur3))
                  (tiempoCuadrosDia3 $?tiempoCuadros3 ?dur3))
)

(defrule primerasObrasDia4
   (declare (salience 53))
   (not (ProgramacionObras (obrasRecomendadasDia4 $?obras4) (duracionVisitaDia4 ?duracion4) (tiempoCuadrosDia4 $?tiempos4)))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre4)
           (relevancia ?rel4&:(eq ?rel4 ?rel))
           (duracion ?dur4))           
   (not (ObrasUsadas (nombre ?nombre4)))
   =>
   (assert (ObrasUsadas (nombre ?nombre4)))
   (assert (ProgramacionObras (obrasRecomendadasDia4 ?nombre4) (duracionVisitaDia4 ?dur4) (tiempoCuadrosDia4 ?dur4)))
)

(defrule añadirObrasDia4
   (declare (salience 52))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog4 <- (ProgramacionObras (obrasRecomendadasDia4 $?obras4)
                                (duracionVisitaDia4 ?duracionVisitaDia4)
                                (tiempoCuadrosDia4 $?tiempoCuadros4))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre)
           (relevancia ?rel4&:(eq ?rel4 ?rel))
           (duracion ?dur4&:(<= (+ ?dur4 ?duracionVisitaDia4) ?tiempo)))
   (not (ObrasUsadas (nombre ?nombre)))
   =>
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog4 (obrasRecomendadasDia4 $?obras4 ?nombre)
                  (duracionVisitaDia4 (+ ?duracionVisitaDia4 ?dur4))
                  (tiempoCuadrosDia4 $?tiempoCuadros4 ?dur4))
)

(defrule primerasObrasDia5
   (declare (salience 51))
   (not (ProgramacionObras (obrasRecomendadasDia5 $?obras5) (duracionVisitaDia5 ?duracion5) (tiempoCuadrosDia5 $?tiempos5)))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre5)
           (relevancia ?rel5&:(eq ?rel5 ?rel))
           (duracion ?dur5))           
   (not (ObrasUsadas (nombre ?nombre5)))
   =>
   (assert (ObrasUsadas (nombre ?nombre5)))
   (assert (ProgramacionObras (obrasRecomendadasDia5 ?nombre5) (duracionVisitaDia5 ?dur5) (tiempoCuadrosDia5 ?dur5)))
)

(defrule añadirObrasDia5
   (declare (salience 50))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog5 <- (ProgramacionObras (obrasRecomendadasDia5 $?obras5)
                                (duracionVisitaDia5 ?duracionVisitaDia5)
                                (tiempoCuadrosDia5 $?tiempoCuadros5))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre)
           (relevancia ?rel5&:(eq ?rel5 ?rel))
           (duracion ?dur5&:(<= (+ ?dur5 ?duracionVisitaDia5) ?tiempo)))
   (not (ObrasUsadas (nombre ?nombre)))
   =>
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog5 (obrasRecomendadasDia5 $?obras5 ?nombre)
                  (duracionVisitaDia5 (+ ?duracionVisitaDia5 ?dur5))
                  (tiempoCuadrosDia5 $?tiempoCuadros5 ?dur5))
)

(defrule primerasObrasDia6
   (declare (salience 49))
   (not (ProgramacionObras (obrasRecomendadasDia6 $?obras6) (duracionVisitaDia6 ?duracion6) (tiempoCuadrosDia6 $?tiempos6)))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre6)
           (relevancia ?rel6&:(eq ?rel6 ?rel))
           (duracion ?dur6))           
   (not (ObrasUsadas (nombre ?nombre6)))
   =>
   (assert (ObrasUsadas (nombre ?nombre6)))
   (assert (ProgramacionObras (obrasRecomendadasDia6 ?nombre6) (duracionVisitaDia6 ?dur6) (tiempoCuadrosDia6 ?dur6)))
)

(defrule añadirObrasDia6
   (declare (salience 48))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog6 <- (ProgramacionObras (obrasRecomendadasDia6 $?obras6)
                                (duracionVisitaDia6 ?duracionVisitaDia6)
                                (tiempoCuadrosDia6 $?tiempoCuadros6))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre)
           (relevancia ?rel6&:(eq ?rel6 ?rel))
           (duracion ?dur6&:(<= (+ ?dur6 ?duracionVisitaDia6) ?tiempo)))
   (not (ObrasUsadas (nombre ?nombre)))
   =>
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog6 (obrasRecomendadasDia6 $?obras6 ?nombre)
                  (duracionVisitaDia6 (+ ?duracionVisitaDia6 ?dur6))
                  (tiempoCuadrosDia6 $?tiempoCuadros6 ?dur6))
)

(defrule primerasObrasDia7
   (declare (salience 47))
   (not (ProgramacionObras (obrasRecomendadasDia7 $?obras7) (duracionVisitaDia7 ?duracion7) (tiempoCuadrosDia7 $?tiempos7)))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre7)
           (relevancia ?rel7&:(eq ?rel7 ?rel))
           (duracion ?dur7))           
   (not (ObrasUsadas (nombre ?nombre7)))
   =>
   (assert (ObrasUsadas (nombre ?nombre7)))
   (assert (ProgramacionObras (obrasRecomendadasDia7 ?nombre7) (duracionVisitaDia7 ?dur7) (tiempoCuadrosDia7 ?dur7)))
)

(defrule añadirObrasDia7
   (declare (salience 46))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog7 <- (ProgramacionObras (obrasRecomendadasDia7 $?obras7)
                                (duracionVisitaDia7 ?duracionVisitaDia7)
                                (tiempoCuadrosDia7 $?tiempoCuadros7))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre)
           (relevancia ?rel7&:(eq ?rel7 ?rel))
           (duracion ?dur7&:(<= (+ ?dur7 ?duracionVisitaDia7) ?tiempo)))
   (not (ObrasUsadas (nombre ?nombre)))
   =>
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog7 (obrasRecomendadasDia7 $?obras7 ?nombre)
                  (duracionVisitaDia7 (+ ?duracionVisitaDia7 ?dur7))
                  (tiempoCuadrosDia7 $?tiempoCuadros7 ?dur7))
)

(defrule primerasObrasDia8
   (declare (salience 45))
   (not (ProgramacionObras (obrasRecomendadasDia8 $?obras8) (duracionVisitaDia8 ?duracion8) (tiempoCuadrosDia8 $?tiempos8)))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre8)
           (relevancia ?rel8&:(eq ?rel8 ?rel))
           (duracion ?dur8))           
   (not (ObrasUsadas (nombre ?nombre8)))
   =>
   (assert (ObrasUsadas (nombre ?nombre8)))
   (assert (ProgramacionObras (obrasRecomendadasDia8 ?nombre8) (duracionVisitaDia8 ?dur8) (tiempoCuadrosDia8 ?dur8)))
)

(defrule añadirObrasDia8
   (declare (salience 44))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog8 <- (ProgramacionObras (obrasRecomendadasDia8 $?obras8)
                                (duracionVisitaDia8 ?duracionVisitaDia8)
                                (tiempoCuadrosDia8 $?tiempoCuadros8))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre)
           (relevancia ?rel8&:(eq ?rel8 ?rel))
           (duracion ?dur8&:(<= (+ ?dur8 ?duracionVisitaDia8) ?tiempo)))
   (not (ObrasUsadas (nombre ?nombre)))
   =>
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog8 (obrasRecomendadasDia8 $?obras8 ?nombre)
                  (duracionVisitaDia8 (+ ?duracionVisitaDia8 ?dur8))
                  (tiempoCuadrosDia8 $?tiempoCuadros8 ?dur8))
)

(defrule primerasObrasDia9
   (declare (salience 43))
   (not (ProgramacionObras (obrasRecomendadasDia9 $?obras9) (duracionVisitaDia9 ?duracion9) (tiempoCuadrosDia9 $?tiempos9)))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre9)
           (relevancia ?rel9&:(eq ?rel9 ?rel))
           (duracion ?dur9))           
   (not (ObrasUsadas (nombre ?nombre9)))
   =>
   (assert (ObrasUsadas (nombre ?nombre9)))
   (assert (ProgramacionObras (obrasRecomendadasDia9 ?nombre9) (duracionVisitaDia9 ?dur9) (tiempoCuadrosDia9 ?dur9)))
)

(defrule añadirObrasDia9
   (declare (salience 42))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog9 <- (ProgramacionObras (obrasRecomendadasDia9 $?obras9)
                                (duracionVisitaDia9 ?duracionVisitaDia9)
                                (tiempoCuadrosDia9 $?tiempoCuadros9))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre)
           (relevancia ?rel9&:(eq ?rel9 ?rel))
           (duracion ?dur9&:(<= (+ ?dur9 ?duracionVisitaDia9) ?tiempo)))
   (not (ObrasUsadas (nombre ?nombre)))
   =>
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog9 (obrasRecomendadasDia9 $?obras9 ?nombre)
                  (duracionVisitaDia9 (+ ?duracionVisitaDia9 ?dur9))
                  (tiempoCuadrosDia9 $?tiempoCuadros9 ?dur9))
)

(defrule primerasObrasDia10
   (declare (salience 41))
   (not (ProgramacionObras (obrasRecomendadasDia10 $?obras10) (duracionVisitaDia10 ?duracion10) (tiempoCuadrosDia10 $?tiempos10)))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre10)
           (relevancia ?rel10&:(eq ?rel10 ?rel))
           (duracion ?dur10))           
   (not (ObrasUsadas (nombre ?nombre10)))
   =>
   (assert (ObrasUsadas (nombre ?nombre10)))
   (assert (ProgramacionObras (obrasRecomendadasDia10 ?nombre10) (duracionVisitaDia10 ?dur10) (tiempoCuadrosDia10 ?dur10)))
)

(defrule añadirObrasDia10
   (declare (salience 40))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog10 <- (ProgramacionObras (obrasRecomendadasDia10 $?obras10)
                                 (duracionVisitaDia10 ?duracionVisitaDia10)
                                 (tiempoCuadrosDia10 $?tiempoCuadros10))
   (ObraAbstraida (relevancia ?rel))
   (object (is-a Obra)
           (nombre ?nombre)
           (relevancia ?rel10&:(eq ?rel10 ?rel))
           (duracion ?dur10&:(<= (+ ?dur10 ?duracionVisitaDia10) ?tiempo)))
   (not (ObrasUsadas (nombre ?nombre)))
   =>
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog10 (obrasRecomendadasDia10 $?obras10 ?nombre)
                   (duracionVisitaDia10 (+ ?duracionVisitaDia10 ?dur10))
                   (tiempoCuadrosDia10 $?tiempoCuadros10 ?dur10))
)

(defrule pasoRespuesta
    (declare (salience 35))
    =>
    (focus RESPUESTA)
)

;-----------------------
;--MÓDULO DE RESPUESTA--
;-----------------------
(defmodule RESPUESTA (import REFINAMIENTO ?ALL) (export ?ALL))

(defrule escribir-visita
    (declare (salience 30))
    (ProgramacionObras (obrasRecomendadasDia1 $?dia1)
            (obrasRecomendadasDia2 $?dia2)
            (obrasRecomendadasDia3 $?dia3)
            (obrasRecomendadasDia4 $?dia4)
            (obrasRecomendadasDia5 $?dia5)
            (obrasRecomendadasDia6 $?dia6)
            (obrasRecomendadasDia7 $?dia7)
            (obrasRecomendadasDia8 $?dia8)
            (obrasRecomendadasDia9 $?dia9)
            (obrasRecomendadasDia10 $?dia10)
            (duracionVisitaDia1 ?tiempo1)
            (duracionVisitaDia2 ?tiempo2)
            (duracionVisitaDia3 ?tiempo3)
            (duracionVisitaDia4 ?tiempo4)
            (duracionVisitaDia5 ?tiempo5)
            (duracionVisitaDia6 ?tiempo6)
            (duracionVisitaDia7 ?tiempo7)
            (duracionVisitaDia8 ?tiempo8)
            (duracionVisitaDia9 ?tiempo9)
            (duracionVisitaDia10 ?tiempo10)
            (tiempoCuadrosDia1 $?tiempoCuadros1)
            (tiempoCuadrosDia2 $?tiempoCuadros2)
            (tiempoCuadrosDia3 $?tiempoCuadros3)
            (tiempoCuadrosDia4 $?tiempoCuadros4)
            (tiempoCuadrosDia5 $?tiempoCuadros5)
            (tiempoCuadrosDia6 $?tiempoCuadros6)
            (tiempoCuadrosDia7 $?tiempoCuadros7)
            (tiempoCuadrosDia8 $?tiempoCuadros8)
            (tiempoCuadrosDia9 $?tiempoCuadros9)
            (tiempoCuadrosDia10 $?tiempoCuadros10))
    (VisitanteAbstraido (diasVisita ?numDias))
    =>
    (printout t crlf crlf "RESULTADO VISITA:" crlf)

    (printout t "DIA 1:" crlf)
    (bind ?index 1)
    (foreach ?obra ?dia1
        (bind ?tiempo (nth$ ?index ?tiempoCuadros1)) 
        (printout t " -" ?obra ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf)
        (bind ?index (+ ?index 1))
    )
    (printout t "Tiempo estimado visita día 1: " ?tiempo1 " minutos" crlf)

    (printout t " " crlf)

    (if (>= ?numDias 2) then
        (printout t "DIA 2:" crlf)
        (bind ?index 1)
        (foreach ?obra ?dia2
            (bind ?tiempo (nth$ ?index ?tiempoCuadros2)) 
            (printout t " -" ?obra ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf)
            (bind ?index (+ ?index 1))
        )
        (printout t "Tiempo estimado visita día 2: " ?tiempo2 " minutos" crlf)

        (printout t " " crlf)
    )

    (if (>= ?numDias 3) then
        (printout t "DIA 3:" crlf)
        (bind ?index 1)
        (foreach ?obra ?dia3
            (bind ?tiempo (nth$ ?index ?tiempoCuadros3)) 
            (printout t " -" ?obra ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf)
            (bind ?index (+ ?index 1))
        )
        (printout t "Tiempo estimado visita día 3: " ?tiempo3 " minutos" crlf)

        (printout t " " crlf)
    )
    
    (if (>= ?numDias 4) then
        (printout t "DIA 4:" crlf)
        (bind ?index 1)
        (foreach ?obra ?dia4
            (bind ?tiempo (nth$ ?index ?tiempoCuadros4)) 
            (printout t " -" ?obra ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf)
            (bind ?index (+ ?index 1))
        )
        (printout t "Tiempo estimado visita día 4: " ?tiempo4 " minutos" crlf)

        (printout t " " crlf)
    )

    (if (>= ?numDias 5) then
        (printout t "DIA 5:" crlf)
        (bind ?index 1)
        (foreach ?obra ?dia5
            (bind ?tiempo (nth$ ?index ?tiempoCuadros5)) 
            (printout t " -" ?obra ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf)
            (bind ?index (+ ?index 1))
        )
        (printout t "Tiempo estimado visita día 5: " ?tiempo5 " minutos" crlf)

        (printout t " " crlf)
    )

    (if (>= ?numDias 6) then
        (printout t "DIA 6:" crlf)
        (bind ?index 1)
        (foreach ?obra ?dia6
            (bind ?tiempo (nth$ ?index ?tiempoCuadros6)) 
            (printout t " -" ?obra ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf)
            (bind ?index (+ ?index 1))
        )
        (printout t "Tiempo estimado visita día 6: " ?tiempo6 " minutos" crlf)

        (printout t " " crlf)
    )

    (if (>= ?numDias 7) then
        (printout t "DIA 7:" crlf)
        (bind ?index 1)
        (foreach ?obra ?dia7
            (bind ?tiempo (nth$ ?index ?tiempoCuadros7)) 
            (printout t " -" ?obra ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf)
            (bind ?index (+ ?index 1))
        )
        (printout t "Tiempo estimado visita día 7: " ?tiempo7 " minutos" crlf)

        (printout t " " crlf)
    )

    (if (>= ?numDias 8) then
        (printout t "DIA 8:" crlf)
        (bind ?index 1)
        (foreach ?obra ?dia8
            (bind ?tiempo (nth$ ?index ?tiempoCuadros8)) 
            (printout t " -" ?obra ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf)
            (bind ?index (+ ?index 1))
        )
        (printout t "Tiempo estimado visita día 8: " ?tiempo8 " minutos" crlf)

        (printout t " " crlf)
    )

    (if (>= ?numDias 9) then
        (printout t "DIA 9:" crlf)
        (bind ?index 1)
        (foreach ?obra ?dia9
            (bind ?tiempo (nth$ ?index ?tiempoCuadros9)) 
            (printout t " -" ?obra ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf)
            (bind ?index (+ ?index 1))
        )
        (printout t "Tiempo estimado visita día 9: " ?tiempo9 " minutos" crlf)

        (printout t " " crlf)
    )

    (if (>= ?numDias 10) then
        (printout t "DIA 10:" crlf)
        (bind ?index 1)
        (foreach ?obra ?dia9
            (bind ?tiempo (nth$ ?index ?tiempoCuadros9)) 
            (printout t " -" ?obra ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf)
            (bind ?index (+ ?index 1))
        )
        (printout t "Tiempo estimado visita día 10: " ?tiempo10 " minutos" crlf)
    )

    (printout t "-------------" crlf)
    (printout t "Recuerda que el museo abre de 9:00h a 18:00. ¡Que tengas una buena visita!" crlf)
)

(defrule noHayProgramacionDia1
    (declare (salience 10))
    (not (ProgramacionObras (obrasRecomendadasDia1 $?dia1)))
    =>
    (printout t "No hay una programación de obras para el día 1" crlf)
)

(defrule noHayProgramacionDia2
    (declare (salience 9))
    (not (ProgramacionObras (obrasRecomendadasDia2 $?dia2)))
    =>
    (printout t "No hay una programación de obras para el día 2" crlf)
)

(defrule noHayProgramacionDia3
    (declare (salience 8))
    (not (ProgramacionObras (obrasRecomendadasDia3 $?dia3)))
    =>
    (printout t "No hay una programación de obras para el día 3" crlf)
)

(defrule noHayProgramacionDia4
    (declare (salience 7))
    (not (ProgramacionObras (obrasRecomendadasDia4 $?dia4)))
    =>
    (printout t "No hay una programación de obras para el día 4" crlf)
)

(defrule noHayProgramacionDia5
    (declare (salience 6))
    (not (ProgramacionObras (obrasRecomendadasDia5 $?dia5)))
    =>
    (printout t "No hay una programación de obras para el día 5" crlf)
)

(defrule noHayProgramacionDia6
    (declare (salience 5))
    (not (ProgramacionObras (obrasRecomendadasDia6 $?dia6)))
    =>
    (printout t "No hay una programación de obras para el día 6" crlf)
)

(defrule noHayProgramacionDia7
    (declare (salience 4))
    (not (ProgramacionObras (obrasRecomendadasDia7 $?dia7)))
    =>
    (printout t "No hay una programación de obras para el día 7" crlf)
)

(defrule noHayProgramacionDia8
    (declare (salience 3))
    (not (ProgramacionObras (obrasRecomendadasDia8 $?dia8)))
    =>
    (printout t "No hay una programación de obras para el día 8" crlf)
)

(defrule noHayProgramacionDia9
    (declare (salience 2))  
    (not (ProgramacionObras (obrasRecomendadasDia9 $?dia9)))
    =>
    (printout t "No hay una programación de obras para el día 9" crlf)
)

(defrule noHayProgramacionDia10
    (declare (salience 1))
    (not (ProgramacionObras (obrasRecomendadasDia10 $?dia10)))
    =>
    (printout t "No hay una programación de obras para el día 10" crlf)
)
