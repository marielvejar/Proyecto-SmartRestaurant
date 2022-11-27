-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2022-05-17 21:07:50 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE admin (
    id                   INTEGER NOT NULL,
    rut                  INTEGER NOT NULL,
    nombre               VARCHAR2(15) NOT NULL,
    apaterno             VARCHAR2(15) NOT NULL,
    amaterno             VARCHAR2(15) NOT NULL,
    email                VARCHAR2(15) NOT NULL,
    fono_id              INTEGER NOT NULL,
    direccion_id         INTEGER NOT NULL,
    direccion_ciudad_id  INTEGER NOT NULL,
    direccion_comuna_id  INTEGER NOT NULL,
    direccion_id3        INTEGER NOT NULL
);

CREATE UNIQUE INDEX admin__idx ON
    admin (
        direccion_id
    ASC,
        direccion_ciudad_id
    ASC,
        direccion_comuna_id
    ASC,
        direccion_id3
    ASC );

ALTER TABLE admin ADD CONSTRAINT admin_pk PRIMARY KEY ( id,
                                                        fono_id );

CREATE TABLE boleta (
    id           INTEGER NOT NULL,
    num_boleta   INTEGER NOT NULL,
    rut_s        INTEGER NOT NULL,
    rut_mesero   INTEGER NOT NULL,
    nombre_s     VARCHAR2(20) NOT NULL,
    rut_cliente  INTEGER NOT NULL,
    fecha        DATE NOT NULL,
    hora         VARCHAR2(5) NOT NULL,
    total        INTEGER NOT NULL,
    pedido_id    INTEGER NOT NULL
);

COMMENT ON COLUMN boleta.rut_s IS
    'rut sucursal';

COMMENT ON COLUMN boleta.nombre_s IS
    'nombre sucursal';

COMMENT ON COLUMN boleta.hora IS
    '88:88';

CREATE UNIQUE INDEX boleta__idx ON
    boleta (
        pedido_id
    ASC );

ALTER TABLE boleta ADD CONSTRAINT boleta_pk PRIMARY KEY ( id );

CREATE TABLE ciudad (
    id      INTEGER NOT NULL,
    nombre  VARCHAR2(15) NOT NULL
);

ALTER TABLE ciudad ADD CONSTRAINT ciudad_pk PRIMARY KEY ( id );

CREATE TABLE cliente (
    id                   INTEGER NOT NULL,
    rut                  INTEGER NOT NULL,
    nombre               VARCHAR2(15) NOT NULL,
    apaterno             VARCHAR2(15) NOT NULL,
    amaterno             VARCHAR2(15) NOT NULL,
    email                VARCHAR2(20) NOT NULL,
    fono_id              INTEGER NOT NULL,
    mesa_id              INTEGER NOT NULL,
    mesa_id1             INTEGER NOT NULL,
    mesa_id11            INTEGER NOT NULL,
    direccion_id         INTEGER NOT NULL,
    direccion_ciudad_id  INTEGER NOT NULL,
    direccion_comuna_id  INTEGER NOT NULL,
    direccion_id3        INTEGER NOT NULL
);

CREATE UNIQUE INDEX cliente__idx ON
    cliente (
        direccion_id
    ASC,
        direccion_ciudad_id
    ASC,
        direccion_comuna_id
    ASC,
        direccion_id3
    ASC );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_pk PRIMARY KEY ( id,
                                            fono_id,
                                            mesa_id,
                                            mesa_id1,
                                            mesa_id11 );

CREATE TABLE cocinero (
    id                   INTEGER NOT NULL,
    rut                  INTEGER NOT NULL,
    nombre               VARCHAR2(15) NOT NULL,
    apaterno             VARCHAR2(15) NOT NULL,
    amaterno             VARCHAR2(15) NOT NULL,
    email                VARCHAR2(15) NOT NULL,
    fono_id              INTEGER NOT NULL,
    direccion_id         INTEGER NOT NULL,
    direccion_ciudad_id  INTEGER NOT NULL,
    direccion_comuna_id  INTEGER NOT NULL,
    direccion_id3        INTEGER NOT NULL
);

CREATE UNIQUE INDEX cocinero__idx ON
    cocinero (
        direccion_id
    ASC,
        direccion_ciudad_id
    ASC,
        direccion_comuna_id
    ASC,
        direccion_id3
    ASC );

