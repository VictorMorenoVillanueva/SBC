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

(defmodule ABSTRACCION (import PREGUNTAS ?ALL) (export ?ALL))

(deftemplate VisitanteAbstraido
    (slot tiempoTotalVisita (type INTEGER)) ; Tiempo total disponible calculado (días * (horas diarias - descanso diario))
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
    (bind ?tiempoTotal (* ?dias (- ?horas ?descanso)))

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
            (tiempoTotalVisita ?tiempoTotal)
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
        (printout t "Tiempo total de la visita (minutos): " ?tiempoTotal crlf)
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

    (printout t "Abstracción del visitante creada correctamente." crlf crlf)
    (focus ASOCIACION)
)


;------------------------
;--MÓDULO DE ASOCIACION--
;------------------------

(defmodule ASOCIACION (import ABSTRACCION ?ALL) (export ?ALL))

(deftemplate ObraAbstraida
    (slot autor (type STRING))
    (slot epoca (type STRING))
    (slot anio (type INTEGER))
    (slot estilo (type STRING))
    (slot tematica (type STRING))
    (slot dimensiones (type STRING))
    (slot sala (type INTEGER))
    (slot relevancia (type INTEGER))
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
    ?obra <- (ObraAbstraida (relevancia ?relevancia&:(eq ?relevancia -1)))
    =>
    (switch ?interes
        (case "Poco Conocidas" then
            (modify ?obra (relevancia 1)))
        (case "Conocidas" then
            (modify ?obra (relevancia 2)))
        (case "Famosas" then
            (modify ?obra (relevancia 3)))
    )
)



(defrule pasoRefinamiento
    (declare (salience 81))
    =>
    (focus REFINAMIENTO)
)


;--------------------------
;--MÓDULO DE REFINAMIENTO--
;--------------------------


(defmodule REFINAMIENTO (import ASOCIACION ?ALL) (export ?ALL))

(deftemplate ProgramacionObras
    (multislot obrasRecomendadasDia1 (type STRING))
    (slot duracionVisitaDia1 (default 0))
    (multislot obrasRecomendadasDia2 (type STRING))
    (slot duracionVisitaDia2 (default 0))
    (multislot obrasRecomendadasDia3 (type STRING))
    (slot duracionVisitaDia3 (default 0))
    (multislot obrasRecomendadasDia4 (type STRING))
    (slot duracionVisitaDia4 (default 0))
    (multislot obrasRecomendadasDia5 (type STRING))
    (slot duracionVisitaDia5 (default 0))
    (multislot obrasRecomendadasDia6 (type STRING))
    (slot duracionVisitaDia6 (default 0))
    (multislot obrasRecomendadasDia7 (type STRING))
    (slot duracionVisitaDia7 (default 0))
    (multislot obrasRecomendadasDia8 (type STRING))
    (slot duracionVisitaDia8 (default 0))
    (multislot obrasRecomendadasDia9 (type STRING))
    (slot duracionVisitaDia9 (default 0))
    (multislot obrasRecomendadasDia10 (type STRING))
    (slot duracionVisitaDia10 (default 0))
)


(defrule REFINAMIENTO::refinarRelevanciaObra
   "Ajusta las obras sugeridas según la relevancia deseada por el visitante"
   (declare (salience 80))
   (VisitanteAbstraido (relevanciaInteresAbstracta ?nivelInteres))
   ?obra <- (ObraAbstraida (autor ?autor) (relevancia ?relevancia))
   =>
   (if (and (eq ?nivelInteres "Poco conocidas") (< ?relevancia 2))
      then
         (printout t "Obra con relevancia ajustada: " crlf)
         (printout t "Autor: " ?autor ", Relevancia Ajustada: Poco Conocidas" crlf)
   )
   (if (and (eq ?nivelInteres "Conocidas") (= ?relevancia 2))
      then
         (printout t "Obra con relevancia ajustada: " crlf)
         (printout t "Autor: " ?autor ", Relevancia Ajustada: Conocidas" crlf)
   )
   (if (and (eq ?nivelInteres "Famosas") (= ?relevancia 3))
      then
         (printout t "Obra con relevancia ajustada: " crlf)
         (printout t "Autor: " ?autor ", Relevancia Ajustada: Famosas" crlf)
   )
)


