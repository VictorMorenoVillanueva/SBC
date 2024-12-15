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
    (slot tamanoPreferido (type INTEGER))
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
    
    (bind ?diasVisita (preguntaNumerica "¿De cuántos días dispones para visitar el museo? " 1 7))
    (bind ?horasDiarias (preguntaNumerica "¿Cuántas horas diarias dedicarás a la visita? (en minutos): " 30 240))
    (bind ?tipoGrupo (preguntaNumerica "¿Realizarás la visita solo (1), en familia con niños (2), en un grupo pequeño (3) o en un grupo grande (4)? " 1 4))
    (bind ?conocimientoArte (preguntaNumerica "¿Qué nivel de conocimiento sobre arte tienes? (1 - principiante, 2 - intermedio, 3 - avanzado): " 1 3))
    
    (if (or (= ?tipoGrupo 2) (= ?tipoGrupo 3) (= ?tipoGrupo 4))
        then 
        (bind ?tamanoPreferido (preguntaNumerica "¿Qué tamaño de obras te gustaría ver? (1 - pequeño, 2 - mediano, 3 - grande): " 1 3))
        else 
        (bind ?tamanoPreferido ?conocimientoArte))
    
    (bind ?tipoVisita (preguntaNumerica "¿Qué tipo de visita deseas realizar? (1 - por autor, 2 - por época, 3 - por temática): " 1 3))
    (bind ?relevanciaInteresante (preguntaNumerica "¿Quieres ver obras famosas o descubrir obras menos conocidas? (1 - poco conocidas, 2 - conocidas, 3 - famosas): " 1 3))
    (bind ?descansoDiario (preguntaNumerica "¿Cuánto tiempo quieres dedicar al descanso diario? (en minutos): " 0 ?horasDiarias))

    (printout t "Por favor, marca del 0 (nada) al 10 (mucho) cuánto te interesan los siguientes autores:" crlf)
    (printout t "Si la visita es de tipo según autor, por favor asegúrate de marcar aquellos que te interesen con un 7 o más." crlf)
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
    (printout t "Si la visita es de tipo según época, por favor asegúrate de marcar aquellos que te interesen con un 7 o más." crlf)    
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
    (printout t "Si la visita es de tipo según temática, por favor asegúrate de marcar aquellos que te interesen con un 7 o más." crlf)
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
            (tamanoPreferido ?tamanoPreferido) ;; Aquí se usa el valor calculado
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
    (slot tamanoPreferido (type STRING)) ; Pequeño, Mediano, Grande
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
        (tamanoPreferido ?tamano)
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

    (bind ?tamanoPreferido
    (if (= ?tamano 1) 
        then "Pequeño"
        else 
            (if (= ?tamano 2) 
                then "Mediano" 
                else "Grande")))


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
            (tamanoPreferido ?tamanoPreferido)
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
        (printout t "Tamaño Preferido: " ?tamanoPreferido crlf)
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
    (slot complejidad (type INTEGER) (default 0))
    (slot tipoVisita (type STRING) (default ""))
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

(defrule ajustarComplejidad
    (declare (salience 83))
    (VisitanteAbstraido (tamanoPreferido ?tamano))
    ?obra <- (ObraAbstraida (complejidad ?complejidad&:(eq ?complejidad 0)))
    => 
    (switch ?tamano
        (case "Pequeño" then
            (modify ?obra (complejidad 1)))
        (case "Mediano" then
            (modify ?obra (complejidad 2)))
        (case "Grande" then
            (modify ?obra (complejidad 3)))
    )
)

(defrule ajustarTipoVisita
    (declare (salience 83))
    (VisitanteAbstraido (tipoVisitaAbstracto ?tipoVisita))
    ?obra <- (ObraAbstraida (tipoVisita ?tipoVisita&:(eq ?tipoVisita "")))
    =>
    (switch ?tipoVisita
        (case "Autor" then
            (modify ?obra (tipoVisita "Autor")))
        (case "Época" then
            (modify ?obra (tipoVisita "Época")))
        (case "Temática" then
            (modify ?obra (tipoVisita "Temática")))
    )
)

(defrule pasoRefinamiento
    (declare (salience 81))
    (ObraAbstraida (relevancia ?relevancia) (complejidad ?complejidad) (tipoVisita ?tipoVisita))
    =>
    (focus REFINAMIENTO)
)

;--------------------------
;--MÓDULO DE REFINAMIENTO--
;--------------------------

(defmodule REFINAMIENTO (import ASOCIACION ?ALL) (export ?ALL))


(deftemplate ProgramacionObras
    (multislot obrasRecomendadasDia1 (type STRING))
    (multislot autoresCuadrosDia1 (type STRING))
    (multislot añoCuadrosDia1 (type INTEGER))
    (multislot tiempoCuadrosDia1 (type INTEGER))
    (slot duracionVisitaDia1 (default 0))
    (multislot obrasRecomendadasDia2 (type STRING))
    (multislot autoresCuadrosDia2 (type STRING))
    (multislot añoCuadrosDia2 (type INTEGER))
    (multislot tiempoCuadrosDia2 (type INTEGER))
    (slot duracionVisitaDia2 (default 0))
    (multislot obrasRecomendadasDia3 (type STRING))
    (multislot autoresCuadrosDia3 (type STRING))
    (multislot añoCuadrosDia3 (type INTEGER))
    (multislot tiempoCuadrosDia3 (type INTEGER))
    (slot duracionVisitaDia3 (default 0))
    (multislot obrasRecomendadasDia4 (type STRING))
    (multislot autoresCuadrosDia4 (type STRING))
    (multislot añoCuadrosDia4 (type INTEGER))
    (multislot tiempoCuadrosDia4 (type INTEGER))
    (slot duracionVisitaDia4 (default 0))
    (multislot obrasRecomendadasDia5 (type STRING))
    (multislot autoresCuadrosDia5 (type STRING))
    (multislot añoCuadrosDia5 (type INTEGER))
    (multislot tiempoCuadrosDia5 (type INTEGER))
    (slot duracionVisitaDia5 (default 0))
    (multislot obrasRecomendadasDia6 (type STRING))
    (multislot autoresCuadrosDia6 (type STRING))
    (multislot añoCuadrosDia6 (type INTEGER))
    (multislot tiempoCuadrosDia6 (type INTEGER))
    (slot duracionVisitaDia6 (default 0))
    (multislot obrasRecomendadasDia7 (type STRING))
    (multislot autoresCuadrosDia7 (type STRING))
    (multislot añoCuadrosDia7 (type INTEGER))
    (multislot tiempoCuadrosDia7 (type INTEGER))
    (slot duracionVisitaDia7 (default 0))
)

(deftemplate ObrasRelevantes
    (slot nombre (type STRING))
)

(deftemplate ObrasRelevantesNoCompletas
    (slot nombre (type STRING))
)

(deftemplate ObrasRelleno
    (slot nombre (type STRING))
)

(defrule categorizarObras
    (declare (salience 61))
    (VisitanteAbstraido 
        (tipoVisitaAbstracto ?tipoVisita)
        (autoresPreferidos $?autores)
        (epocasPreferidas $?epocas)
        (tematicasPreferidas $?tematicas))
    (Cliente (relevanciaInteresante ?relevancia) (tamanoPreferido ?tamano))
    ?obra <- (object 
                (is-a Obra)
                (nombre ?nombre) 
                (autor ?autor)
                (epoca ?epoca)
                (tematica ?tematica)
                (complejidad ?comp)
                (relevancia ?rel))
    =>
    (if (and ;; Cumple todas las características relevantes
            (eq ?comp ?tamano) 
            (or 
                (eq ?rel ?relevancia) 
                (eq ?rel (- ?relevancia 1)) 
                (eq ?rel (+ ?relevancia 1))
            )
            (or
                (and (eq ?tipoVisita "Autor") (member$ ?autor $?autores))
                (and (eq ?tipoVisita "Época") (member$ ?epoca $?epocas))
                (and (eq ?tipoVisita "Temática") (member$ ?tematica $?tematicas))
            )
        )
    then
        (assert (ObrasRelevantes (nombre ?nombre)))
    )
    else
        (if (or ;; Cumple algunas características relevantes, pero no todas
                (eq ?comp ?tamano) 
                (or 
                    (eq ?rel ?relevancia) 
                    (eq ?rel (- ?relevancia 1)) 
                    (eq ?rel (+ ?relevancia 1))
                )
                (or
                    (and (eq ?tipoVisita "Autor") (member$ ?autor $?autores))
                    (and (eq ?tipoVisita "Época") (member$ ?epoca $?epocas))
                    (and (eq ?tipoVisita "Temática") (member$ ?tematica $?tematicas))
                )
            )
        then
            (assert (ObrasRelevantesNoCompletas (nombre ?nombre)))
        )
        else ;; No cumple ninguna característica relevante
            (assert (ObrasRelleno (nombre ?nombre)))

)

