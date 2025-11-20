CREATE DATABASE veloria_event;

CREATE TABLE lavorano(
    ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    giorno DATETIME NOT NULL,
    descrizione_lavoro TEXT NOT NULL,
    id_immobile INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_immobile) REFERENCES immobili(ID_immobile) ON DELETE CASCADE,
    euid_esterni CHAR(20) NOT NULL,
    FOREIGN KEY (euid_esterni) REFERENCES esterni(euid) ON DELETE CASCADE
);

CREATE TABLE eventi (
    ID_evento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    durata INT UNSIGNED NOT NULL,
    assicurazione BOOLEAN NOT NULL,
    tipologia VARCHAR(50) NOT NULL,
    giorno DATETIME NOT NULL,
    ospiti INT UNSIGNED NOT NULL,
    id_clienti INT UNSIGNED NOT NULL,
    FOREIGN KEY(id_clienti) REFERENCES clienti(ID_cliente)
);

CREATE TABLE animazione(
    id_evento INT UNSIGNED NOT NULL,
    euid_esterni CHAR(20) NOT NULL,
    descrizione_animazione TEXT,
    PRIMARY KEY(id_evento, euid_esterni),
    FOREIGN KEY (id_evento) REFERENCES eventi(ID_evento) ON DELETE CASCADE,
    FOREIGN KEY (euid_esterni) REFERENCES esterni(euid) ON DELETE CASCADE
);

CREATE TABLE ospitano(
    id_evento INT UNSIGNED NOT NULL,
    id_immobile INT UNSIGNED NOT NULL,
    disponibilità DATE NOT NULL,
    PRIMARY KEY(id_evento, id_immobile, disponibilità),
    FOREIGN KEY(id_evento) REFERENCES eventi(ID_evento),
    FOREIGN KEY(id_immobile) REFERENCES immobili(ID_immobile),
    FOREIGN KEY(disponibilità) REFERENCES immobili(disponibilità)
);

CREATE TABLE immobili(
    ID_immobile INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    proprietari VARCHAR(50),
    disponibilità DATE,
    indirizzo VARCHAR(100) NOT NULL,
    tipo_eventi VARCHAR(67) NOT NULL
);

CREATE TABLE esterni(
    euid CHAR(20) PRIMARY KEY,
    tipologia_lavoro VARCHAR(100) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    partita_iva CHAR(11) NOT NULL,
    capacità_lavorativa INT NOT NULL,
    disponibilità BOOLEAN NOT NULL
);

CREATE TABLE clienti (
    ID_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono CHAR(10) NOT NULL

);