(defrule primerasRecomendacionesDia1
   (declare (salience 51))
   (not (ProgramacionObras (obrasRecomendadasDia1 $?obrasDia1)))
   (VisitanteAbstraido (relevanciaInteresAbstracta ?nivelRelevancia))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia&:(eq ?relevancia (if (eq ?nivelRelevancia "Poco conocidas") then 1 else
                                                          (if (eq ?nivelRelevancia "Conocidas") then 2 else 3)))))
   =>
   (assert (ProgramacionObras (obrasRecomendadasDia1 ?autor)))
)

(defrule añadirObrasDia1
   (declare (salience 50))
   ?cliente <- (Cliente (horasDiarias ?horas) (descansoDiario ?descanso))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia1 $?obrasDia1)
                                (duracionVisitaDia1 ?duracionVisitaDia1))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia)
              (anio ?anio)
              (epoca ?epoca)
              (estilo ?estilo)
              (tematica ?tematica)
              (dimensiones ?dimensiones))
   =>
   (bind ?tiempoDisponibleDia (- ?horas ?descanso))
   (if (< (+ ?duracionVisitaDia1 ?relevancia) ?tiempoDisponibleDia)
      then
         (assert (ProgramacionObras (obrasRecomendadasDia1 $?obrasDia1 ?autor)
                                    (duracionVisitaDia1 (+ ?duracionVisitaDia1 ?relevancia))))
         (printout t "Añadiendo obra al Día 1: " ?autor ", relevancia: " ?relevancia crlf)
   )
)

(defrule primerasRecomendacionesDia2
   (declare (salience 51))
   (not (ProgramacionObras (obrasRecomendadasDia2 $?obrasDia2)))
   (VisitanteAbstraido (relevanciaInteresAbstracta ?nivelRelevancia))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia&:(eq ?relevancia (if (eq ?nivelRelevancia "Poco conocidas") then 1 else
                                                          (if (eq ?nivelRelevancia "Conocidas") then 2 else 3)))))
   =>
   (assert (ProgramacionObras (obrasRecomendadasDia2 ?autor)))
)

(defrule añadirObrasDia2
   (declare (salience 50))
   ?cliente <- (Cliente (horasDiarias ?horas) (descansoDiario ?descanso))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia2 $?obrasDia2)
                                (duracionVisitaDia2 ?duracionVisitaDia2))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia)
              (anio ?anio)
              (epoca ?epoca)
              (estilo ?estilo)
              (tematica ?tematica)
              (dimensiones ?dimensiones))
   =>
   (bind ?tiempoDisponibleDia (- ?horas ?descanso))
   (if (< (+ ?duracionVisitaDia2 ?relevancia) ?tiempoDisponibleDia)
      then
         (assert (ProgramacionObras (obrasRecomendadasDia2 $?obrasDia2 ?autor)
                                    (duracionVisitaDia2 (+ ?duracionVisitaDia2 ?relevancia))))
         (printout t "Añadiendo obra al Día 2: " ?autor ", relevancia: " ?relevancia crlf)
   )
)

(defrule primerasRecomendacionesDia3
   (declare (salience 51))
   (not (ProgramacionObras (obrasRecomendadasDia3 $?obrasDia3)))
   (VisitanteAbstraido (relevanciaInteresAbstracta ?nivelRelevancia))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia&:(eq ?relevancia (if (eq ?nivelRelevancia "Poco conocidas") then 1 else
                                                          (if (eq ?nivelRelevancia "Conocidas") then 2 else 3)))))
   =>
   (assert (ProgramacionObras (obrasRecomendadasDia3 ?autor)))
)