(deftemplate ObrasUsadas
    (slot nombre (type STRING))
)

(defrule primerasObrasDia1
   (declare (salience 59))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia1 $?obras1) (duracionVisitaDia1 ?duracion1) (tiempoCuadrosDia1 $?tiempos1)
                           (autoresCuadrosDia1 $?autores1) (añoCuadrosDia1 $?años1) ))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre1)
           (autor ?autor1)
           (anio ?año1)
           (relevancia ?rel1&:(or (eq ?rel1 ?rel) (eq ?rel1 (+ ?rel 1)) (eq ?rel1 (- ?rel 1))))
           (complejidad ?comp1&:(eq ?comp1 ?comp))
           (duracion ?dur1)           
           )           
   (not (ObrasUsadas (nombre ?nombre1)))
   (ObrasRelevantes (nombre ?nombre1)) ;; usa las relevantes primero
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur1 (* 1.5 ?dur1)))
   (assert (ObrasUsadas (nombre ?nombre1)))
   (assert (ProgramacionObras (obrasRecomendadasDia1 ?nombre1) (duracionVisitaDia1 ?dur1) (tiempoCuadrosDia1 ?dur1)
                              (autoresCuadrosDia1 ?autor1) (añoCuadrosDia1 ?año1)))
)

(defrule añadirObrasDia1
   (declare (salience 58))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog1 <- (ProgramacionObras (obrasRecomendadasDia1 $?obras1)
                                (duracionVisitaDia1 ?duracionVisitaDia1)
                                (tiempoCuadrosDia1 $?tiempoCuadros1)
                                (autoresCuadrosDia1 $?autores1) 
                                (añoCuadrosDia1 $?años1)
                               )
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (relevancia ?rel1&:(or (eq ?rel1 ?rel) (eq ?rel1 (+ ?rel 1)) (eq ?rel1 (- ?rel 1))))
           (complejidad ?comp1&:(eq ?comp1 ?comp))
           (duracion ?dur1)
           )
   (not (ObrasUsadas (nombre ?nombre)))
    (ObrasRelevantes (nombre ?nombre)) ;; usa las relevantes primero 
   =>
    (if (neq ?tipoGrupo 1) then (bind ?dur1 (* 1.5 ?dur1)))
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog1 (obrasRecomendadasDia1 $?obras1 ?nombre)
                  (autoresCuadrosDia1 $?autores1 ?autor)
                  (añoCuadrosDia1 $?años1 ?año)
                  (duracionVisitaDia1 (+ ?duracionVisitaDia1 ?dur1))
                  (tiempoCuadrosDia1 $?tiempoCuadros1 ?dur1)
                  )
)

(defrule primerasObrasDia1MenosRelevantes
   (declare (salience 57))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia1 $?obras1) (duracionVisitaDia1 ?duracion1) (tiempoCuadrosDia1 $?tiempos1)
                           (autoresCuadrosDia1 $?autores1) (añoCuadrosDia1 $?años1)))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre1)
           (autor ?autor1)
           (anio ?año1)
           (relevancia ?rel1&:(or (eq ?rel1 ?rel) (eq ?rel1 (+ ?rel 1)) (eq ?rel1 (- ?rel 1))))
           (complejidad ?comp1&:(eq ?comp1 ?comp))
           (duracion ?dur1)
           )           
   (not (ObrasUsadas (nombre ?nombre1)))
   (ObrasRelevantesNoCompletas (nombre ?nombre1)) ;; usa las menos relevantes si no hay relevantes
   =>
    (if (neq ?tipoGrupo 1) then (bind ?dur1 (* 1.5 ?dur1)))
   (assert (ObrasUsadas (nombre ?nombre1)))
   (assert (ProgramacionObras (obrasRecomendadasDia1 ?nombre1) (duracionVisitaDia1 ?dur1) (tiempoCuadrosDia1 ?dur1)
                              (autoresCuadrosDia1 ?autor1) (añoCuadrosDia1 ?año1)))
)

(defrule rellenarDia1ConMenosRelevantes
   (declare (salience 56))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia1 $?obras1) 
               (duracionVisitaDia1 ?duracionVisitaDia1)
               (tiempoCuadrosDia1 $?tiempoCuadros1)
               (autoresCuadrosDia1 $?autores1) 
               (añoCuadrosDia1 $?años1)
              )
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (duracion ?dur1)
           )
   (not (ObrasUsadas (nombre ?nombre))) 
   (ObrasRelevantesNoCompletas (nombre ?nombre))
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur1 (* 1.5 ?dur1)))
   (if (<= (+ ?dur1 ?duracionVisitaDia1) ?tiempo) then
        (assert (ObrasUsadas (nombre ?nombre)))
        (modify ?prog (obrasRecomendadasDia1 $?obras1 ?nombre)
                        (autoresCuadrosDia1 $?autores1 ?autor)
                        (añoCuadrosDia1 $?años1 ?año) 
                        (duracionVisitaDia1 (+ ?duracionVisitaDia1 ?dur1)) 
                        (tiempoCuadrosDia1 $?tiempoCuadros1 ?dur1)
                        ) 
   )
)

(defrule primerasObrasDia1ConRelleno
   (declare (salience 55))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia1 $?obras1) (duracionVisitaDia1 ?duracion1) (tiempoCuadrosDia1 $?tiempos1)
                           (autoresCuadrosDia1 $?autores1) (añoCuadrosDia1 $?años1) ))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre1)
           (autor ?autor1)
           (anio ?año1)
           (duracion ?dur1)
           )   

   (not (ObrasUsadas (nombre ?nombre1)))
   (ObrasRelleno (nombre ?nombre1)) ;; usa obras de relleno si no hay relevantes ni menos relevantes
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur1 (* 1.5 ?dur1)))
   (assert (ObrasUsadas (nombre ?nombre1)))
   (assert (ProgramacionObras (obrasRecomendadasDia1 ?nombre1) (duracionVisitaDia1 ?dur1) (tiempoCuadrosDia1 ?dur1)
                              (autoresCuadrosDia1 ?autor1) (añoCuadrosDia1 ?año1)))
)

(defrule rellenarDia1ConRelleno
   (declare (salience 54))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia1 $?obras1) 
               (duracionVisitaDia1 ?duracionVisitaDia1)
               (tiempoCuadrosDia1 $?tiempoCuadros1)
               (autoresCuadrosDia1 $?autores1) 
               (añoCuadrosDia1 $?años1)
               )
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (duracion ?dur1)
           )
   (not (ObrasUsadas (nombre ?nombre))) 
   (ObrasRelleno (nombre ?nombre))
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur1 (* 1.5 ?dur1)))
   (if (<= (+ ?dur1 ?duracionVisitaDia1) ?tiempo) then
        (assert (ObrasUsadas (nombre ?nombre)))
        (modify ?prog (obrasRecomendadasDia1 $?obras1 ?nombre)
                        (autoresCuadrosDia1 $?autores1 ?autor)
                        (añoCuadrosDia1 $?años1 ?año) 
                        (duracionVisitaDia1 (+ ?duracionVisitaDia1 ?dur1)) 
                        (tiempoCuadrosDia1 $?tiempoCuadros1 ?dur1)
                        ) 
   )
)

