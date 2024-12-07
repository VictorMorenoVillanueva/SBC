(defclass ObrasUsadas
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Obra
   (is-a USER)
   ;(role concrete)
   (pattern-match reactive)
   (slot nombre (type STRING) (create-accessor read-write))
   (slot autor (type STRING) (create-accessor read-write))
   (slot epoca (type STRING) (create-accessor read-write))
   (slot anio (type INTEGER) (create-accessor read-write))
   (slot estilo (type STRING) (create-accessor read-write))
   (slot tematica (type STRING) (create-accessor read-write))
   (slot dimensiones (type STRING) (create-accessor read-write))
   (slot sala (type INTEGER) (create-accessor read-write))
   (slot relevancia (type INTEGER) (create-accessor read-write))
   (slot duracion (type INTEGER) (create-accessor read-write)))

(defclass Sala
   (is-a USER)
   (role concrete)
   (pattern-match reactive)
   (slot numSala (type INTEGER) (create-accessor read-write))
   (slot nombresObras (type STRING) (create-accessor read-write)))

(defclass Visitante
   (is-a USER)
   (role concrete)
   (pattern-match reactive)
   (slot nivelConocimiento (type INTEGER) (create-accessor read-write))
   (slot preferenciasAutores (type STRING) (create-accessor read-write))
   (slot preferenciasEpocas (type STRING) (create-accessor read-write))
   (slot preferenciasTematicas (type STRING) (create-accessor read-write))
   (slot tiempoDisponible (type INTEGER) (create-accessor read-write))
   (slot tipoGrupo (type STRING) (create-accessor read-write))
   (slot tipoVisita (type STRING) (create-accessor read-write)))

(defclass contiene
   (is-a USER)
   (role concrete)
   (pattern-match reactive)
   (slot sala (type SYMBOL) (create-accessor read-write))
   (slot obra (type SYMBOL) (create-accessor read-write)))

(defclass visita
   (is-a USER)
   (role concrete)
   (pattern-match reactive)
   (slot visitante (type SYMBOL) (create-accessor read-write))
   (slot sala (type SYMBOL) (create-accessor read-write)))

(definstances instances)