(defrule añadirObrasDia3
   (declare (salience 50))
   ?cliente <- (Cliente (horasDiarias ?horas) (descansoDiario ?descanso))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia3 $?obrasDia3)
                                (duracionVisitaDia3 ?duracionVisitaDia3))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia)
              (anio ?anio)
              (epoca ?epoca)
              (estilo ?estilo)
              (tematica ?tematica)
              (dimensiones ?dimensiones))
   =>
   (bind ?tiempoDisponibleDia (- ?horas ?descanso))
   (if (< (+ ?duracionVisitaDia3 ?relevancia) ?tiempoDisponibleDia)
      then
         (assert (ProgramacionObras (obrasRecomendadasDia3 $?obrasDia3 ?autor)
                                    (duracionVisitaDia3 (+ ?duracionVisitaDia3 ?relevancia))))
         (printout t "Añadiendo obra al Día 3: " ?autor ", relevancia: " ?relevancia crlf)
   )
)

(defrule primerasRecomendacionesDia4
   (declare (salience 51))
   (not (ProgramacionObras (obrasRecomendadasDia4 $?obrasDia4)))
   (VisitanteAbstraido (relevanciaInteresAbstracta ?nivelRelevancia))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia&:(eq ?relevancia (if (eq ?nivelRelevancia "Poco conocidas") then 1 else
                                                          (if (eq ?nivelRelevancia "Conocidas") then 2 else 3)))))
   =>
   (assert (ProgramacionObras (obrasRecomendadasDia4 ?autor)))
)

(defrule añadirObrasDia4
   (declare (salience 50))
   ?cliente <- (Cliente (horasDiarias ?horas) (descansoDiario ?descanso))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia4 $?obrasDia4)
                                (duracionVisitaDia4 ?duracionVisitaDia4))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia)
              (anio ?anio)
              (epoca ?epoca)
              (estilo ?estilo)
              (tematica ?tematica)
              (dimensiones ?dimensiones))
   =>
   (bind ?tiempoDisponibleDia (- ?horas ?descanso))
   (if (< (+ ?duracionVisitaDia4 ?relevancia) ?tiempoDisponibleDia)
      then
         (assert (ProgramacionObras (obrasRecomendadasDia4 $?obrasDia4 ?autor)
                                    (duracionVisitaDia4 (+ ?duracionVisitaDia4 ?relevancia))))
         (printout t "Añadiendo obra al Día 4: " ?autor ", relevancia: " ?relevancia crlf)
   )
)

(defrule primerasRecomendacionesDia5
   (declare (salience 51))
   (not (ProgramacionObras (obrasRecomendadasDia5 $?obrasDia5)))
   (VisitanteAbstraido (relevanciaInteresAbstracta ?nivelRelevancia))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia&:(eq ?relevancia (if (eq ?nivelRelevancia "Poco conocidas") then 1 else
                                                          (if (eq ?nivelRelevancia "Conocidas") then 2 else 3)))))
   =>
   (assert (ProgramacionObras (obrasRecomendadasDia5 ?autor)))
)

(defrule añadirObrasDia5
   (declare (salience 50))
   ?cliente <- (Cliente (horasDiarias ?horas) (descansoDiario ?descanso))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia5 $?obrasDia5)
                                (duracionVisitaDia5 ?duracionVisitaDia5))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia)
              (anio ?anio)
              (epoca ?epoca)
              (estilo ?estilo)
              (tematica ?tematica)
              (dimensiones ?dimensiones))
   =>
   (bind ?tiempoDisponibleDia (- ?horas ?descanso))
   (if (< (+ ?duracionVisitaDia5 ?relevancia) ?tiempoDisponibleDia)
      then
         (assert (ProgramacionObras (obrasRecomendadasDia5 $?obrasDia5 ?autor)
                                    (duracionVisitaDia5 (+ ?duracionVisitaDia5 ?relevancia))))
         (printout t "Añadiendo obra al Día 5: " ?autor ", relevancia: " ?relevancia crlf)
   )
)

