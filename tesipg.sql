-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Dic 17, 2025 alle 20:04
-- Versione del server: 11.4.9-MariaDB-deb12
-- Versione PHP: 8.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tesipg`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `c_id` int(11) NOT NULL,
  `c_nome` varchar(45) NOT NULL,
  `c_cognome` varchar(45) NOT NULL,
  `c_email` varchar(100) NOT NULL,
  `c_cf` varchar(16) NOT NULL,
  `c_datanasc` date NOT NULL,
  `c_password` varchar(512) NOT NULL,
  `c_active` tinyint(1) NOT NULL DEFAULT 1,
  `c_idviaresidenza` int(11) NOT NULL,
  `c_idcapresidenza` int(11) NOT NULL,
  `c_numerodocumento` varchar(45) NOT NULL,
  `c_emessoda` varchar(150) NOT NULL,
  `c_dataemissione` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dump dei dati per la tabella `cliente`
--

INSERT INTO `cliente` (`c_id`, `c_nome`, `c_cognome`, `c_email`, `c_cf`, `c_datanasc`, `c_password`, `c_active`, `c_idviaresidenza`, `c_idcapresidenza`, `c_numerodocumento`, `c_emessoda`, `c_dataemissione`) VALUES
(1, 'Marco', 'Rossi', 'Marco Rossi', 'RSSMRC90A01H501X', '1990-01-01', '$2y$10$DEMOHASHMARCO', 1, 8, 1, 'CA1234567', 'Comune di Verona', '2020-06-10'),
(2, 'Giulia', 'Bianchi', 'giulia.bianchi@example.com', 'BNCGLI95C41H501Y', '1995-03-01', '$2y$10$DEMOHASHGIULIA', 1, 21, 3, 'YA7654321', 'Comune di Legnago', '2019-09-20'),
(3, 'Hans', 'Müller', 'hans.mueller@example.de', 'HNSMLL80B01DE000', '1980-02-01', '$2y$10$DEMOHASHHANS', 1, 100, 10, 'DE998877', 'KVR München', '2018-04-15');

-- --------------------------------------------------------

--
-- Struttura della tabella `corse`
--

CREATE TABLE `corse` (
  `c_id` int(11) NOT NULL,
  `c_idpercorso` int(11) NOT NULL,
  `c_idservizio` int(11) NOT NULL,
  `c_partenza` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dump dei dati per la tabella `corse`
--

INSERT INTO `corse` (`c_id`, `c_idpercorso`, `c_idservizio`, `c_partenza`) VALUES
(1, 1301, 1, '07:00:00'),
(2, 1301, 1, '07:30:00'),
(3, 1301, 1, '08:00:00'),
(4, 1302, 1, '07:15:00'),
(5, 1302, 1, '07:45:00'),
(10, 9001, 1, '06:50:00'),
(11, 9001, 1, '07:20:00'),
(12, 9002, 1, '07:05:00'),
(20, 14101, 2, '06:30:00'),
(21, 14101, 2, '07:30:00'),
(22, 14102, 2, '16:30:00'),
(30, 14401, 2, '06:10:00'),
(31, 14402, 2, '17:10:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `corse_effettive`
--

CREATE TABLE `corse_effettive` (
  `c_id` int(11) NOT NULL,
  `c_idcorsa` int(11) NOT NULL,
  `c_date` date NOT NULL,
  `c_idmezzo` int(11) NOT NULL,
  `c_idautista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dump dei dati per la tabella `corse_effettive`
--

INSERT INTO `corse_effettive` (`c_id`, `c_idcorsa`, `c_date`, `c_idmezzo`, `c_idautista`) VALUES
(1000, 1, '2025-12-15', 1, 200),
(1001, 10, '2025-12-15', 2, 201),
(2000, 20, '2025-12-15', 3, 200),
(2001, 30, '2025-12-15', 3, 201);

-- --------------------------------------------------------

--
-- Struttura della tabella `fermate`
--

CREATE TABLE `fermate` (
  `c_id` int(11) NOT NULL,
  `c_idvia` int(11) NOT NULL,
  `c_nome` varchar(100) NOT NULL,
  `c_latitudine` decimal(9,6) DEFAULT NULL,
  `c_longitudine` decimal(9,6) DEFAULT NULL
) ;

--
-- Dump dei dati per la tabella `fermate`
--

