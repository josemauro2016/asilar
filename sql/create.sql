DROP TABLE IF EXISTS assistido CASCADE;
CREATE TABLE assistido (
  id               BIGSERIAL NOT NULL, 
  profissao       varchar(50) NOT NULL, 
  nacionalidade   varchar(20) NOT NULL, 
  nome            varchar(150) NOT NULL,
  rg              varchar(20) NOT NULL, 
  cpf             varchar(20) NOT NULL,
  telfixo         varchar(15), 
  celular         varchar(15), 
  banco           varchar(20) NOT NULL, 
  agencia         varchar(20) NOT NULL, 
  conta           varchar(30) NOT NULL, 
  naturalidade    varchar(50) NOT NULL, 
  estado_Civil    varchar(10) NOT NULL, 
  mae             varchar(150) NOT NULL, 
  pai             varchar(150) NOT NULL, 
  rua             varchar(150) NOT NULL, 
  bairro          varchar(150) NOT NULL, 
  numero          varchar(10) NOT NULL, 
  cidade          varchar(150) NOT NULL, 
  estado          varchar(5) NOT NULL, 
  sexo            varchar(10) NOT NULL, 
  data_Nascimento  date NOT NULL, 
  observacoes      text NOT NULL, 
  procedencia     text NOT NULL,
  cartao_sus      varchar(20) NOT NULL, 
  no_do_beneficio varchar(20) NOT NULL,  
  PRIMARY KEY (id));

DROP TABLE IF EXISTS usuario CASCADE;
CREATE TABLE Usuario (
  id                    BIGSERIAL NOT NULL, 
  email                varchar(50) NOT NULL, 
  telefone_celular     varchar(20) NOT NULL, 
  rg                   varchar(30) NOT NULL, 
  nome                 varchar(60) NOT NULL, 
  cpf                  varchar(30) NOT NULL, 
  telefone_residencial varchar(20) NOT NULL, 
  usuario              varchar(150) NOT NULL, 
  senha                varchar(255) NOT NULL, 
  tipo_usuario         integer NOT NULL,
  instituicao_fk       bigint NOT NULL,
  PRIMARY KEY (id));

DROP TABLE IF EXISTS instituicao CASCADE;
CREATE TABLE instituicao (
  id       BIGSERIAL NOT NULL, 
  cnpj     varchar(20) NOT NULL, 
  nome     varchar(150) NOT NULL, 
  email    varchar(150), 
  telefone varchar(20), 
  rua      varchar(150) NOT NULL, 
  numero   varchar(10) NOT NULL, 
  bairro   varchar(150) NOT NULL, 
  cep      varchar(15) NOT NULL, 
  cidade   varchar(150) NOT NULL, 
  estado   varchar(5) NOT NULL, 
  PRIMARY KEY (id));

DROP TABLE IF EXISTS registro CASCADE;
CREATE TABLE registro (
  id                  BIGSERIAL NOT NULL, 
  data_entrada       date NOT NULL, 
  data_saida         date, 
  usuario_entrada_fk int8 NOT NULL, 
  Assistido_fk       int8 NOT NULL, 
  usuario_saida_fk   int8, 
  PRIMARY KEY (id));

  DROP TABLE IF EXISTS produto CASCADE;
  CREATE TABLE produto (
  id                 BIGSERIAL NOT NULL, 
  nome              varchar(60) NOT NULL, 
  quantidade_Minima int8 NOT NULL, 
  quantidade_Maxima int8 NOT NULL, 
  Unidade_Medida    varchar(100) NOT NULL, 
  PRIMARY KEY (id));

ALTER TABLE usuario DROP CONSTRAINT IF EXISTS usuario_instituicao_fk;
ALTER TABLE usuario ADD CONSTRAINT usuario_instituicao_fk FOREIGN KEY (instituicao_fk) REFERENCES instituicao (id)
ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE registro DROP CONSTRAINT IF EXISTS registro_usuario_entrada;
ALTER TABLE registro ADD CONSTRAINT registro_usuario_entrada FOREIGN KEY (usuario_entrada_fk) REFERENCES usuario (id)
ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE registro DROP CONSTRAINT IF EXISTS registro_usuario_saida;
ALTER TABLE registro ADD CONSTRAINT registro_usuario_saida FOREIGN KEY (usuario_saida_fk) REFERENCES usuario (id)
ON UPDATE RESTRICT ON DELETE RESTRICT;