(defrule primerasObrasDia2
   (declare (salience 53))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia2 $?obras2) (duracionVisitaDia2 ?duracion2) (tiempoCuadrosDia2 $?tiempos2)
                           (autoresCuadrosDia2 $?autores2) (añoCuadrosDia2 $?años2) ))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre2)
           (autor ?autor2)
           (anio ?año2)
           (relevancia ?rel2&:(or (eq ?rel2 ?rel) (eq ?rel2 (+ ?rel 1)) (eq ?rel2 (- ?rel 1))))
           (complejidad ?comp2&:(eq ?comp2 ?comp))
           (duracion ?dur2)           
           )           
   (not (ObrasUsadas (nombre ?nombre2)))
   (ObrasRelevantes (nombre ?nombre2)) ;; usa las relevantes primero
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur2 (* 1.5 ?dur2)))
   (assert (ObrasUsadas (nombre ?nombre2)))
   (assert (ProgramacionObras (obrasRecomendadasDia2 ?nombre2) (duracionVisitaDia2 ?dur2) (tiempoCuadrosDia2 ?dur2)
                              (autoresCuadrosDia2 ?autor2) (añoCuadrosDia2 ?año2)))
)

(defrule añadirObrasDia2
   (declare (salience 58))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog2 <- (ProgramacionObras (obrasRecomendadasDia2 $?obras2)
                                (duracionVisitaDia2 ?duracionVisitaDia2)
                                (tiempoCuadrosDia2 $?tiempoCuadros2)
                                (autoresCuadrosDia2 $?autores2) 
                                (añoCuadrosDia2 $?años2)
                               )
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (relevancia ?rel2&:(or (eq ?rel2 ?rel) (eq ?rel2 (+ ?rel 1)) (eq ?rel2 (- ?rel 1))))
           (complejidad ?comp2&:(eq ?comp2 ?comp))
           (duracion ?dur2)
           )
   (not (ObrasUsadas (nombre ?nombre)))
    (ObrasRelevantes (nombre ?nombre)) ;; usa las relevantes primero 
   =>
    (if (neq ?tipoGrupo 1) then (bind ?dur2 (* 1.5 ?dur2)))
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog2 (obrasRecomendadasDia2 $?obras2 ?nombre)
                  (autoresCuadrosDia2 $?autores2 ?autor)
                  (añoCuadrosDia2 $?años2 ?año)
                  (duracionVisitaDia2 (+ ?duracionVisitaDia2 ?dur2))
                  (tiempoCuadrosDia2 $?tiempoCuadros2 ?dur2)
                  )
)

(defrule primerasObrasDia2MenosRelevantes
   (declare (salience 52))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia2 $?obras2) (duracionVisitaDia2 ?duracion2) (tiempoCuadrosDia2 $?tiempos2)
                           (autoresCuadrosDia2 $?autores2) (añoCuadrosDia2 $?años2)))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre2)
           (autor ?autor2)
           (anio ?año2)
           (relevancia ?rel2&:(or (eq ?rel2 ?rel) (eq ?rel2 (+ ?rel 1)) (eq ?rel2 (- ?rel 1))))
           (complejidad ?comp2&:(eq ?comp2 ?comp))
           (duracion ?dur2)
           )           
   (not (ObrasUsadas (nombre ?nombre2)))
   (ObrasRelevantesNoCompletas (nombre ?nombre2)) ;; usa las menos relevantes si no hay relevantes
   =>
    (if (neq ?tipoGrupo 1) then (bind ?dur2 (* 1.5 ?dur2)))
   (assert (ObrasUsadas (nombre ?nombre2)))
   (assert (ProgramacionObras (obrasRecomendadasDia2 ?nombre2) (duracionVisitaDia2 ?dur2) (tiempoCuadrosDia2 ?dur2)
                              (autoresCuadrosDia2 ?autor2) (añoCuadrosDia2 ?año2)))
)

(defrule rellenarDia2ConMenosRelevantes
   (declare (salience 56))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia2 $?obras2) 
               (duracionVisitaDia2 ?duracionVisitaDia2)
               (tiempoCuadrosDia2 $?tiempoCuadros2)
               (autoresCuadrosDia2 $?autores2) 
               (añoCuadrosDia2 $?años2)
              )
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (duracion ?dur2)
           )
   (not (ObrasUsadas (nombre ?nombre))) 
   (ObrasRelevantesNoCompletas (nombre ?nombre))
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur2 (* 1.5 ?dur2)))
   (if (<= (+ ?dur2 ?duracionVisitaDia2) ?tiempo) then
        (assert (ObrasUsadas (nombre ?nombre)))
        (modify ?prog (obrasRecomendadasDia2 $?obras2 ?nombre)
                        (autoresCuadrosDia2 $?autores2 ?autor)
                        (añoCuadrosDia2 $?años2 ?año) 
                        (duracionVisitaDia2 (+ ?duracionVisitaDia2 ?dur2)) 
                        (tiempoCuadrosDia2 $?tiempoCuadros2 ?dur2)
                        ) 
   )
)

(defrule primerasObrasDia2ConRelleno
   (declare (salience 51))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia2 $?obras2) (duracionVisitaDia2 ?duracion2) (tiempoCuadrosDia2 $?tiempos2)
                           (autoresCuadrosDia2 $?autores2) (añoCuadrosDia2 $?años2) ))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre2)
           (autor ?autor2)
           (anio ?año2)
           (duracion ?dur2)
           )   

   (not (ObrasUsadas (nombre ?nombre2)))
   (ObrasRelleno (nombre ?nombre2)) ;; usa obras de relleno si no hay relevantes ni menos relevantes
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur2 (* 1.5 ?dur2)))
   (assert (ObrasUsadas (nombre ?nombre2)))
   (assert (ProgramacionObras (obrasRecomendadasDia2 ?nombre2) (duracionVisitaDia2 ?dur2) (tiempoCuadrosDia2 ?dur2)
                              (autoresCuadrosDia2 ?autor2) (añoCuadrosDia2 ?año2)))
)

(defrule rellenarDia2ConRelleno
   (declare (salience 54))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia2 $?obras2) 
               (duracionVisitaDia2 ?duracionVisitaDia2)
               (tiempoCuadrosDia2 $?tiempoCuadros2)
               (autoresCuadrosDia2 $?autores2) 
               (añoCuadrosDia2 $?años2)
               )
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (duracion ?dur2)
           )
   (not (ObrasUsadas (nombre ?nombre))) 
   (ObrasRelleno (nombre ?nombre))
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur2 (* 1.5 ?dur2)))
   (if (<= (+ ?dur2 ?duracionVisitaDia2) ?tiempo) then
        (assert (ObrasUsadas (nombre ?nombre)))
        (modify ?prog (obrasRecomendadasDia2 $?obras2 ?nombre)
                        (autoresCuadrosDia2 $?autores2 ?autor)
                        (añoCuadrosDia2 $?años2 ?año) 
                        (duracionVisitaDia2 (+ ?duracionVisitaDia2 ?dur2)) 
                        (tiempoCuadrosDia2 $?tiempoCuadros2 ?dur2)
                        ) 
   )
)


(defrule primerasObrasDia3
   (declare (salience 50))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia3 $?obras3) (duracionVisitaDia3 ?duracion3) (tiempoCuadrosDia3 $?tiempos3)
                           (autoresCuadrosDia3 $?autores3) (añoCuadrosDia3 $?años3) ))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre3)
           (autor ?autor3)
           (anio ?año3)
           (relevancia ?rel3&:(or (eq ?rel3 ?rel) (eq ?rel3 (+ ?rel 1)) (eq ?rel3 (- ?rel 1))))
           (complejidad ?comp3&:(eq ?comp3 ?comp))
           (duracion ?dur3)           
           )           
   (not (ObrasUsadas (nombre ?nombre3)))
   (ObrasRelevantes (nombre ?nombre3)) ;; usa las relevantes primero
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur3 (* 1.5 ?dur3)))
   (assert (ObrasUsadas (nombre ?nombre3)))
   (assert (ProgramacionObras (obrasRecomendadasDia3 ?nombre3) (duracionVisitaDia3 ?dur3) (tiempoCuadrosDia3 ?dur3)
                              (autoresCuadrosDia3 ?autor3) (añoCuadrosDia3 ?año3)))
)