INSERT INTO `fermate` (`c_id`, `c_idvia`, `c_nome`, `c_latitudine`, `c_longitudine`) VALUES
(100, 1, 'Stazione Porta Nuova', 45.429900, 10.982800),
(101, 3, 'Piazza Brà', 45.438300, 10.992800),
(102, 2, 'Via Valverde', 45.434800, 10.985900),
(103, 4, 'Stadio - P.le Olimpia', 45.438800, 10.955800),
(104, 5, 'Porta Vescovo', 45.438900, 11.011900),
(105, 7, 'San Michele Nord', 45.430200, 11.037600),
(106, 8, 'San Massimo', 45.438700, 10.933700),
(107, 6, 'Montorio (capolinea)', 45.455000, 11.043200),
(108, 1, 'Croce Bianca', 45.439400, 10.961800),
(200, 20, 'Legnago - Autostazione', 45.189700, 11.307300),
(201, 40, 'Cerea - Centro', 45.192900, 11.218100),
(202, 50, 'Bovolone - Autostazione', 45.247300, 11.120000),
(203, 30, 'San Bonifacio - FS', 45.399300, 11.270900),
(204, 20, 'Angiari', 45.224400, 11.277600),
(205, 20, 'Isola Rizza', 45.291000, 11.197900),
(206, 20, 'Oppeano', 45.304400, 11.180200),
(207, 20, 'Pozzo', 45.371000, 11.109000);

-- --------------------------------------------------------

--
-- Struttura della tabella `fermate_percorso`
--

CREATE TABLE `fermate_percorso` (
  `c_idpercorso` int(11) NOT NULL,
  `c_idfermata` int(11) NOT NULL,
  `c_ordine_passaggio` int(11) NOT NULL,
  `c_offset_minuti` int(11) NOT NULL
) ;

--
-- Dump dei dati per la tabella `fermate_percorso`
--

INSERT INTO `fermate_percorso` (`c_idpercorso`, `c_idfermata`, `c_ordine_passaggio`, `c_offset_minuti`) VALUES
(1301, 100, 3, 15),
(1301, 101, 5, 22),
(1301, 102, 4, 17),
(1301, 103, 2, 7),
(1301, 104, 6, 30),
(1301, 107, 7, 45),
(1301, 108, 1, 0),
(1302, 100, 4, 30),
(1302, 101, 3, 23),
(1302, 103, 5, 42),
(1302, 104, 2, 15),
(1302, 107, 1, 0),
(1302, 108, 6, 50),
(9001, 100, 4, 25),
(9001, 101, 5, 30),
(9001, 103, 3, 15),
(9001, 104, 6, 40),
(9001, 105, 7, 55),
(9001, 106, 2, 6),
(9001, 108, 1, 0),
(9002, 100, 4, 32),
(9002, 101, 3, 25),
(9002, 103, 5, 45),
(9002, 104, 2, 15),
(9002, 105, 1, 0),
(9002, 106, 6, 53),
(9002, 108, 7, 60),
(14101, 100, 1, 0),
(14101, 200, 6, 65),
(14101, 204, 5, 50),
(14101, 205, 4, 35),
(14101, 206, 3, 20),
(14101, 207, 2, 10),
(14102, 100, 6, 70),
(14102, 200, 1, 0),
(14102, 204, 2, 15),
(14102, 205, 3, 30),
(14102, 206, 4, 45),
(14102, 207, 5, 55),
(14401, 100, 4, 60),
(14401, 200, 1, 0),
(14401, 201, 2, 12),
(14401, 202, 3, 28),
(14402, 100, 1, 0),
(14402, 200, 4, 60),
(14402, 201, 3, 48),
(14402, 202, 2, 32);

-- --------------------------------------------------------

--
-- Struttura della tabella `linee`
--

