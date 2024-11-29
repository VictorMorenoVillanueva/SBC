(deftemplate Obra
   (slot nombre (type STRING))
   (slot autor (type STRING))
   (slot año (type INTEGER))
   (slot dimensiones (type STRING))
   (slot estilo (type STRING))
   (slot relevancia (type INTEGER))
   (slot tematica (type STRING)))

(deftemplate Sala
   (slot numSala (type INTEGER))
   (slot nombresObras (type STRING)))

(deftemplate Visitante
   (slot nivelConocimiento (type INTEGER))
   (slot preferenciasAutores (type STRING))
   (slot preferenciasEpocas (type STRING))
   (slot preferenciasTematicas (type STRING))
   (slot tiempoDisponible (type INTEGER))
   (slot tipoGrupo (type STRING))
   (slot tipoVisita (type STRING)))

(deftemplate contiene
   (slot sala (type SYMBOL))
   (slot obra (type SYMBOL)))

(deftemplate visita
   (slot visitante (type SYMBOL))
   (slot sala (type SYMBOL)))

