;;; ---------------------------------------------------------
;;; Ontologia.clp
;;; Corrected to handle relationships and exclude certain properties
;;; ---------------------------------------------------------

(defclass ObraDeArte
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot epoca
        (type STRING)
        (create-accessor read-write))
    (slot dimensiones
        (type STRING)
        (create-accessor read-write))
    (slot añoCreacion
        (type STRING)
        (create-accessor read-write))
    (slot relevancia
        (type STRING)
        (create-accessor read-write))
    (slot estilo
        (type STRING)
        (create-accessor read-write))
    (slot complejidad
        (type STRING)
        (create-accessor read-write))
    (slot autor
        (type STRING)
        (create-accessor read-write))
)

(defclass Exposicion
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot tematica
        (type STRING)
        (create-accessor read-write))
    (slot cronologia
        (type STRING)
        (create-accessor read-write))
)

(defclass Visitante
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot duracion
        (type STRING)
        (create-accessor read-write))
    (slot tipo
        (type STRING)
        (create-accessor read-write))
    (slot conocimiento
        (type STRING)
        (create-accessor read-write))
    (slot numDias
        (type STRING)
        (create-accessor read-write))
    (slot preferencias
        (type STRING)
        (create-accessor read-write))
)

(defclass Sala
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot alberga_Obra
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Museo
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

;;; Relationships defined by excluded properties
(defrelation visitante_de
    (is-a relation)
    (type INSTANCE))

(defrelation pertenece_a
    (is-a relation)
    (type INSTANCE))

(defrelation contenedor_de
    (is-a relation)
    (type INSTANCE))

(definstances instances
)