ALTER TABLE cocinero ADD CONSTRAINT cocinero_pk PRIMARY KEY ( id,
                                                              fono_id );

CREATE TABLE comanda (
    id                      INTEGER NOT NULL,
    nombre_p                VARCHAR2(20) NOT NULL,
    cantidad                INTEGER NOT NULL,
    comentario              VARCHAR2(100),
    hora                    VARCHAR2(5) NOT NULL,
    fecha                   DATE NOT NULL,
    mesa_id                 INTEGER NOT NULL,
    mesa_id1                INTEGER NOT NULL,
    mesa_id11               INTEGER NOT NULL,
    pedido_id               INTEGER NOT NULL,
    null_set_generated_114  INTEGER NOT NULL
);

COMMENT ON COLUMN comanda.nombre_p IS
    'nombre plato';

COMMENT ON COLUMN comanda.hora IS
    '88:88';

CREATE UNIQUE INDEX comanda__idx ON
    comanda (
        pedido_id
    ASC );

ALTER TABLE comanda
    ADD CONSTRAINT comanda_pk PRIMARY KEY ( id,
                                            mesa_id,
                                            mesa_id1,
                                            mesa_id11 );

CREATE TABLE comuna (
    id      INTEGER NOT NULL,
    nombre  VARCHAR2(15) NOT NULL
);

ALTER TABLE comuna ADD CONSTRAINT comuna_pk PRIMARY KEY ( id );

CREATE TABLE dcto (
    id         INTEGER NOT NULL,
    monto      INTEGER NOT NULL,
    motivo     VARCHAR2(100) NOT NULL,
    boleta_id  INTEGER NOT NULL
);

ALTER TABLE dcto ADD CONSTRAINT dcto_pk PRIMARY KEY ( id,
                                                      boleta_id );

CREATE TABLE direccion (
    id                 INTEGER NOT NULL,
    nombre             VARCHAR2(15) NOT NULL,
    numeral            INTEGER NOT NULL,
    ciudad_id          INTEGER NOT NULL,
    comuna_id          INTEGER NOT NULL,
    region_id          INTEGER NOT NULL,
    sucursal_id        INTEGER NOT NULL,
    duenio_id          INTEGER NOT NULL,
    duenio_id1         INTEGER NOT NULL,
    cliente_id         INTEGER NOT NULL,
    cliente_id1        INTEGER NOT NULL,
    cliente_mesa_id    INTEGER NOT NULL,
    cliente_mesa_id1   INTEGER NOT NULL,
    cliente_mesa_id11  INTEGER NOT NULL,
    mesero_id          INTEGER NOT NULL,
    mesero_id1         INTEGER NOT NULL,
    cocinero_id        INTEGER NOT NULL,
    cocinero_id1       INTEGER NOT NULL,
    admin_id           INTEGER NOT NULL,
    admin_id1          INTEGER NOT NULL
);

CREATE UNIQUE INDEX direccion__idx ON
    direccion (
        sucursal_id
    ASC );

CREATE UNIQUE INDEX direccion__idxv1 ON
    direccion (
        duenio_id
    ASC,
        duenio_id1
    ASC );

CREATE UNIQUE INDEX direccion__idxv2 ON
    direccion (
        cliente_id
    ASC,
        cliente_id1
    ASC,
        cliente_mesa_id
    ASC,
        cliente_mesa_id1
    ASC,
        cliente_mesa_id11
    ASC );

CREATE UNIQUE INDEX direccion__idxv3 ON
    direccion (
        mesero_id
    ASC,
        mesero_id1
    ASC );

CREATE UNIQUE INDEX direccion__idxv4 ON
    direccion (
        cocinero_id
    ASC,
        cocinero_id1
    ASC );

CREATE UNIQUE INDEX direccion__idxv5 ON
    direccion (
        admin_id
    ASC,
        admin_id1
    ASC );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_pk PRIMARY KEY ( id,
                                              ciudad_id,
                                              comuna_id,
                                              region_id );

