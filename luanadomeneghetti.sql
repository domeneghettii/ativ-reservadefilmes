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
('Ana', 'ana@hotel.com');

INSERT INTO quartos (servico_quarto, tipo_cama, bloco) VALUES   
('Organização Geral', 'Cama Padma', 1),
('Limpeza Diária', 'Cama Nórdica', 2),
('Camareira', 'Cama Ribas', 3),
('Concierge', 'Cama Ellen', 4);

INSERT INTO reservas (data_inicio, data_termino, data_reserva, horario_reserva, id_hospede, id_quarto) VALUES
('2024-11-10', '2024-11-14', '2024-10-28', '09:45', 1, 1),
('2024-12-19', '2024-12-23', '2024-11-30', '13:00', 2, 2),
('2024-12-25', '2024-12-28', '2024-12-05', '11:15', 3, 3),
('2024-01-18', '2024-01-22', '2024-12-31', '16:', 4, 4);