CREATE TABLE `linee` (
  `c_id` int(11) NOT NULL,
  `c_codice` varchar(10) NOT NULL,
  `c_nome` varchar(100) NOT NULL,
  `c_attiva` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dump dei dati per la tabella `linee`
--

INSERT INTO `linee` (`c_id`, `c_codice`, `c_nome`, `c_attiva`) VALUES
(13, '13', 'Urbano Verona - Linea 13 (asse Porta Vescovo / Centro / Montorio)', 1),
(90, '90', 'Urbano Verona - Linea 90 (asse Ovest / Centro / San Michele)', 1),
(141, '141', 'Extraurbano - Linea 141 (Verona - Pozzo - Oppeano - Legnago)', 1),
(144, '144', 'Extraurbano - Linea 144 (Legnago - Cerea - Bovolone - Verona)', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `mezzi`
--

CREATE TABLE `mezzi` (
  `c_id` int(11) NOT NULL,
  `c_idmodello` int(11) NOT NULL,
  `c_targa` varchar(10) NOT NULL,
  `c_inservizio` date NOT NULL,
  `c_fineservizio` date DEFAULT NULL
) ;

--
-- Dump dei dati per la tabella `mezzi`
--

INSERT INTO `mezzi` (`c_id`, `c_idmodello`, `c_targa`, `c_inservizio`, `c_fineservizio`) VALUES
(1, 1, 'FV123AT', '2021-01-10', NULL),
(2, 2, 'FV456AT', '2022-03-15', NULL),
(3, 3, 'FV789AT', '2019-09-01', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `mezzi_modelli`
--

CREATE TABLE `mezzi_modelli` (
  `c_id` int(11) NOT NULL,
  `c_marca` varchar(45) NOT NULL,
  `c_modello` varchar(45) NOT NULL,
  `c_posti` int(11) NOT NULL,
  `c_postiomologati` int(11) NOT NULL
) ;

--
-- Dump dei dati per la tabella `mezzi_modelli`
--

INSERT INTO `mezzi_modelli` (`c_id`, `c_marca`, `c_modello`, `c_posti`, `c_postiomologati`) VALUES
(1, 'Iveco', 'Urbanway 12', 30, 90),
(2, 'Mercedes', 'Citaro 12', 32, 95),
(3, 'Irisbus', 'Crossway 12', 49, 55);

-- --------------------------------------------------------

--
-- Struttura della tabella `operatoriautisti`
--

CREATE TABLE `operatoriautisti` (
  `c_id` int(11) NOT NULL,
  `c_matricola` varchar(10) DEFAULT NULL,
  `c_nome` varchar(45) DEFAULT NULL,
  `c_cognome` varchar(45) DEFAULT NULL,
  `c_dataassunzione` date NOT NULL,
  `c_attivo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dump dei dati per la tabella `operatoriautisti`
--

INSERT INTO `operatoriautisti` (`c_id`, `c_matricola`, `c_nome`, `c_cognome`, `c_dataassunzione`, `c_attivo`) VALUES
(200, 'ATV0001', 'Luca', 'Verdi', '2015-05-10', 1),
(201, 'ATV0002', 'Sara', 'Neri', '2018-09-03', 1),
(202, 'ATV0100', 'Paolo', 'Conti', '2020-02-20', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `percorsi`
--

CREATE TABLE `percorsi` (
  `c_id` int(11) NOT NULL,
  `c_idlinea` int(11) NOT NULL,
  `c_codice` varchar(20) NOT NULL,
  `c_descrizione` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dump dei dati per la tabella `percorsi`
--

INSERT INTO `percorsi` (`c_id`, `c_idlinea`, `c_codice`, `c_descrizione`) VALUES
(1301, 13, '13-A', 'Direzione Montorio (andata)'),
(1302, 13, '13-R', 'Direzione Centro/Porta Vescovo (ritorno)'),
(9001, 90, '90-A', 'Direzione San Michele Nord (andata)'),
(9002, 90, '90-R', 'Direzione Basson (ritorno)'),
(14101, 141, '141-A', 'Direzione Legnago (andata)'),
(14102, 141, '141-R', 'Direzione Verona (ritorno)'),
(14401, 144, '144-A', 'Direzione Verona (andata)'),
(14402, 144, '144-R', 'Direzione Legnago (ritorno)');

-- --------------------------------------------------------

--
-- Struttura della tabella `sanzioni`
--

CREATE TABLE `sanzioni` (
  `c_id` int(11) NOT NULL,
  `c_data` date NOT NULL,
  `c_idcorsaeffettiva` int(11) NOT NULL,
  `c_importo` decimal(10,2) NOT NULL,
  `c_nome` varchar(45) DEFAULT NULL,
  `c_cognome` varchar(45) DEFAULT NULL,
  `c_cf` varchar(45) DEFAULT NULL,
  `c_ndoc` varchar(45) DEFAULT NULL,
  `c_datadoc` date DEFAULT NULL,
  `c_emessoda` varchar(45) DEFAULT NULL,
  `c_idvia` int(11) DEFAULT NULL,
  `c_idcap` int(11) DEFAULT NULL,
  `c_scadenza` date NOT NULL,
  `c_pagata` tinyint(1) NOT NULL DEFAULT 0,
  `c_idoperatore` int(11) DEFAULT NULL
) ;

--
-- Dump dei dati per la tabella `sanzioni`
--

INSERT INTO `sanzioni` (`c_id`, `c_data`, `c_idcorsaeffettiva`, `c_importo`, `c_nome`, `c_cognome`, `c_cf`, `c_ndoc`, `c_datadoc`, `c_emessoda`, `c_idvia`, `c_idcap`, `c_scadenza`, `c_pagata`, `c_idoperatore`) VALUES
(1, '2025-12-15', 2000, 50.00, 'Hans', 'Müller', 'HNSMLL80B01DE000', 'DE998877', '2018-04-15', 'KVR München', 100, 10, '2026-01-14', 0, 202);

-- --------------------------------------------------------

--
-- Struttura della tabella `servizio`
--

CREATE TABLE `servizio` (
  `c_id` int(11) NOT NULL,
  `c_descrizione` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dump dei dati per la tabella `servizio`
--

INSERT INTO `servizio` (`c_id`, `c_descrizione`) VALUES
(2, 'Extraurbano Verona e Provincia'),
(1, 'Urbano Verona');

-- --------------------------------------------------------

--
-- Struttura della tabella `servizio_calendario`
--

CREATE TABLE `servizio_calendario` (
  `c_idservizio` int(11) NOT NULL,
  `c_data_inizio` date NOT NULL,
  `c_data_fine` date NOT NULL,
  `c_lunedi` tinyint(1) NOT NULL,
  `c_martedi` tinyint(1) NOT NULL,
  `c_mercoledi` tinyint(1) NOT NULL,
  `c_giovedi` tinyint(1) NOT NULL,
  `c_venerdi` tinyint(1) NOT NULL,
  `c_sabato` tinyint(1) NOT NULL,
  `c_domenica` tinyint(1) NOT NULL
) ;

--
-- Dump dei dati per la tabella `servizio_calendario`
--

INSERT INTO `servizio_calendario` (`c_idservizio`, `c_data_inizio`, `c_data_fine`, `c_lunedi`, `c_martedi`, `c_mercoledi`, `c_giovedi`, `c_venerdi`, `c_sabato`, `c_domenica`) VALUES
(1, '2025-01-01', '2026-12-31', 1, 1, 1, 1, 1, 1, 1),
(2, '2025-01-01', '2026-12-31', 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `servizio_eccezioni`
--

CREATE TABLE `servizio_eccezioni` (
  `c_idservizio` int(11) NOT NULL,
  `c_data` date NOT NULL,
  `c_tipo` char(1) NOT NULL
) ;

--
-- Dump dei dati per la tabella `servizio_eccezioni`
--

INSERT INTO `servizio_eccezioni` (`c_idservizio`, `c_data`, `c_tipo`) VALUES
(1, '2025-05-01', 'D'),
(2, '2025-05-01', 'D');

-- --------------------------------------------------------

--
-- Struttura della tabella `servizio_tariffe`
--

CREATE TABLE `servizio_tariffe` (
  `c_id` int(11) NOT NULL,
  `c_idservizio` int(11) NOT NULL,
  `c_codice` varchar(6) NOT NULL,
  `c_descrizione` varchar(45) DEFAULT NULL,
  `c_importo` decimal(10,2) NOT NULL,
  `c_minutiapplicazione` int(11) NOT NULL,
  `c_minutivalidita` int(11) NOT NULL,
  `c_tipologia` enum('biglietto','abbonamento') NOT NULL,
  `c_corsemesi` int(11) NOT NULL,
  `c_persone` int(11) NOT NULL DEFAULT 1
) ;

--
-- Dump dei dati per la tabella `servizio_tariffe`
--

INSERT INTO `servizio_tariffe` (`c_id`, `c_idservizio`, `c_codice`, `c_descrizione`, `c_importo`, `c_minutiapplicazione`, `c_minutivalidita`, `c_tipologia`, `c_corsemesi`, `c_persone`) VALUES
(101, 1, 'U90', 'Biglietto urbano Verona 90 minuti', 1.50, 90, 90, 'biglietto', 1, 1),
(102, 1, 'UDAY', 'Biglietto giornaliero urbano (24 ore)', 5.00, 1440, 1440, 'biglietto', 1, 1),
(103, 1, 'UMENS', 'Abbonamento mensile urbano Verona', 52.00, 0, 43200, 'abbonamento', 1, 1),
(201, 2, 'T2', 'Biglietto extraurbano Tariffa 2 ', 2.30, 75, 75, 'biglietto', 1, 1),
(202, 2, 'T3', 'Biglietto extraurbano Tariffa 3', 3.20, 90, 90, 'biglietto', 1, 1),
(203, 2, 'EM3', 'Abbonamento mensile extraurbano Tariffa 3', 63.00, 90, 0, 'abbonamento', 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `str_cap`
--

CREATE TABLE `str_cap` (
  `c_id` int(11) NOT NULL,
  `c_idcitta` int(11) NOT NULL,
  `c_cap` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dump dei dati per la tabella `str_cap`
--

INSERT INTO `str_cap` (`c_id`, `c_idcitta`, `c_cap`) VALUES
(1, 1, '37100'),
(2, 1, '37121'),
(3, 2, '37045'),
(4, 3, '37047'),
(5, 4, '37053'),
(6, 5, '37051'),
(10, 10, '80331');

-- --------------------------------------------------------

--
-- Struttura della tabella `str_citta`
--

CREATE TABLE `str_citta` (
  `c_id` int(11) NOT NULL,
  `c_idstato` int(11) NOT NULL,
  `c_citta` varchar(45) NOT NULL,
  `c_regione` varchar(100) DEFAULT NULL,
  `c_provincia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dump dei dati per la tabella `str_citta`
--

INSERT INTO `str_citta` (`c_id`, `c_idstato`, `c_citta`, `c_regione`, `c_provincia`) VALUES
(1, 1, 'Verona', 'Veneto', 'VR'),
(2, 1, 'Legnago', 'Veneto', 'VR'),
(3, 1, 'San Bonifacio', 'Veneto', 'VR'),
(4, 1, 'Cerea', 'Veneto', 'VR'),
(5, 1, 'Bovolone', 'Veneto', 'VR'),
(10, 2, 'Monaco di Baviera', 'Baviera', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `str_stati`
--

CREATE TABLE `str_stati` (
  `c_id` int(11) NOT NULL,
  `c_stato` varchar(45) NOT NULL,
  `c_iso2` char(2) NOT NULL,
  `c_iso3` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dump dei dati per la tabella `str_stati`
--

INSERT INTO `str_stati` (`c_id`, `c_stato`, `c_iso2`, `c_iso3`) VALUES
(1, 'Italia', 'IT', 'ITA'),
(2, 'Germania', 'DE', 'DEU');

-- --------------------------------------------------------

--
-- Struttura della tabella `str_vie`
--

CREATE TABLE `str_vie` (
  `c_id` int(11) NOT NULL,
  `c_idcitta` int(11) NOT NULL,
  `c_nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dump dei dati per la tabella `str_vie`
--

INSERT INTO `str_vie` (`c_id`, `c_idcitta`, `c_nome`) VALUES
(3, 1, 'Piazza Brà'),
(4, 1, 'Piazzale Olimpia'),
(5, 1, 'Via Barana'),
(8, 1, 'Via Scuderlando'),
(6, 1, 'Via Unità d\'Italia'),
(2, 1, 'Via Valverde'),
(7, 1, 'Via Zeviani'),
(1, 1, 'Viale Piave'),
(20, 2, 'Via Roma'),
(21, 2, 'Viale dei Tigli'),
(30, 3, 'Via Fiume'),
(40, 4, 'Piazza Matteotti'),
(50, 5, 'Via Madonna'),
(100, 10, 'Marienplatz');

-- --------------------------------------------------------

--
-- Struttura della tabella `titoli`
--

CREATE TABLE `titoli` (
  `c_id` int(11) NOT NULL,
  `c_idcliente` int(11) DEFAULT NULL,
  `c_codiceverifica` varchar(256) NOT NULL,
  `c_idtariffa` int(11) NOT NULL,
  `c_emissione` datetime NOT NULL,
  `c_inizivalidita` datetime NOT NULL,
  `c_fermatainizio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dump dei dati per la tabella `titoli`
--

INSERT INTO `titoli` (`c_id`, `c_idcliente`, `c_codiceverifica`, `c_idtariffa`, `c_emissione`, `c_inizivalidita`, `c_fermatainizio`) VALUES
(10001, 1, 'HASH-DEMO-URB-10001', 101, '2025-12-15 07:03:10', '2025-12-15 07:06:00', 100),
(10002, 1, 'HASH-DEMO-ABB-10002', 103, '2025-12-01 08:00:00', '2025-12-01 00:00:00', 100),
(10003, 2, 'HASH-DEMO-EXT-10003', 202, '2025-12-15 06:20:00', '2025-12-15 06:30:00', 200),
(10004, 3, 'HASH-DEMO-UDAY-10004', 102, '2025-12-15 10:05:00', '2025-12-15 10:06:00', 101);

-- --------------------------------------------------------

--
-- Struttura della tabella `validazioni_titoli`
--

CREATE TABLE `validazioni_titoli` (
  `c_id` int(11) NOT NULL,
  `c_idtitolo` int(11) NOT NULL,
  `c_datetime` datetime NOT NULL,
  `c_idfermata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dump dei dati per la tabella `validazioni_titoli`
--

INSERT INTO `validazioni_titoli` (`c_id`, `c_idtitolo`, `c_datetime`, `c_idfermata`) VALUES
(1, 10001, '2025-12-15 07:06:00', 100),
(3, 10003, '2025-12-15 06:30:00', 200),
(4, 10004, '2025-12-15 10:06:00', 101);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `uq_cliente_cf` (`c_cf`),
  ADD UNIQUE KEY `uq_cliente_email` (`c_email`),
  ADD KEY `fk_clienti_vie_idvia_idx` (`c_idviaresidenza`),
  ADD KEY `fk_clienti_cap_idcap_idx` (`c_idcapresidenza`);

--
-- Indici per le tabelle `corse`
--
ALTER TABLE `corse`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `uq_corse` (`c_idpercorso`,`c_idservizio`,`c_partenza`),
  ADD KEY `fk_corse_percorso_idx` (`c_idpercorso`),
  ADD KEY `fk_corse_servizio_idx` (`c_idservizio`);

--
-- Indici per le tabelle `corse_effettive`
--
ALTER TABLE `corse_effettive`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `uq_corse_effettive` (`c_idcorsa`,`c_date`),
  ADD KEY `fk_corse_eff_corsa_idx` (`c_idcorsa`),
  ADD KEY `fk_corse_eff_mezzo_idx` (`c_idmezzo`),
  ADD KEY `fk_corse_eff_autista_idx` (`c_idautista`),
  ADD KEY `idx_corse_eff_data` (`c_date`);

--
-- Indici per le tabelle `fermate`
--
ALTER TABLE `fermate`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `fk_fermate_vie_idx` (`c_idvia`),
  ADD KEY `idx_fermate_nome` (`c_nome`);

--
-- Indici per le tabelle `fermate_percorso`
--
ALTER TABLE `fermate_percorso`
  ADD PRIMARY KEY (`c_idpercorso`,`c_idfermata`),
  ADD UNIQUE KEY `uq_fermate_percorso_ordine` (`c_idpercorso`,`c_ordine_passaggio`),
  ADD KEY `fk_fermate_percorso_fermata_idx` (`c_idfermata`);

--
-- Indici per le tabelle `linee`
--
ALTER TABLE `linee`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `uq_linee_codice` (`c_codice`);

--
-- Indici per le tabelle `mezzi`
--
ALTER TABLE `mezzi`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `uq_mezzi_targa` (`c_targa`),
  ADD KEY `fk_mezzi_modellimezzi_idmodello_idx` (`c_idmodello`);

--
-- Indici per le tabelle `mezzi_modelli`
--
ALTER TABLE `mezzi_modelli`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `uq_mezzi_modelli` (`c_marca`,`c_modello`);

--
-- Indici per le tabelle `operatoriautisti`
--
ALTER TABLE `operatoriautisti`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `uq_operatoriautisti_matricola` (`c_matricola`);

--
-- Indici per le tabelle `percorsi`
--
ALTER TABLE `percorsi`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `uq_percorsi` (`c_idlinea`,`c_codice`),
  ADD KEY `fk_percorsi_linee_idx` (`c_idlinea`);

--
-- Indici per le tabelle `sanzioni`
--
ALTER TABLE `sanzioni`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `fk_sanzioni_vie_idvie_idx` (`c_idvia`),
  ADD KEY `fk_sanzioni_cap_idcap_idx` (`c_idcap`),
  ADD KEY `fk_sanzioni_operatoriautisti_idoperatore_idx` (`c_idoperatore`),
  ADD KEY `fk_sanzioni_corse_eff_idcorsaeff_idx` (`c_idcorsaeffettiva`),
  ADD KEY `idx_sanzioni_pagata` (`c_pagata`);

--
-- Indici per le tabelle `servizio`
--
ALTER TABLE `servizio`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `uq_servizio_descrizione` (`c_descrizione`);

--
-- Indici per le tabelle `servizio_calendario`
--
ALTER TABLE `servizio_calendario`
  ADD PRIMARY KEY (`c_idservizio`,`c_data_inizio`,`c_data_fine`),
  ADD KEY `fk_cal_servizio_idx` (`c_idservizio`);

--
-- Indici per le tabelle `servizio_eccezioni`
--
ALTER TABLE `servizio_eccezioni`
  ADD PRIMARY KEY (`c_idservizio`,`c_data`),
  ADD KEY `fk_eccezioni_servizio_idx` (`c_idservizio`);

--
-- Indici per le tabelle `servizio_tariffe`
--
ALTER TABLE `servizio_tariffe`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `uq_tariffe` (`c_idservizio`,`c_codice`),
  ADD KEY `fk_servizio_tariffe_servizio_idservizio_idx` (`c_idservizio`);

--
-- Indici per le tabelle `str_cap`
--
ALTER TABLE `str_cap`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `uq_str_cap` (`c_idcitta`,`c_cap`),
  ADD KEY `fk_cap_citta_idcitta_idx` (`c_idcitta`);

--
-- Indici per le tabelle `str_citta`
--
ALTER TABLE `str_citta`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `uq_str_citta` (`c_idstato`,`c_citta`),
  ADD KEY `fk_str_citta_stato_idstato_idx` (`c_idstato`),
  ADD KEY `idx_provincia` (`c_provincia`),
  ADD KEY `idx_regione` (`c_regione`);

--
-- Indici per le tabelle `str_stati`
--
ALTER TABLE `str_stati`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `uq_str_stati_iso2` (`c_iso2`),
  ADD UNIQUE KEY `uq_str_stati_iso3` (`c_iso3`),
  ADD UNIQUE KEY `uq_str_stati_stato` (`c_stato`);

--
-- Indici per le tabelle `str_vie`
--
ALTER TABLE `str_vie`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `uq_str_vie` (`c_idcitta`,`c_nome`),
  ADD KEY `fk_str_vie_citta_idcitta_idx` (`c_idcitta`);

--
-- Indici per le tabelle `titoli`
--
ALTER TABLE `titoli`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `fk_titoli_clienti_idcliente_idx` (`c_idcliente`),
  ADD KEY `fk_titoli_tariffe_idtariffa_idx` (`c_idtariffa`),
  ADD KEY `fk_titoli_fermata_idx` (`c_fermatainizio`);

--
-- Indici per le tabelle `validazioni_titoli`
--
ALTER TABLE `validazioni_titoli`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `fk_validazione_titoli_idtitolo_idx` (`c_idtitolo`),
  ADD KEY `fk_validazione_fermate_idx` (`c_idfermata`),
  ADD KEY `idx_validazioni_datetime` (`c_datetime`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `cliente`
--
ALTER TABLE `cliente`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `corse`
--
ALTER TABLE `corse`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT per la tabella `corse_effettive`
--
ALTER TABLE `corse_effettive`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2002;

--
-- AUTO_INCREMENT per la tabella `fermate`
--
ALTER TABLE `fermate`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `linee`
--
ALTER TABLE `linee`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT per la tabella `mezzi`
--
ALTER TABLE `mezzi`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `mezzi_modelli`
--
ALTER TABLE `mezzi_modelli`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `operatoriautisti`
--
ALTER TABLE `operatoriautisti`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT per la tabella `percorsi`
--
ALTER TABLE `percorsi`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14403;

--
-- AUTO_INCREMENT per la tabella `sanzioni`
--
ALTER TABLE `sanzioni`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `servizio`
--
ALTER TABLE `servizio`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `servizio_tariffe`
--
ALTER TABLE `servizio_tariffe`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `str_cap`
--
ALTER TABLE `str_cap`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `str_citta`
--
ALTER TABLE `str_citta`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `str_stati`
--
ALTER TABLE `str_stati`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `str_vie`
--
ALTER TABLE `str_vie`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT per la tabella `titoli`
--
ALTER TABLE `titoli`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10005;

--
-- AUTO_INCREMENT per la tabella `validazioni_titoli`
--
ALTER TABLE `validazioni_titoli`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_cap` FOREIGN KEY (`c_idcapresidenza`) REFERENCES `str_cap` (`c_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cliente_via` FOREIGN KEY (`c_idviaresidenza`) REFERENCES `str_vie` (`c_id`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `corse`
--
ALTER TABLE `corse`
  ADD CONSTRAINT `fk_corse_percorso` FOREIGN KEY (`c_idpercorso`) REFERENCES `percorsi` (`c_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_corse_servizio` FOREIGN KEY (`c_idservizio`) REFERENCES `servizio` (`c_id`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `corse_effettive`
--
ALTER TABLE `corse_effettive`
  ADD CONSTRAINT `fk_corse_eff_autista` FOREIGN KEY (`c_idautista`) REFERENCES `operatoriautisti` (`c_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_corse_eff_corsa` FOREIGN KEY (`c_idcorsa`) REFERENCES `corse` (`c_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_corse_eff_mezzo` FOREIGN KEY (`c_idmezzo`) REFERENCES `mezzi` (`c_id`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `fermate`
--
ALTER TABLE `fermate`
  ADD CONSTRAINT `fk_fermate_via` FOREIGN KEY (`c_idvia`) REFERENCES `str_vie` (`c_id`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `fermate_percorso`
--
ALTER TABLE `fermate_percorso`
  ADD CONSTRAINT `fk_fp_fermata` FOREIGN KEY (`c_idfermata`) REFERENCES `fermate` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fp_percorso` FOREIGN KEY (`c_idpercorso`) REFERENCES `percorsi` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `mezzi`
--
ALTER TABLE `mezzi`
  ADD CONSTRAINT `fk_mezzi_modello` FOREIGN KEY (`c_idmodello`) REFERENCES `mezzi_modelli` (`c_id`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `percorsi`
--
ALTER TABLE `percorsi`
  ADD CONSTRAINT `fk_percorsi_linee` FOREIGN KEY (`c_idlinea`) REFERENCES `linee` (`c_id`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `sanzioni`
--
ALTER TABLE `sanzioni`
  ADD CONSTRAINT `fk_sanzioni_cap` FOREIGN KEY (`c_idcap`) REFERENCES `str_cap` (`c_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sanzioni_corse_eff` FOREIGN KEY (`c_idcorsaeffettiva`) REFERENCES `corse_effettive` (`c_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sanzioni_operatore` FOREIGN KEY (`c_idoperatore`) REFERENCES `operatoriautisti` (`c_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sanzioni_via` FOREIGN KEY (`c_idvia`) REFERENCES `str_vie` (`c_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `servizio_calendario`
--
ALTER TABLE `servizio_calendario`
  ADD CONSTRAINT `fk_cal_servizio` FOREIGN KEY (`c_idservizio`) REFERENCES `servizio` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `servizio_eccezioni`
--
ALTER TABLE `servizio_eccezioni`
  ADD CONSTRAINT `fk_eccezioni_servizio` FOREIGN KEY (`c_idservizio`) REFERENCES `servizio` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `servizio_tariffe`
--
ALTER TABLE `servizio_tariffe`
  ADD CONSTRAINT `fk_tariffe_servizio` FOREIGN KEY (`c_idservizio`) REFERENCES `servizio` (`c_id`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `str_cap`
--
ALTER TABLE `str_cap`
  ADD CONSTRAINT `fk_str_cap_citta` FOREIGN KEY (`c_idcitta`) REFERENCES `str_citta` (`c_id`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `str_citta`
--
ALTER TABLE `str_citta`
  ADD CONSTRAINT `fk_str_citta_stato` FOREIGN KEY (`c_idstato`) REFERENCES `str_stati` (`c_id`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `str_vie`
--
ALTER TABLE `str_vie`
  ADD CONSTRAINT `fk_str_vie_citta` FOREIGN KEY (`c_idcitta`) REFERENCES `str_citta` (`c_id`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `titoli`
--
ALTER TABLE `titoli`
  ADD CONSTRAINT `fk_titoli_cliente` FOREIGN KEY (`c_idcliente`) REFERENCES `cliente` (`c_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_titoli_fermata` FOREIGN KEY (`c_fermatainizio`) REFERENCES `fermate` (`c_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_titoli_tariffa` FOREIGN KEY (`c_idtariffa`) REFERENCES `servizio_tariffe` (`c_id`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `validazioni_titoli`
--
ALTER TABLE `validazioni_titoli`
  ADD CONSTRAINT `fk_validazioni_fermate` FOREIGN KEY (`c_idfermata`) REFERENCES `fermate` (`c_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_validazioni_titoli` FOREIGN KEY (`c_idtitolo`) REFERENCES `titoli` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