CREATE TABLE duenio (
    id                   INTEGER NOT NULL,
    rut                  INTEGER NOT NULL,
    nombre               VARCHAR2(15) NOT NULL,
    apaterno             VARCHAR2(15) NOT NULL,
    amaterno             VARCHAR2(15) NOT NULL,
    email                VARCHAR2(15) NOT NULL,
    fono_id              INTEGER NOT NULL,
    sucursal_id          INTEGER NOT NULL,
    direccion_id         INTEGER NOT NULL,
    direccion_ciudad_id  INTEGER NOT NULL,
    direccion_comuna_id  INTEGER NOT NULL,
    direccion_id3        INTEGER NOT NULL
);

CREATE UNIQUE INDEX duenio__idx ON
    duenio (
        sucursal_id
    ASC );

CREATE UNIQUE INDEX duenio__idxv1 ON
    duenio (
        direccion_id
    ASC,
        direccion_ciudad_id
    ASC,
        direccion_comuna_id
    ASC,
        direccion_id3
    ASC );

ALTER TABLE duenio ADD CONSTRAINT duenio_pk PRIMARY KEY ( id,
                                                          fono_id );

CREATE TABLE fono (
    id       INTEGER NOT NULL,
    prefijo  VARCHAR2(3) NOT NULL,
    numero   INTEGER NOT NULL,
    tipo     VARCHAR2(15) NOT NULL
);

COMMENT ON COLUMN fono.prefijo IS
    '+56';

ALTER TABLE fono ADD CONSTRAINT fono_pk PRIMARY KEY ( id );

CREATE TABLE mesa (
    id              INTEGER NOT NULL,
    numero          INTEGER NOT NULL,
    mesero_id       INTEGER NOT NULL,
    mesero_fono_id  INTEGER NOT NULL
);

ALTER TABLE mesa
    ADD CONSTRAINT mesa_pk PRIMARY KEY ( id,
                                         mesero_id,
                                         mesero_fono_id );

CREATE TABLE mesero (
    id                   INTEGER NOT NULL,
    rut                  INTEGER NOT NULL,
    nombre               VARCHAR2(15) NOT NULL,
    apaterno             VARCHAR2(15) NOT NULL,
    amaterno             VARCHAR2(15) NOT NULL,
    email                VARCHAR2(15) NOT NULL,
    fono_id              INTEGER NOT NULL,
    direccion_id         INTEGER NOT NULL,
    direccion_ciudad_id  INTEGER NOT NULL,
    direccion_comuna_id  INTEGER NOT NULL,
    direccion_id3        INTEGER NOT NULL
);

CREATE UNIQUE INDEX mesero__idx ON
    mesero (
        direccion_id
    ASC,
        direccion_ciudad_id
    ASC,
        direccion_comuna_id
    ASC,
        direccion_id3
    ASC );

ALTER TABLE mesero ADD CONSTRAINT mesero_pk PRIMARY KEY ( id,
                                                          fono_id );

CREATE TABLE metodo_pago (
    id           INTEGER NOT NULL,
    descripcion  VARCHAR2(15) NOT NULL,
    boleta_id    INTEGER NOT NULL
);

ALTER TABLE metodo_pago ADD CONSTRAINT metodo_pago_pk PRIMARY KEY ( id,
                                                                    boleta_id );

CREATE TABLE pedido (
    id                 INTEGER NOT NULL,
    hora               VARCHAR2(5) NOT NULL,
    fecha              DATE NOT NULL,
    tipo               VARCHAR2(15) NOT NULL,
    valor              INTEGER NOT NULL,
    comanda_id         INTEGER NOT NULL,
    comanda_mesa_id    INTEGER NOT NULL,
    comanda_mesa_id1   INTEGER NOT NULL,
    comanda_mesa_id11  INTEGER NOT NULL,
    boleta_id          INTEGER NOT NULL
);

COMMENT ON COLUMN pedido.hora IS
    '88:88';

COMMENT ON COLUMN pedido.tipo IS
    'llevar, servir o delivery';

CREATE UNIQUE INDEX pedido__idx ON
    pedido (
        comanda_id
    ASC,
        comanda_mesa_id
    ASC,
        comanda_mesa_id1
    ASC,
        comanda_mesa_id11
    ASC );

CREATE UNIQUE INDEX pedido__idxv1 ON
    pedido (
        boleta_id
    ASC );

ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( id );