(defrule añadirObrasDia3
   (declare (salience 58))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog3 <- (ProgramacionObras (obrasRecomendadasDia3 $?obras3)
                                (duracionVisitaDia3 ?duracionVisitaDia3)
                                (tiempoCuadrosDia3 $?tiempoCuadros3)
                                (autoresCuadrosDia3 $?autores3) 
                                (añoCuadrosDia3 $?años3)
                               )
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (relevancia ?rel3&:(or (eq ?rel3 ?rel) (eq ?rel3 (+ ?rel 1)) (eq ?rel3 (- ?rel 1))))
           (complejidad ?comp3&:(eq ?comp3 ?comp))
           (duracion ?dur3)
           )
   (not (ObrasUsadas (nombre ?nombre)))
    (ObrasRelevantes (nombre ?nombre)) ;; usa las relevantes primero 
   =>
    (if (neq ?tipoGrupo 1) then (bind ?dur3 (* 1.5 ?dur3)))
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog3 (obrasRecomendadasDia3 $?obras3 ?nombre)
                  (autoresCuadrosDia3 $?autores3 ?autor)
                  (añoCuadrosDia3 $?años3 ?año)
                  (duracionVisitaDia3 (+ ?duracionVisitaDia3 ?dur3))
                  (tiempoCuadrosDia3 $?tiempoCuadros3 ?dur3)
                  )
)

(defrule primerasObrasDia3MenosRelevantes
   (declare (salience 49))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia3 $?obras3) (duracionVisitaDia3 ?duracion3) (tiempoCuadrosDia3 $?tiempos3)
                           (autoresCuadrosDia3 $?autores3) (añoCuadrosDia3 $?años3)))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre3)
           (autor ?autor3)
           (anio ?año3)
           (relevancia ?rel3&:(or (eq ?rel3 ?rel) (eq ?rel3 (+ ?rel 1)) (eq ?rel3 (- ?rel 1))))
           (complejidad ?comp3&:(eq ?comp3 ?comp))
           (duracion ?dur3)
           )           
   (not (ObrasUsadas (nombre ?nombre3)))
   (ObrasRelevantesNoCompletas (nombre ?nombre3)) ;; usa las menos relevantes si no hay relevantes
   =>
    (if (neq ?tipoGrupo 1) then (bind ?dur3 (* 1.5 ?dur3)))
   (assert (ObrasUsadas (nombre ?nombre3)))
   (assert (ProgramacionObras (obrasRecomendadasDia3 ?nombre3) (duracionVisitaDia3 ?dur3) (tiempoCuadrosDia3 ?dur3)
                              (autoresCuadrosDia3 ?autor3) (añoCuadrosDia3 ?año3)))
)

(defrule rellenarDia3ConMenosRelevantes
   (declare (salience 48))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia3 $?obras3) 
               (duracionVisitaDia3 ?duracionVisitaDia3)
               (tiempoCuadrosDia3 $?tiempoCuadros3)
               (autoresCuadrosDia3 $?autores3) 
               (añoCuadrosDia3 $?años3)
              )
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (duracion ?dur3)
           )
   (not (ObrasUsadas (nombre ?nombre))) 
   (ObrasRelevantesNoCompletas (nombre ?nombre))
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur3 (* 1.5 ?dur3)))
   (if (<= (+ ?dur3 ?duracionVisitaDia3) ?tiempo) then
        (assert (ObrasUsadas (nombre ?nombre)))
        (modify ?prog (obrasRecomendadasDia3 $?obras3 ?nombre)
                        (autoresCuadrosDia3 $?autores3 ?autor)
                        (añoCuadrosDia3 $?años3 ?año) 
                        (duracionVisitaDia3 (+ ?duracionVisitaDia3 ?dur3)) 
                        (tiempoCuadrosDia3 $?tiempoCuadros3 ?dur3)
                        ) 
   )
)

(defrule primerasObrasDia3ConRelleno
   (declare (salience 47))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia3 $?obras3) (duracionVisitaDia3 ?duracion3) (tiempoCuadrosDia3 $?tiempos3)
                           (autoresCuadrosDia3 $?autores3) (añoCuadrosDia3 $?años3) ))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre3)
           (autor ?autor3)
           (anio ?año3)
           (duracion ?dur3)
           )   

   (not (ObrasUsadas (nombre ?nombre3)))
   (ObrasRelleno (nombre ?nombre3)) ;; usa obras de relleno si no hay relevantes ni menos relevantes
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur3 (* 1.5 ?dur3)))
   (assert (ObrasUsadas (nombre ?nombre3)))
   (assert (ProgramacionObras (obrasRecomendadasDia3 ?nombre3) (duracionVisitaDia3 ?dur3) (tiempoCuadrosDia3 ?dur3)
                              (autoresCuadrosDia3 ?autor3) (añoCuadrosDia3 ?año3)))
)

(defrule rellenarDia3ConRelleno
   (declare (salience 54))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia3 $?obras3) 
               (duracionVisitaDia3 ?duracionVisitaDia3)
               (tiempoCuadrosDia3 $?tiempoCuadros3)
               (autoresCuadrosDia3 $?autores3) 
               (añoCuadrosDia3 $?años3)
               )
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (duracion ?dur3)
           )
   (not (ObrasUsadas (nombre ?nombre))) 
   (ObrasRelleno (nombre ?nombre))
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur3 (* 1.5 ?dur3)))
   (if (<= (+ ?dur3 ?duracionVisitaDia3) ?tiempo) then
        (assert (ObrasUsadas (nombre ?nombre)))
        (modify ?prog (obrasRecomendadasDia3 $?obras3 ?nombre)
                        (autoresCuadrosDia3 $?autores3 ?autor)
                        (añoCuadrosDia3 $?años3 ?año) 
                        (duracionVisitaDia3 (+ ?duracionVisitaDia3 ?dur3)) 
                        (tiempoCuadrosDia3 $?tiempoCuadros3 ?dur3)
                        ) 
   )
)

(defrule primerasObrasDia4
   (declare (salience 46))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia4 $?obras4) (duracionVisitaDia4 ?duracion4) (tiempoCuadrosDia4 $?tiempos4)
                           (autoresCuadrosDia4 $?autores4) (añoCuadrosDia4 $?años4) ))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre4)
           (autor ?autor4)
           (anio ?año4)
           (relevancia ?rel4&:(or (eq ?rel4 ?rel) (eq ?rel4 (+ ?rel 1)) (eq ?rel4 (- ?rel 1))))
           (complejidad ?comp4&:(eq ?comp4 ?comp))
           (duracion ?dur4)           
           )           
   (not (ObrasUsadas (nombre ?nombre4)))
   (ObrasRelevantes (nombre ?nombre4)) ;; usa las relevantes primero
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur4 (* 1.5 ?dur4)))
   (assert (ObrasUsadas (nombre ?nombre4)))
   (assert (ProgramacionObras (obrasRecomendadasDia4 ?nombre4) (duracionVisitaDia4 ?dur4) (tiempoCuadrosDia4 ?dur4)
                              (autoresCuadrosDia4 ?autor4) (añoCuadrosDia4 ?año4)))
)

(defrule añadirObrasDia4
   (declare (salience 58))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog4 <- (ProgramacionObras (obrasRecomendadasDia4 $?obras4)
                                (duracionVisitaDia4 ?duracionVisitaDia4)
                                (tiempoCuadrosDia4 $?tiempoCuadros4)
                                (autoresCuadrosDia4 $?autores4) 
                                (añoCuadrosDia4 $?años4)
                               )
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (relevancia ?rel4&:(or (eq ?rel4 ?rel) (eq ?rel4 (+ ?rel 1)) (eq ?rel4 (- ?rel 1))))
           (complejidad ?comp4&:(eq ?comp4 ?comp))
           (duracion ?dur4)
           )
   (not (ObrasUsadas (nombre ?nombre)))
    (ObrasRelevantes (nombre ?nombre)) ;; usa las relevantes primero 
   =>
    (if (neq ?tipoGrupo 1) then (bind ?dur4 (* 1.5 ?dur4)))
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog4 (obrasRecomendadasDia4 $?obras4 ?nombre)
                  (autoresCuadrosDia4 $?autores4 ?autor)
                  (añoCuadrosDia4 $?años4 ?año)
                  (duracionVisitaDia4 (+ ?duracionVisitaDia4 ?dur4))
                  (tiempoCuadrosDia4 $?tiempoCuadros4 ?dur4)
                  )
)

