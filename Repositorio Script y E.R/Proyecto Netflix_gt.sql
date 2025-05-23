
CREATE DATABASE IF NOT EXISTS DBpelicula;

USE DBpelicula;

CREATE TABLE DBpelicula.tbl_actor(
               id_actor integer not null,
               nombre varchar(100) not null,
               apellido varchar(100) not null,
               nacionalidad varchar (100) not null,
               fecha_nacimiento date not null,
               Primary key PK_id_actor(id_actor) 
);

CREATE TABLE DBpelicula.tbl_genero(
              id_genero integer not null,
              nombre_genero varchar(100),
              Primary key PK_id_genero(id_genero)
);  

CREATE TABLE DBpelicula.tbl_pelicula(
              id_pelicula integer not null,
              id_genero integer not null,
              titulo varchar(1000) not null,
              fecha_estreno date not null,
              duracion time not null,
              Primary key PK_id_pelicula(id_pelicula),
              Constraint FK_tbl_pelicula_tbl_genero Foreign key(id_genero)
              references tbl_genero(id_genero)              
); 

CREATE TABLE DBpelicula.tbl_elenco(
			 id_elenco integer not null,
             id_actor integer not null,
             id_pelicula integer not null,
             personaje varchar(150) not null,
             Primary key PK_id_elenco(id_elenco),
             Constraint FK_tbl_elenco_tbl_actor Foreign key(id_actor)
             references tbl_actor(id_actor),
             constraint Fk_tbl_elenco_tbl_pelicula Foreign key(id_pelicula)
             references tbl_pelicula(id_pelicula)           
);

CREATE TABLE DBpelicula.tbl_detalle_pelicula(
            id_detalle integer not null,
            id_elenco integer not null,
            id_pelicula integer not null,
            sinopsis varchar(1000) not null,
            Primary key PK_id_detalle(id_detalle),
            Constraint FK_tbl_detalle_pelicula_tbl_elenco Foreign Key (id_elenco)
            references tbl_elenco(id_elenco),
            Constraint FK_tbl_detalle_pelicula_tbl_pelicula Foreign Key (id_pelicula)
            references tbl_pelicula (id_pelicula)            
);          
                      