CREATE TABLE producto (
    id                 INTEGER NOT NULL,
    nombre             VARCHAR2(20) NOT NULL,
    valor              INTEGER NOT NULL,
    descripcion        VARCHAR2(100) NOT NULL,
    stock              INTEGER NOT NULL,
    categoria          VARCHAR2(20) NOT NULL,
    comanda_id         INTEGER NOT NULL,
    comanda_mesa_id    INTEGER NOT NULL,
    comanda_mesa_id1   INTEGER NOT NULL,
    comanda_mesa_id11  INTEGER NOT NULL
);

ALTER TABLE producto
    ADD CONSTRAINT producto_pk PRIMARY KEY ( id,
                                             comanda_id,
                                             comanda_mesa_id,
                                             comanda_mesa_id1,
                                             comanda_mesa_id11 );

CREATE TABLE region (
    id      INTEGER NOT NULL,
    nombre  VARCHAR2(15) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( id );

CREATE TABLE sucursal (
    id                   INTEGER NOT NULL,
    rut                  INTEGER NOT NULL,
    nombre               VARCHAR2(15) NOT NULL,
    direccion_id         INTEGER NOT NULL,
    direccion_ciudad_id  INTEGER NOT NULL,
    direccion_id2        INTEGER NOT NULL,
    direccion_id3        INTEGER NOT NULL,
    duenio_id            INTEGER NOT NULL,
    duenio_id1           INTEGER NOT NULL
);

CREATE UNIQUE INDEX sucursal__idx ON
    sucursal (
        direccion_id
    ASC,
        direccion_ciudad_id
    ASC,
        direccion_id2
    ASC,
        direccion_id3
    ASC );

CREATE UNIQUE INDEX sucursal__idxv1 ON
    sucursal (
        duenio_id
    ASC,
        duenio_id1
    ASC );

ALTER TABLE sucursal ADD CONSTRAINT sucursal_pk PRIMARY KEY ( id );

ALTER TABLE admin
    ADD CONSTRAINT admin_direccion_fk FOREIGN KEY ( direccion_id,
                                                    direccion_ciudad_id,
                                                    direccion_comuna_id,
                                                    direccion_id3 )
        REFERENCES direccion ( id,
                               ciudad_id,
                               comuna_id,
                               region_id );

ALTER TABLE admin
    ADD CONSTRAINT admin_fono_fk FOREIGN KEY ( fono_id )
        REFERENCES fono ( id );

ALTER TABLE boleta
    ADD CONSTRAINT boleta_pedido_fk FOREIGN KEY ( pedido_id )
        REFERENCES pedido ( id );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_direccion_fk FOREIGN KEY ( direccion_id,
                                                      direccion_ciudad_id,
                                                      direccion_comuna_id,
                                                      direccion_id3 )
        REFERENCES direccion ( id,
                               ciudad_id,
                               comuna_id,
                               region_id );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_fono_fk FOREIGN KEY ( fono_id )
        REFERENCES fono ( id );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_mesa_fk FOREIGN KEY ( mesa_id,
                                                 mesa_id1,
                                                 mesa_id11 )
        REFERENCES mesa ( id,
                          mesero_id,
                          mesero_fono_id );

ALTER TABLE cocinero
    ADD CONSTRAINT cocinero_direccion_fk FOREIGN KEY ( direccion_id,
                                                       direccion_ciudad_id,
                                                       direccion_comuna_id,
                                                       direccion_id3 )
        REFERENCES direccion ( id,
                               ciudad_id,
                               comuna_id,
                               region_id );

ALTER TABLE cocinero
    ADD CONSTRAINT cocinero_fono_fk FOREIGN KEY ( fono_id )
        REFERENCES fono ( id );

ALTER TABLE comanda
    ADD CONSTRAINT comanda_mesa_fk FOREIGN KEY ( mesa_id,
                                                 mesa_id1,
                                                 mesa_id11 )
        REFERENCES mesa ( id,
                          mesero_id,
                          mesero_fono_id );

ALTER TABLE comanda
    ADD CONSTRAINT comanda_pedido_fk FOREIGN KEY ( pedido_id )
        REFERENCES pedido ( id );

ALTER TABLE dcto
    ADD CONSTRAINT dcto_boleta_fk FOREIGN KEY ( boleta_id )
        REFERENCES boleta ( id );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_admin_fk FOREIGN KEY ( admin_id,
                                                    admin_id1 )
        REFERENCES admin ( id,
                           fono_id );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_ciudad_fk FOREIGN KEY ( ciudad_id )
        REFERENCES ciudad ( id );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_cliente_fk FOREIGN KEY ( cliente_id,
                                                      cliente_id1,
                                                      cliente_mesa_id,
                                                      cliente_mesa_id1,
                                                      cliente_mesa_id11 )
        REFERENCES cliente ( id,
                             fono_id,
                             mesa_id,
                             mesa_id1,
                             mesa_id11 );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_cocinero_fk FOREIGN KEY ( cocinero_id,
                                                       cocinero_id1 )
        REFERENCES cocinero ( id,
                              fono_id );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_comuna_fk FOREIGN KEY ( comuna_id )
        REFERENCES comuna ( id );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_duenio_fk FOREIGN KEY ( duenio_id,
                                                     duenio_id1 )
        REFERENCES duenio ( id,
                            fono_id );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_mesero_fk FOREIGN KEY ( mesero_id,
                                                     mesero_id1 )
        REFERENCES mesero ( id,
                            fono_id );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_region_fk FOREIGN KEY ( region_id )
        REFERENCES region ( id );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_sucursal_fk FOREIGN KEY ( sucursal_id )
        REFERENCES sucursal ( id );

ALTER TABLE duenio
    ADD CONSTRAINT duenio_direccion_fk FOREIGN KEY ( direccion_id,
                                                     direccion_ciudad_id,
                                                     direccion_comuna_id,
                                                     direccion_id3 )
        REFERENCES direccion ( id,
                               ciudad_id,
                               comuna_id,
                               region_id );

ALTER TABLE duenio
    ADD CONSTRAINT duenio_fono_fk FOREIGN KEY ( fono_id )
        REFERENCES fono ( id );

ALTER TABLE duenio
    ADD CONSTRAINT duenio_sucursal_fk FOREIGN KEY ( sucursal_id )
        REFERENCES sucursal ( id );

ALTER TABLE mesa
    ADD CONSTRAINT mesa_mesero_fk FOREIGN KEY ( mesero_id,
                                                mesero_fono_id )
        REFERENCES mesero ( id,
                            fono_id );

ALTER TABLE mesero
    ADD CONSTRAINT mesero_direccion_fk FOREIGN KEY ( direccion_id,
                                                     direccion_ciudad_id,
                                                     direccion_comuna_id,
                                                     direccion_id3 )
        REFERENCES direccion ( id,
                               ciudad_id,
                               comuna_id,
                               region_id );

ALTER TABLE mesero
    ADD CONSTRAINT mesero_fono_fk FOREIGN KEY ( fono_id )
        REFERENCES fono ( id );

ALTER TABLE metodo_pago
    ADD CONSTRAINT metodo_pago_boleta_fk FOREIGN KEY ( boleta_id )
        REFERENCES boleta ( id );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_boleta_fk FOREIGN KEY ( boleta_id )
        REFERENCES boleta ( id );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_comanda_fk FOREIGN KEY ( comanda_id,
                                                   comanda_mesa_id,
                                                   comanda_mesa_id1,
                                                   comanda_mesa_id11 )
        REFERENCES comanda ( id,
                             mesa_id,
                             mesa_id1,
                             mesa_id11 );

ALTER TABLE producto
    ADD CONSTRAINT producto_comanda_fk FOREIGN KEY ( comanda_id,
                                                     comanda_mesa_id,
                                                     comanda_mesa_id1,
                                                     comanda_mesa_id11 )
        REFERENCES comanda ( id,
                             mesa_id,
                             mesa_id1,
                             mesa_id11 );

ALTER TABLE sucursal
    ADD CONSTRAINT sucursal_direccion_fk FOREIGN KEY ( direccion_id,
                                                       direccion_ciudad_id,
                                                       direccion_id2,
                                                       direccion_id3 )
        REFERENCES direccion ( id,
                               ciudad_id,
                               comuna_id,
                               region_id );

ALTER TABLE sucursal
    ADD CONSTRAINT sucursal_duenio_fk FOREIGN KEY ( duenio_id,
                                                    duenio_id1 )
        REFERENCES duenio ( id,
                            fono_id );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            18
-- CREATE INDEX                            18
-- ALTER TABLE                             50
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