(defrule primerasObrasDia4MenosRelevantes
   (declare (salience 45))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia4 $?obras4) (duracionVisitaDia4 ?duracion4) (tiempoCuadrosDia4 $?tiempos4)
                           (autoresCuadrosDia4 $?autores4) (añoCuadrosDia4 $?años4)))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre4)
           (autor ?autor4)
           (anio ?año4)
           (relevancia ?rel4&:(or (eq ?rel4 ?rel) (eq ?rel4 (+ ?rel 1)) (eq ?rel4 (- ?rel 1))))
           (complejidad ?comp4&:(eq ?comp4 ?comp))
           (duracion ?dur4)
           )           
   (not (ObrasUsadas (nombre ?nombre4)))
   (ObrasRelevantesNoCompletas (nombre ?nombre4)) ;; usa las menos relevantes si no hay relevantes
   =>
    (if (neq ?tipoGrupo 1) then (bind ?dur4 (* 1.5 ?dur4)))
   (assert (ObrasUsadas (nombre ?nombre4)))
   (assert (ProgramacionObras (obrasRecomendadasDia4 ?nombre4) (duracionVisitaDia4 ?dur4) (tiempoCuadrosDia4 ?dur4)
                              (autoresCuadrosDia4 ?autor4) (añoCuadrosDia4 ?año4)))
)

(defrule rellenarDia4ConMenosRelevantes
   (declare (salience 44))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia4 $?obras4) 
               (duracionVisitaDia4 ?duracionVisitaDia4)
               (tiempoCuadrosDia4 $?tiempoCuadros4)
               (autoresCuadrosDia4 $?autores4) 
               (añoCuadrosDia4 $?años4)
              )
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (duracion ?dur4)
           )
   (not (ObrasUsadas (nombre ?nombre))) 
   (ObrasRelevantesNoCompletas (nombre ?nombre))
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur4 (* 1.5 ?dur4)))
   (if (<= (+ ?dur4 ?duracionVisitaDia4) ?tiempo) then
        (assert (ObrasUsadas (nombre ?nombre)))
        (modify ?prog (obrasRecomendadasDia4 $?obras4 ?nombre)
                        (autoresCuadrosDia4 $?autores4 ?autor)
                        (añoCuadrosDia4 $?años4 ?año) 
                        (duracionVisitaDia4 (+ ?duracionVisitaDia4 ?dur4)) 
                        (tiempoCuadrosDia4 $?tiempoCuadros4 ?dur4)
                        ) 
   )
)

(defrule primerasObrasDia4ConRelleno
   (declare (salience 43))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia4 $?obras4) (duracionVisitaDia4 ?duracion4) (tiempoCuadrosDia4 $?tiempos4)
                           (autoresCuadrosDia4 $?autores4) (añoCuadrosDia4 $?años4) ))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre4)
           (autor ?autor4)
           (anio ?año4)
           (duracion ?dur4)
           )   

   (not (ObrasUsadas (nombre ?nombre4)))
   (ObrasRelleno (nombre ?nombre4)) ;; usa obras de relleno si no hay relevantes ni menos relevantes
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur4 (* 1.5 ?dur4)))
   (assert (ObrasUsadas (nombre ?nombre4)))
   (assert (ProgramacionObras (obrasRecomendadasDia4 ?nombre4) (duracionVisitaDia4 ?dur4) (tiempoCuadrosDia4 ?dur4)
                              (autoresCuadrosDia4 ?autor4) (añoCuadrosDia4 ?año4)))
)

(defrule rellenarDia4ConRelleno
   (declare (salience 42))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia4 $?obras4) 
               (duracionVisitaDia4 ?duracionVisitaDia4)
               (tiempoCuadrosDia4 $?tiempoCuadros4)
               (autoresCuadrosDia4 $?autores4) 
               (añoCuadrosDia4 $?años4)
               )
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (duracion ?dur4)
           )
   (not (ObrasUsadas (nombre ?nombre))) 
   (ObrasRelleno (nombre ?nombre))
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur4 (* 1.5 ?dur4)))
   (if (<= (+ ?dur4 ?duracionVisitaDia4) ?tiempo) then
        (assert (ObrasUsadas (nombre ?nombre)))
        (modify ?prog (obrasRecomendadasDia4 $?obras4 ?nombre)
                        (autoresCuadrosDia4 $?autores4 ?autor)
                        (añoCuadrosDia4 $?años4 ?año) 
                        (duracionVisitaDia4 (+ ?duracionVisitaDia4 ?dur4)) 
                        (tiempoCuadrosDia4 $?tiempoCuadros4 ?dur4)
                        ) 
   )
)


(defrule primerasObrasDia5
   (declare (salience 41))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia5 $?obras5) (duracionVisitaDia5 ?duracion5) (tiempoCuadrosDia5 $?tiempos5)
                           (autoresCuadrosDia5 $?autores5) (añoCuadrosDia5 $?años5) ))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre5)
           (autor ?autor5)
           (anio ?año5)
           (relevancia ?rel5&:(or (eq ?rel5 ?rel) (eq ?rel5 (+ ?rel 1)) (eq ?rel5 (- ?rel 1))))
           (complejidad ?comp5&:(eq ?comp5 ?comp))
           (duracion ?dur5)           
           )           
   (not (ObrasUsadas (nombre ?nombre5)))
   (ObrasRelevantes (nombre ?nombre5)) ;; usa las relevantes primero
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur5 (* 1.5 ?dur5)))
   (assert (ObrasUsadas (nombre ?nombre5)))
   (assert (ProgramacionObras (obrasRecomendadasDia5 ?nombre5) (duracionVisitaDia5 ?dur5) (tiempoCuadrosDia5 ?dur5)
                              (autoresCuadrosDia5 ?autor5) (añoCuadrosDia5 ?año5)))
)

(defrule añadirObrasDia5
   (declare (salience 40))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog5 <- (ProgramacionObras (obrasRecomendadasDia5 $?obras5)
                                (duracionVisitaDia5 ?duracionVisitaDia5)
                                (tiempoCuadrosDia5 $?tiempoCuadros5)
                                (autoresCuadrosDia5 $?autores5) 
                                (añoCuadrosDia5 $?años5)
                               )
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (relevancia ?rel5&:(or (eq ?rel5 ?rel) (eq ?rel5 (+ ?rel 1)) (eq ?rel5 (- ?rel 1))))
           (complejidad ?comp5&:(eq ?comp5 ?comp))
           (duracion ?dur5)
           )
   (not (ObrasUsadas (nombre ?nombre)))
    (ObrasRelevantes (nombre ?nombre)) ;; usa las relevantes primero 
   =>
    (if (neq ?tipoGrupo 1) then (bind ?dur5 (* 1.5 ?dur5)))
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog5 (obrasRecomendadasDia5 $?obras5 ?nombre)
                  (autoresCuadrosDia5 $?autores5 ?autor)
                  (añoCuadrosDia5 $?años5 ?año)
                  (duracionVisitaDia5 (+ ?duracionVisitaDia5 ?dur5))
                  (tiempoCuadrosDia5 $?tiempoCuadros5 ?dur5)
                  )
)

(defrule primerasObrasDia5MenosRelevantes
   (declare (salience 39))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia5 $?obras5) (duracionVisitaDia5 ?duracion5) (tiempoCuadrosDia5 $?tiempos5)
                           (autoresCuadrosDia5 $?autores5) (añoCuadrosDia5 $?años5)))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre5)
           (autor ?autor5)
           (anio ?año5)
           (relevancia ?rel5&:(or (eq ?rel5 ?rel) (eq ?rel5 (+ ?rel 1)) (eq ?rel5 (- ?rel 1))))
           (complejidad ?comp5&:(eq ?comp5 ?comp))
           (duracion ?dur5)
           )           
   (not (ObrasUsadas (nombre ?nombre5)))
   (ObrasRelevantesNoCompletas (nombre ?nombre5)) ;; usa las menos relevantes si no hay relevantes
   =>
    (if (neq ?tipoGrupo 1) then (bind ?dur5 (* 1.5 ?dur5)))
   (assert (ObrasUsadas (nombre ?nombre5)))
   (assert (ProgramacionObras (obrasRecomendadasDia5 ?nombre5) (duracionVisitaDia5 ?dur5) (tiempoCuadrosDia5 ?dur5)
                              (autoresCuadrosDia5 ?autor5) (añoCuadrosDia5 ?año5)))
)

