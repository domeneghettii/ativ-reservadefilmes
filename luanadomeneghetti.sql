CREATE DATABASE hotel;

\c hotel;

CREATE TABLE hospedes (
id_hospede SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(200) UNIQUE NOT NULL
);

SELECT * FROM hospedes;

CREATE TABLE quartos (
id_quarto SERIAL PRIMARY KEY,
servico_quarto VARCHAR(100),
tipo_cama VARCHAR(140),
bloco INT
);

SELECT * FROM quartos;

CREATE TABLE reservas (
id_reserva SERIAL PRIMARY KEY,
data_inicio DATE NOT NULL DEFAULT CURRENT_DATE,
hora_termino DATE NOT NULL DEFAULT CURRENT_TIME,
id_hospede INT NOT NULL,
id_quarto INT NOT NULL,
CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede),
CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);

