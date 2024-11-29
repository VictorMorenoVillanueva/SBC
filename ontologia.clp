(defclass Obra
   (is-a USER)
   (role concrete)
   (pattern-match reactive)
   (slot nombre (type STRING))
   (slot autor (type STRING))
   (slot año (type INTEGER))
   (slot dimensiones (type STRING))
   (slot estilo (type STRING))
   (slot relevancia (type INTEGER))
   (slot tematica (type STRING)))

(defclass Sala
   (is-a USER)
   (role concrete)
   (pattern-match reactive)
   (slot numSala (type INTEGER))
   (slot nombresObras (type STRING)))

(defclass Visitante
   (is-a USER)
   (role concrete)
   (pattern-match reactive)
   (slot nivelConocimiento (type INTEGER))
   (slot preferenciasAutores (type STRING))
   (slot preferenciasEpocas (type STRING))
   (slot preferenciasTematicas (type STRING))
   (slot tiempoDisponible (type INTEGER))
   (slot tipoGrupo (type STRING))
   (slot tipoVisita (type STRING)))

(defclass contiene
   (is-a USER)
   (role concrete)
   (pattern-match reactive)
   (slot sala (type SYMBOL))
   (slot obra (type SYMBOL)))

(defclass visita
   (is-a USER)
   (role concrete)
   (pattern-match reactive)
   (slot visitante (type SYMBOL))
   (slot sala (type SYMBOL)))

(definstances instances)