(defrule rellenarDia5ConMenosRelevantes
   (declare (salience 38))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia5 $?obras5) 
               (duracionVisitaDia5 ?duracionVisitaDia5)
               (tiempoCuadrosDia5 $?tiempoCuadros5)
               (autoresCuadrosDia5 $?autores5) 
               (añoCuadrosDia5 $?años5)
              )
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (duracion ?dur5)
           )
   (not (ObrasUsadas (nombre ?nombre))) 
   (ObrasRelevantesNoCompletas (nombre ?nombre))
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur5 (* 1.5 ?dur5)))
   (if (<= (+ ?dur5 ?duracionVisitaDia5) ?tiempo) then
        (assert (ObrasUsadas (nombre ?nombre)))
        (modify ?prog (obrasRecomendadasDia5 $?obras5 ?nombre)
                        (autoresCuadrosDia5 $?autores5 ?autor)
                        (añoCuadrosDia5 $?años5 ?año) 
                        (duracionVisitaDia5 (+ ?duracionVisitaDia5 ?dur5)) 
                        (tiempoCuadrosDia5 $?tiempoCuadros5 ?dur5)
                        ) 
   )
)

(defrule primerasObrasDia5ConRelleno
   (declare (salience 37))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia5 $?obras5) (duracionVisitaDia5 ?duracion5) (tiempoCuadrosDia5 $?tiempos5)
                           (autoresCuadrosDia5 $?autores5) (añoCuadrosDia5 $?años5) ))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre5)
           (autor ?autor5)
           (anio ?año5)
           (duracion ?dur5)
           )   

   (not (ObrasUsadas (nombre ?nombre5)))
   (ObrasRelleno (nombre ?nombre5)) ;; usa obras de relleno si no hay relevantes ni menos relevantes
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur5 (* 1.5 ?dur5)))
   (assert (ObrasUsadas (nombre ?nombre5)))
   (assert (ProgramacionObras (obrasRecomendadasDia5 ?nombre5) (duracionVisitaDia5 ?dur5) (tiempoCuadrosDia5 ?dur5)
                              (autoresCuadrosDia5 ?autor5) (añoCuadrosDia5 ?año5)))
)

(defrule rellenarDia5ConRelleno
   (declare (salience 36))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia5 $?obras5) 
               (duracionVisitaDia5 ?duracionVisitaDia5)
               (tiempoCuadrosDia5 $?tiempoCuadros5)
               (autoresCuadrosDia5 $?autores5) 
               (añoCuadrosDia5 $?años5)
               )
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (duracion ?dur5)
           )
   (not (ObrasUsadas (nombre ?nombre))) 
   (ObrasRelleno (nombre ?nombre))
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur5 (* 1.5 ?dur5)))
   (if (<= (+ ?dur5 ?duracionVisitaDia5) ?tiempo) then
        (assert (ObrasUsadas (nombre ?nombre)))
        (modify ?prog (obrasRecomendadasDia5 $?obras5 ?nombre)
                        (autoresCuadrosDia5 $?autores5 ?autor)
                        (añoCuadrosDia5 $?años5 ?año) 
                        (duracionVisitaDia5 (+ ?duracionVisitaDia5 ?dur5)) 
                        (tiempoCuadrosDia5 $?tiempoCuadros5 ?dur5)
                        ) 
   )
)


(defrule primerasObrasDia6
   (declare (salience 35))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia6 $?obras6) (duracionVisitaDia6 ?duracion6) (tiempoCuadrosDia6 $?tiempos6)
                           (autoresCuadrosDia6 $?autores6) (añoCuadrosDia6 $?años6) ))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre6)
           (autor ?autor6)
           (anio ?año6)
           (relevancia ?rel6&:(or (eq ?rel6 ?rel) (eq ?rel6 (+ ?rel 1)) (eq ?rel6 (- ?rel 1))))
           (complejidad ?comp6&:(eq ?comp6 ?comp))
           (duracion ?dur6)           
           )           
   (not (ObrasUsadas (nombre ?nombre6)))
   (ObrasRelevantes (nombre ?nombre6)) ;; usa las relevantes primero
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur6 (* 1.5 ?dur6)))
   (assert (ObrasUsadas (nombre ?nombre6)))
   (assert (ProgramacionObras (obrasRecomendadasDia6 ?nombre6) (duracionVisitaDia6 ?dur6) (tiempoCuadrosDia6 ?dur6)
                              (autoresCuadrosDia6 ?autor6) (añoCuadrosDia6 ?año6)))
)

(defrule añadirObrasDia6
   (declare (salience 34))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog6 <- (ProgramacionObras (obrasRecomendadasDia6 $?obras6)
                                (duracionVisitaDia6 ?duracionVisitaDia6)
                                (tiempoCuadrosDia6 $?tiempoCuadros6)
                                (autoresCuadrosDia6 $?autores6) 
                                (añoCuadrosDia6 $?años6)
                               )
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (relevancia ?rel6&:(or (eq ?rel6 ?rel) (eq ?rel6 (+ ?rel 1)) (eq ?rel6 (- ?rel 1))))
           (complejidad ?comp6&:(eq ?comp6 ?comp))
           (duracion ?dur6)
           )
   (not (ObrasUsadas (nombre ?nombre)))
    (ObrasRelevantes (nombre ?nombre)) ;; usa las relevantes primero 
   =>
    (if (neq ?tipoGrupo 1) then (bind ?dur6 (* 1.5 ?dur6)))
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog6 (obrasRecomendadasDia6 $?obras6 ?nombre)
                  (autoresCuadrosDia6 $?autores6 ?autor)
                  (añoCuadrosDia6 $?años6 ?año)
                  (duracionVisitaDia6 (+ ?duracionVisitaDia6 ?dur6))
                  (tiempoCuadrosDia6 $?tiempoCuadros6 ?dur6)
                  )
)

(defrule primerasObrasDia6MenosRelevantes
   (declare (salience 33))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia6 $?obras6) (duracionVisitaDia6 ?duracion6) (tiempoCuadrosDia6 $?tiempos6)
                           (autoresCuadrosDia6 $?autores6) (añoCuadrosDia6 $?años6)))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre6)
           (autor ?autor6)
           (anio ?año6)
           (relevancia ?rel6&:(or (eq ?rel6 ?rel) (eq ?rel6 (+ ?rel 1)) (eq ?rel6 (- ?rel 1))))
           (complejidad ?comp6&:(eq ?comp6 ?comp))
           (duracion ?dur6)
           )           
   (not (ObrasUsadas (nombre ?nombre6)))
   (ObrasRelevantesNoCompletas (nombre ?nombre6)) ;; usa las menos relevantes si no hay relevantes
   =>
    (if (neq ?tipoGrupo 1) then (bind ?dur6 (* 1.5 ?dur6)))
   (assert (ObrasUsadas (nombre ?nombre6)))
   (assert (ProgramacionObras (obrasRecomendadasDia6 ?nombre6) (duracionVisitaDia6 ?dur6) (tiempoCuadrosDia6 ?dur6)
                              (autoresCuadrosDia6 ?autor6) (añoCuadrosDia6 ?año6)))
)

(defrule rellenarDia6ConMenosRelevantes
   (declare (salience 32))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia6 $?obras6) 
               (duracionVisitaDia6 ?duracionVisitaDia6)
               (tiempoCuadrosDia6 $?tiempoCuadros6)
               (autoresCuadrosDia6 $?autores6) 
               (añoCuadrosDia6 $?años6)
              )
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (duracion ?dur6)
           )
   (not (ObrasUsadas (nombre ?nombre))) 
   (ObrasRelevantesNoCompletas (nombre ?nombre))
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur6 (* 1.5 ?dur6)))
   (if (<= (+ ?dur6 ?duracionVisitaDia6) ?tiempo) then
        (assert (ObrasUsadas (nombre ?nombre)))
        (modify ?prog (obrasRecomendadasDia6 $?obras6 ?nombre)
                        (autoresCuadrosDia6 $?autores6 ?autor)
                        (añoCuadrosDia6 $?años6 ?año) 
                        (duracionVisitaDia6 (+ ?duracionVisitaDia6 ?dur6)) 
                        (tiempoCuadrosDia6 $?tiempoCuadros6 ?dur6)
                        ) 
   )
)

