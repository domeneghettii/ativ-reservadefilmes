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
data_termino DATE NOT NULL DEFAULT CURRENT_DATE,
data_reserva DATE NOT NULL DEFAULT CURRENT_DATE,
horario_reserva TIME NOT NULL,
id_hospede INT NOT NULL,
id_quarto INT NOT NULL,
CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede),
CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);

\dt

INSERT INTO hospedes (nome, email) VALUES
('João', 'joao@hotel.com'),
('Maria', 'maria@hotel.com'),
('Pedro', 'pedro@hotel.com'),

INSERT INTO quartos (servico_quarto, tipo_cama, bloco) VALUES   
('Serviço 1', 'Cama 1', 1),
('Serviço 1', 'Cama 2', 2),
('Serviço 1', 'Cama 3', 3),