(defrule primerasRecomendacionesDia6
   (declare (salience 51))
   (not (ProgramacionObras (obrasRecomendadasDia6 $?obrasDia6)))
   (VisitanteAbstraido (relevanciaInteresAbstracta ?nivelRelevancia))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia&:(eq ?relevancia (if (eq ?nivelRelevancia "Poco conocidas") then 1 else
                                                          (if (eq ?nivelRelevancia "Conocidas") then 2 else 3)))))
   =>
   (assert (ProgramacionObras (obrasRecomendadasDia6 ?autor)))
)

(defrule añadirObrasDia6
   (declare (salience 50))
   ?cliente <- (Cliente (horasDiarias ?horas) (descansoDiario ?descanso))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia6 $?obrasDia6)
                                (duracionVisitaDia6 ?duracionVisitaDia6))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia)
              (anio ?anio)
              (epoca ?epoca)
              (estilo ?estilo)
              (tematica ?tematica)
              (dimensiones ?dimensiones))
   =>
   (bind ?tiempoDisponibleDia (- ?horas ?descanso))
   (if (< (+ ?duracionVisitaDia6 ?relevancia) ?tiempoDisponibleDia)
      then
         (assert (ProgramacionObras (obrasRecomendadasDia6 $?obrasDia6 ?autor)
                                    (duracionVisitaDia6 (+ ?duracionVisitaDia6 ?relevancia))))
         (printout t "Añadiendo obra al Día 6: " ?autor ", relevancia: " ?relevancia crlf)
   )
)

(defrule primerasRecomendacionesDia7
   (declare (salience 51))
   (not (ProgramacionObras (obrasRecomendadasDia7 $?obrasDia7)))
   (VisitanteAbstraido (relevanciaInteresAbstracta ?nivelRelevancia))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia&:(eq ?relevancia (if (eq ?nivelRelevancia "Poco conocidas") then 1 else
                                                          (if (eq ?nivelRelevancia "Conocidas") then 2 else 3)))))
   =>
   (assert (ProgramacionObras (obrasRecomendadasDia7 ?autor)))
)

(defrule añadirObrasDia7
   (declare (salience 50))
   ?cliente <- (Cliente (horasDiarias ?horas) (descansoDiario ?descanso))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia7 $?obrasDia7)
                                (duracionVisitaDia7 ?duracionVisitaDia7))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia)
              (anio ?anio)
              (epoca ?epoca)
              (estilo ?estilo)
              (tematica ?tematica)
              (dimensiones ?dimensiones))
   =>
   (bind ?tiempoDisponibleDia (- ?horas ?descanso))
   (if (< (+ ?duracionVisitaDia7 ?relevancia) ?tiempoDisponibleDia)
      then
         (assert (ProgramacionObras (obrasRecomendadasDia7 $?obrasDia7 ?autor)
                                    (duracionVisitaDia7 (+ ?duracionVisitaDia7 ?relevancia))))
         (printout t "Añadiendo obra al Día 7: " ?autor ", relevancia: " ?relevancia crlf)
   )
)

(defrule primerasRecomendacionesDia8
   (declare (salience 51))
   (not (ProgramacionObras (obrasRecomendadasDia8 $?obrasDia8)))
   (VisitanteAbstraido (relevanciaInteresAbstracta ?nivelRelevancia))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia&:(eq ?relevancia (if (eq ?nivelRelevancia "Poco conocidas") then 1 else
                                                          (if (eq ?nivelRelevancia "Conocidas") then 2 else 3)))))
   =>
   (assert (ProgramacionObras (obrasRecomendadasDia8 ?autor)))
)