(defrule primerasObrasDia6ConRelleno
   (declare (salience 31))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia6 $?obras6) (duracionVisitaDia6 ?duracion6) (tiempoCuadrosDia6 $?tiempos6)
                           (autoresCuadrosDia6 $?autores6) (añoCuadrosDia6 $?años6) ))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre6)
           (autor ?autor6)
           (anio ?año6)
           (duracion ?dur6)
           )   

   (not (ObrasUsadas (nombre ?nombre6)))
   (ObrasRelleno (nombre ?nombre6)) ;; usa obras de relleno si no hay relevantes ni menos relevantes
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur6 (* 1.5 ?dur6)))
   (assert (ObrasUsadas (nombre ?nombre6)))
   (assert (ProgramacionObras (obrasRecomendadasDia6 ?nombre6) (duracionVisitaDia6 ?dur6) (tiempoCuadrosDia6 ?dur6)
                              (autoresCuadrosDia6 ?autor6) (añoCuadrosDia6 ?año6)))
)

(defrule rellenarDia6ConRelleno
   (declare (salience 30))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia6 $?obras6) 
               (duracionVisitaDia6 ?duracionVisitaDia6)
               (tiempoCuadrosDia6 $?tiempoCuadros6)
               (autoresCuadrosDia6 $?autores6) 
               (añoCuadrosDia6 $?años6)
               )
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (duracion ?dur6)
           )
   (not (ObrasUsadas (nombre ?nombre))) 
   (ObrasRelleno (nombre ?nombre))
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur6 (* 1.5 ?dur6)))
   (if (<= (+ ?dur6 ?duracionVisitaDia6) ?tiempo) then
        (assert (ObrasUsadas (nombre ?nombre)))
        (modify ?prog (obrasRecomendadasDia6 $?obras6 ?nombre)
                        (autoresCuadrosDia6 $?autores6 ?autor)
                        (añoCuadrosDia6 $?años6 ?año) 
                        (duracionVisitaDia6 (+ ?duracionVisitaDia6 ?dur6)) 
                        (tiempoCuadrosDia6 $?tiempoCuadros6 ?dur6)
                        ) 
   )
)

(defrule primerasObrasDia7
   (declare (salience 29))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia7 $?obras7) (duracionVisitaDia7 ?duracion7) (tiempoCuadrosDia7 $?tiempos7)
                           (autoresCuadrosDia7 $?autores7) (añoCuadrosDia7 $?años7) ))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre7)
           (autor ?autor7)
           (anio ?año7)
           (relevancia ?rel7&:(or (eq ?rel7 ?rel) (eq ?rel7 (+ ?rel 1)) (eq ?rel7 (- ?rel 1))))
           (complejidad ?comp7&:(eq ?comp7 ?comp))
           (duracion ?dur7)           
           )           
   (not (ObrasUsadas (nombre ?nombre7)))
   (ObrasRelevantes (nombre ?nombre7)) ;; usa las relevantes primero
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur7 (* 1.7 ?dur7)))
   (assert (ObrasUsadas (nombre ?nombre7)))
   (assert (ProgramacionObras (obrasRecomendadasDia7 ?nombre7) (duracionVisitaDia7 ?dur7) (tiempoCuadrosDia7 ?dur7)
                              (autoresCuadrosDia7 ?autor7) (añoCuadrosDia7 ?año7)))
)

(defrule añadirObrasDia7
   (declare (salience 28))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog7 <- (ProgramacionObras (obrasRecomendadasDia7 $?obras7)
                                (duracionVisitaDia7 ?duracionVisitaDia7)
                                (tiempoCuadrosDia7 $?tiempoCuadros7)
                                (autoresCuadrosDia7 $?autores7) 
                                (añoCuadrosDia7 $?años7)
                               )
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (relevancia ?rel7&:(or (eq ?rel7 ?rel) (eq ?rel7 (+ ?rel 1)) (eq ?rel7 (- ?rel 1))))
           (complejidad ?comp7&:(eq ?comp7 ?comp))
           (duracion ?dur7)
           )
   (not (ObrasUsadas (nombre ?nombre)))
    (ObrasRelevantes (nombre ?nombre)) ;; usa las relevantes primero 
   =>
    (if (neq ?tipoGrupo 1) then (bind ?dur7 (* 1.7 ?dur7)))
   (assert (ObrasUsadas (nombre ?nombre)))
   (modify ?prog7 (obrasRecomendadasDia7 $?obras7 ?nombre)
                  (autoresCuadrosDia7 $?autores7 ?autor)
                  (añoCuadrosDia7 $?años7 ?año)
                  (duracionVisitaDia7 (+ ?duracionVisitaDia7 ?dur7))
                  (tiempoCuadrosDia7 $?tiempoCuadros7 ?dur7)
                  )
)

(defrule primerasObrasDia7MenosRelevantes
   (declare (salience 27))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia7 $?obras7) (duracionVisitaDia7 ?duracion7) (tiempoCuadrosDia7 $?tiempos7)
                           (autoresCuadrosDia7 $?autores7) (añoCuadrosDia7 $?años7)))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre7)
           (autor ?autor7)
           (anio ?año7)
           (relevancia ?rel7&:(or (eq ?rel7 ?rel) (eq ?rel7 (+ ?rel 1)) (eq ?rel7 (- ?rel 1))))
           (complejidad ?comp7&:(eq ?comp7 ?comp))
           (duracion ?dur7)
           )           
   (not (ObrasUsadas (nombre ?nombre7)))
   (ObrasRelevantesNoCompletas (nombre ?nombre7)) ;; usa las menos relevantes si no hay relevantes
   =>
    (if (neq ?tipoGrupo 1) then (bind ?dur7 (* 1.7 ?dur7)))
   (assert (ObrasUsadas (nombre ?nombre7)))
   (assert (ProgramacionObras (obrasRecomendadasDia7 ?nombre7) (duracionVisitaDia7 ?dur7) (tiempoCuadrosDia7 ?dur7)
                              (autoresCuadrosDia7 ?autor7) (añoCuadrosDia7 ?año7)))
)

(defrule rellenarDia7ConMenosRelevantes
   (declare (salience 26))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia7 $?obras7) 
               (duracionVisitaDia7 ?duracionVisitaDia7)
               (tiempoCuadrosDia7 $?tiempoCuadros7)
               (autoresCuadrosDia7 $?autores7) 
               (añoCuadrosDia7 $?años7)
              )
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (duracion ?dur7)
           )
   (not (ObrasUsadas (nombre ?nombre))) 
   (ObrasRelevantesNoCompletas (nombre ?nombre))
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur7 (* 1.7 ?dur7)))
   (if (<= (+ ?dur7 ?duracionVisitaDia7) ?tiempo) then
        (assert (ObrasUsadas (nombre ?nombre)))
        (modify ?prog (obrasRecomendadasDia7 $?obras7 ?nombre)
                        (autoresCuadrosDia7 $?autores7 ?autor)
                        (añoCuadrosDia7 $?años7 ?año) 
                        (duracionVisitaDia7 (+ ?duracionVisitaDia7 ?dur7)) 
                        (tiempoCuadrosDia7 $?tiempoCuadros7 ?dur7)
                        ) 
   )
)

