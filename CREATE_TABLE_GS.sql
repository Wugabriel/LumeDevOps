CREATE SEQUENCE usuario_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE metrica_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE checkin_emocional_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE autenticacao_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


--Criação da tabela
Create table tb_usuario(
    id NUMBER PRIMARY KEY,
    nm Varchar2(120) NOT NULL,
    email Varchar2(120) NOT NULL UNIQUE,
    password VARCHAR2(255) NOT NULL,
    idade integer NOT NULL,
    nvl_de_estresse VARCHAR2(255) --nvl ->nivel
);

Create table tb_metricas(
    id NUMBER PRIMARY KEY,
    btm_cardiaco NUMBER(10,2) NOT NULL, -- btm->batimento
    temp NUMBER(10,2) NOT NULL, -- temp ->temperatura
    dt_hr TIMESTAMP NOT NULL, -- dt_hr ->dataHora
    usuario_id NUMBER,
    CONSTRAINT fk_metrica_usuario 
    FOREIGN KEY (usuario_id)
        REFERENCES tb_usuario(id)
);

Create table tb_checkin_emocional(
    id NUMBER PRIMARY KEY,
    dt_hr TIMESTAMP NOT NULL,
    nvl_emocional VARCHAR2(255) NOT NULL,
    usuario_id NUMBER,
    CONSTRAINT fk_checkin_emocional_usuario
    FOREIGN KEY (usuario_id)
        REFERENCES tb_usuario(id)
);

CREATE TABLE tb_autenticacao(
    id NUMBER PRIMARY KEY,
    email VARCHAR2(120)NOT NULL,
    password VARCHAR2(255) NOT NULL,
    usuario_id NUMBER NOT NULL,
    CONSTRAINT fk_autenticacao_usuario 
    FOREIGN KEY (usuario_id)
    REFERENCES tb_usuario(id)
);

select * from tb_usuario ;
select * from tb_metricas;
select * from tb_checkin_emocional;
select * FROM tb_autenticacao;
// select * from tb_autenticacao

DELETE FROM tb_usuario;
delete from tb_metricas ;
delete from tb_checkin_emocional;
DELETE FROM tb_autenticacao;



    