(defrule añadirObrasDia8
   (declare (salience 50))
   ?cliente <- (Cliente (horasDiarias ?horas) (descansoDiario ?descanso))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia8 $?obrasDia8)
                                (duracionVisitaDia8 ?duracionVisitaDia8))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia)
              (anio ?anio)
              (epoca ?epoca)
              (estilo ?estilo)
              (tematica ?tematica)
              (dimensiones ?dimensiones))
   =>
   (bind ?tiempoDisponibleDia (- ?horas ?descanso))
   (if (< (+ ?duracionVisitaDia8 ?relevancia) ?tiempoDisponibleDia)
      then
         (assert (ProgramacionObras (obrasRecomendadasDia8 $?obrasDia8 ?autor)
                                    (duracionVisitaDia8 (+ ?duracionVisitaDia8 ?relevancia))))
         (printout t "Añadiendo obra al Día 8: " ?autor ", relevancia: " ?relevancia crlf)
   )
)

(defrule primerasRecomendacionesDia9
   (declare (salience 51))
   (not (ProgramacionObras (obrasRecomendadasDia9 $?obrasDia9)))
   (VisitanteAbstraido (relevanciaInteresAbstracta ?nivelRelevancia))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia&:(eq ?relevancia (if (eq ?nivelRelevancia "Poco conocidas") then 1 else
                                                          (if (eq ?nivelRelevancia "Conocidas") then 2 else 3)))))
   =>
   (assert (ProgramacionObras (obrasRecomendadasDia9 ?autor)))
)

(defrule añadirObrasDia9
   (declare (salience 50))
   ?cliente <- (Cliente (horasDiarias ?horas) (descansoDiario ?descanso))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia9 $?obrasDia9)
                                (duracionVisitaDia9 ?duracionVisitaDia9))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia)
              (anio ?anio)
              (epoca ?epoca)
              (estilo ?estilo)
              (tematica ?tematica)
              (dimensiones ?dimensiones))
   =>
   (bind ?tiempoDisponibleDia (- ?horas ?descanso))
   (if (< (+ ?duracionVisitaDia9 ?relevancia) ?tiempoDisponibleDia)
      then
         (assert (ProgramacionObras (obrasRecomendadasDia9 $?obrasDia9 ?autor)
                                    (duracionVisitaDia9 (+ ?duracionVisitaDia9 ?relevancia))))
         (printout t "Añadiendo obra al Día 9: " ?autor ", relevancia: " ?relevancia crlf)
   )
)

(defrule primerasRecomendacionesDia10
   (declare (salience 51))
   (not (ProgramacionObras (obrasRecomendadasDia10 $?obrasDia10)))
   (VisitanteAbstraido (relevanciaInteresAbstracta ?nivelRelevancia))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia&:(eq ?relevancia (if (eq ?nivelRelevancia "Poco conocidas") then 1 else
                                                          (if (eq ?nivelRelevancia "Conocidas") then 2 else 3)))))
   =>
   (assert (ProgramacionObras (obrasRecomendadasDia10 ?autor)))
)

(defrule añadirObrasDia10
   (declare (salience 50))
   ?cliente <- (Cliente (horasDiarias ?horas) (descansoDiario ?descanso))
   ?prog <- (ProgramacionObras (obrasRecomendadasDia10 $?obrasDia10)
                                (duracionVisitaDia10 ?duracionVisitaDia10))
   ?obra <- (ObraAbstraida
              (autor ?autor)
              (relevancia ?relevancia)
              (anio ?anio)
              (epoca ?epoca)
              (estilo ?estilo)
              (tematica ?tematica)
              (dimensiones ?dimensiones))
   =>
   (bind ?tiempoDisponibleDia (- ?horas ?descanso))
   (if (< (+ ?duracionVisitaDia10 ?relevancia) ?tiempoDisponibleDia)
      then
         (assert (ProgramacionObras (obrasRecomendadasDia10 $?obrasDia10 ?autor)
                                    (duracionVisitaDia10 (+ ?duracionVisitaDia10 ?relevancia))))
         (printout t "Añadiendo obra al Día 10: " ?autor ", relevancia: " ?relevancia crlf)
   )
)




(defrule finalRefinamiento
    "Indica la finalización del módulo de refinamiento"
    (declare (salience 50))
    =>
    (printout t "El refinamiento se ha completado." crlf)
    (focus RESPUESTA)
)



;-----------------------
;--MÓDULO DE RESPUESTA--
;-----------------------