(defrule primerasObrasDia7ConRelleno
   (declare (salience 25))
   (Cliente (tipoGrupo ?tipoGrupo))
   (not (ProgramacionObras (obrasRecomendadasDia7 $?obras7) (duracionVisitaDia7 ?duracion7) (tiempoCuadrosDia7 $?tiempos7)
                           (autoresCuadrosDia7 $?autores7) (añoCuadrosDia7 $?años7) ))
   (ObraAbstraida (relevancia ?rel) (complejidad ?comp))
   (object (is-a Obra)
           (nombre ?nombre7)
           (autor ?autor7)
           (anio ?año7)
           (duracion ?dur7)
           )   

   (not (ObrasUsadas (nombre ?nombre7)))
   (ObrasRelleno (nombre ?nombre7)) ;; usa obras de relleno si no hay relevantes ni menos relevantes
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur7 (* 1.7 ?dur7)))
   (assert (ObrasUsadas (nombre ?nombre7)))
   (assert (ProgramacionObras (obrasRecomendadasDia7 ?nombre7) (duracionVisitaDia7 ?dur7) (tiempoCuadrosDia7 ?dur7)
                              (autoresCuadrosDia7 ?autor7) (añoCuadrosDia7 ?año7)))
)

(defrule rellenarDia7ConRelleno
   (declare (salience 24))
   (Cliente (tipoGrupo ?tipoGrupo))
   (VisitanteAbstraido (diasVisita ?dias) (tiempoVisita ?tiempo))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia7 $?obras7) 
               (duracionVisitaDia7 ?duracionVisitaDia7)
               (tiempoCuadrosDia7 $?tiempoCuadros7)
               (autoresCuadrosDia7 $?autores7) 
               (añoCuadrosDia7 $?años7)
               )
   (object (is-a Obra)
           (nombre ?nombre)
           (autor ?autor)
           (anio ?año)
           (duracion ?dur7)
           )
   (not (ObrasUsadas (nombre ?nombre))) 
   (ObrasRelleno (nombre ?nombre))
   =>
   (if (neq ?tipoGrupo 1) then (bind ?dur7 (* 1.7 ?dur7)))
   (if (<= (+ ?dur7 ?duracionVisitaDia7) ?tiempo) then
        (assert (ObrasUsadas (nombre ?nombre)))
        (modify ?prog (obrasRecomendadasDia7 $?obras7 ?nombre)
                        (autoresCuadrosDia7 $?autores7 ?autor)
                        (añoCuadrosDia7 $?años7 ?año) 
                        (duracionVisitaDia7 (+ ?duracionVisitaDia7 ?dur7)) 
                        (tiempoCuadrosDia7 $?tiempoCuadros7 ?dur7)
                        ) 
   )
)


(defrule pasoRespuesta
    (declare (salience 15))
    =>
    (focus RESPUESTA)
)

;-----------------------
;--MÓDULO DE RESPUESTA--
;-----------------------
(defmodule RESPUESTA (import REFINAMIENTO ?ALL) (export ?ALL))

(defrule escribir-visita
    (declare (salience 1))
    (ProgramacionObras (obrasRecomendadasDia1 $?dia1)
            (obrasRecomendadasDia2 $?dia2)
            (obrasRecomendadasDia3 $?dia3)
            (obrasRecomendadasDia4 $?dia4)
            (obrasRecomendadasDia5 $?dia5)
            (obrasRecomendadasDia6 $?dia6)
            (obrasRecomendadasDia7 $?dia7)
            (duracionVisitaDia1 ?tiempo1)
            (duracionVisitaDia2 ?tiempo2)
            (duracionVisitaDia3 ?tiempo3)
            (duracionVisitaDia4 ?tiempo4)
            (duracionVisitaDia5 ?tiempo5)
            (duracionVisitaDia6 ?tiempo6)
            (duracionVisitaDia7 ?tiempo7)
            (tiempoCuadrosDia1 $?tiempoCuadros1)
            (tiempoCuadrosDia2 $?tiempoCuadros2)
            (tiempoCuadrosDia3 $?tiempoCuadros3)
            (tiempoCuadrosDia4 $?tiempoCuadros4)
            (tiempoCuadrosDia5 $?tiempoCuadros5)
            (tiempoCuadrosDia6 $?tiempoCuadros6)
            (tiempoCuadrosDia7 $?tiempoCuadros7)
            (autoresCuadrosDia1 $?autores1)
            (autoresCuadrosDia2 $?autores2)
            (autoresCuadrosDia3 $?autores3)
            (autoresCuadrosDia4 $?autores4)
            (autoresCuadrosDia5 $?autores5)
            (autoresCuadrosDia6 $?autores6)
            (autoresCuadrosDia7 $?autores7)
            (añoCuadrosDia1 $?años1)
            (añoCuadrosDia2 $?años2)
            (añoCuadrosDia3 $?años3)
            (añoCuadrosDia4 $?años4)
            (añoCuadrosDia5 $?años5)
            (añoCuadrosDia6 $?años6)
            (añoCuadrosDia7 $?años7)
            )
    (VisitanteAbstraido (diasVisita ?numDias))
    =>
    (printout t crlf crlf "RESULTADO VISITA:" crlf)

    (printout t "DIA 1:" crlf)
    (bind ?index 1)
    (bind ?sala 1)
    (foreach ?obra ?dia1
        (bind ?tiempo (nth$ ?index ?tiempoCuadros1))
        (bind ?autor (nth$ ?index ?autores1)) 
        (bind ?año (nth$ ?index ?años1))
        (if (= (mod ?index 5) 0)
        then (bind ?sala (+ ?sala 1)))
        (printout t " - " ?obra " (" ?año "), de " ?autor "." crlf)
        (printout t "Sala: " ?sala ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf crlf)
        (bind ?index (+ ?index 1))
    )
    (printout t "Tiempo estimado visita día 1: " ?tiempo1 " minutos" crlf)

    (printout t " " crlf)

    (if (>= ?numDias 2) then
        (printout t "DIA 2:" crlf)
        (bind ?index 1)
        (foreach ?obra ?dia2
            (bind ?tiempo (nth$ ?index ?tiempoCuadros2)) 
            (bind ?autor (nth$ ?index ?autores2)) 
            (bind ?año (nth$ ?index ?años2))
            (if (= (mod ?index 5) 0)
            then (bind ?sala (+ ?sala 1)))
            (printout t " - " ?obra " (" ?año "), de " ?autor "." crlf)
            (printout t "Sala: " ?sala ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf crlf)
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
            (bind ?autor (nth$ ?index ?autores3)) 
            (bind ?año (nth$ ?index ?años3))
            (if (= (mod ?index 5) 0)
            then (bind ?sala (+ ?sala 1)))
            (printout t " - " ?obra " (" ?año "), de " ?autor "." crlf)
            (printout t "Sala: " ?sala ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf crlf)
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
            (bind ?autor (nth$ ?index ?autores4)) 
            (bind ?año (nth$ ?index ?años4))
            (if (= (mod ?index 5) 0)
            then (bind ?sala (+ ?sala 1)))
            (printout t " - " ?obra " (" ?año "), de " ?autor "." crlf)
            (printout t "Sala: " ?sala ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf crlf)
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
            (bind ?autor (nth$ ?index ?autores5)) 
            (bind ?año (nth$ ?index ?años5))
            (if (= (mod ?index 5) 0)
            then (bind ?sala (+ ?sala 1)))
            (printout t " - " ?obra " (" ?año "), de " ?autor "." crlf)
            (printout t "Sala: " ?sala ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf crlf)
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
            (bind ?autor (nth$ ?index ?autores6)) 
            (bind ?año (nth$ ?index ?años6))
            (if (= (mod ?index 5) 0)
            then (bind ?sala (+ ?sala 1)))
            (printout t " - " ?obra " (" ?año "), de " ?autor "." crlf)
            (printout t "Sala: " ?sala ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf crlf)
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
            (bind ?autor (nth$ ?index ?autores7)) 
            (bind ?año (nth$ ?index ?años7))
            (if (= (mod ?index 5) 0)
            then (bind ?sala (+ ?sala 1)))
            (printout t " - " ?obra " (" ?año "), de " ?autor "." crlf)
            (printout t "Sala: " ?sala ". Tiempo invertido en la obra: " ?tiempo " minutos" crlf crlf)
            (bind ?index (+ ?index 1))
        )
        (printout t "Tiempo estimado visita día 7: " ?tiempo7 " minutos" crlf)

        (printout t " " crlf)
    )


    (printout t "-------------" crlf)
    (printout t "Recuerda que el museo abre todos los días de 9:00h a 18:00. ¡Que tengas una buena visita!" crlf)
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

