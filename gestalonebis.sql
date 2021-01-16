-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 18 juin 2019 à 20:25
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestalonebis`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite_agricole`
--

CREATE TABLE `activite_agricole` (
  `numActAgri` int(11) NOT NULL,
  `libActAgri` varchar(30) DEFAULT NULL,
  `numGerant` int(11) NOT NULL,
  `statutActAgri` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `activite_agricole`
--

INSERT INTO `activite_agricole` (`numActAgri`, `libActAgri`, `numGerant`, `statutActAgri`) VALUES
(1, 'Sarclages', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `campagne_agricole`
--

CREATE TABLE `campagne_agricole` (
  `numCA` int(11) NOT NULL,
  `dateCA` date DEFAULT NULL,
  `codeCA` varchar(6) DEFAULT NULL,
  `statutCA` tinyint(1) DEFAULT '1',
  `numGerant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `campagne_agricole`
--

INSERT INTO `campagne_agricole` (`numCA`, `dateCA`, `codeCA`, `statutCA`, `numGerant`) VALUES
(1, '2019-06-08', '2019', 0, 1),
(2, '2019-06-08', '2019-2', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `cultiver`
--

CREATE TABLE `cultiver` (
  `numEspVeg` int(11) NOT NULL,
  `numCA` int(11) NOT NULL,
  `dateRecolte` datetime DEFAULT NULL,
  `qtteRecolte` int(11) DEFAULT NULL,
  `statutRec` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cultiver`
--

INSERT INTO `cultiver` (`numEspVeg`, `numCA`, `dateRecolte`, `qtteRecolte`, `statutRec`) VALUES
(1, 2, '2019-06-08 22:13:44', 30, 1),
(1, 2, '2019-06-18 14:02:59', 10, 1),
(2, 2, '2019-06-18 14:04:18', 10, 1);

-- --------------------------------------------------------

--
-- Structure de la table `depense`
--

CREATE TABLE `depense` (
  `numDep` int(11) NOT NULL,
  `descDep` varchar(80) DEFAULT NULL,
  `montantDep` int(11) DEFAULT NULL,
  `dateEnregDep` datetime DEFAULT NULL,
  `statutDep` tinyint(1) DEFAULT '1',
  `numGerant` int(11) NOT NULL,
  `numCA` int(11) NOT NULL,
  `numActAgri` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `depense`
--

INSERT INTO `depense` (`numDep`, `descDep`, `montantDep`, `dateEnregDep`, `statutDep`, `numGerant`, `numCA`, `numActAgri`) VALUES
(1, 'paiement des ouvriers', 2000, '2019-06-08 00:00:00', 0, 1, 2, 1),
(2, 'garri pour les peulhs', 1000, '2019-06-08 22:17:47', 1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `espece_vegetale`
--

CREATE TABLE `espece_vegetale` (
  `numEspVeg` int(11) NOT NULL,
  `libEspVeg` varchar(25) DEFAULT NULL,
  `puEspVeg` int(11) DEFAULT NULL,
  `statutEspVeg` tinyint(1) DEFAULT '1',
  `numGerant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `espece_vegetale`
--

INSERT INTO `espece_vegetale` (`numEspVeg`, `libEspVeg`, `puEspVeg`, `statutEspVeg`, `numGerant`) VALUES
(1, 'Maïs', 300, 1, 1),
(2, 'Haricot', 1500, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `gerant`
--

CREATE TABLE `gerant` (
  `numGerant` int(11) NOT NULL,
  `loginGerant` varchar(25) DEFAULT NULL,
  `mdpGerant` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gerant`
--

INSERT INTO `gerant` (`numGerant`, `loginGerant`, `mdpGerant`) VALUES
(1, 'roottoor', 'roottoor'),
(2, 'azertyuiop', 'azertyuiop');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite_agricole`
--
ALTER TABLE `activite_agricole`
  ADD PRIMARY KEY (`numActAgri`),
  ADD KEY `fk_gerant_actagri` (`numGerant`);

--
-- Index pour la table `campagne_agricole`
--
ALTER TABLE `campagne_agricole`
  ADD PRIMARY KEY (`numCA`),
  ADD KEY `fk_gerant_ca` (`numGerant`);

--
-- Index pour la table `cultiver`
--
ALTER TABLE `cultiver`
  ADD KEY `fk_espVeg_cultiver` (`numEspVeg`),
  ADD KEY `fk_ca_cultiver` (`numCA`);

--
-- Index pour la table `depense`
--
ALTER TABLE `depense`
  ADD PRIMARY KEY (`numDep`),
  ADD KEY `fk_gerant_depense` (`numGerant`),
  ADD KEY `fk_ca_depense` (`numCA`),
  ADD KEY `fk_ActAgri_depense` (`numActAgri`);

--
-- Index pour la table `espece_vegetale`
--
ALTER TABLE `espece_vegetale`
  ADD PRIMARY KEY (`numEspVeg`),
  ADD KEY `fk_gerant_espVeg` (`numGerant`);

--
-- Index pour la table `gerant`
--
ALTER TABLE `gerant`
  ADD PRIMARY KEY (`numGerant`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activite_agricole`
--
ALTER TABLE `activite_agricole`
  MODIFY `numActAgri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `campagne_agricole`
--
ALTER TABLE `campagne_agricole`
  MODIFY `numCA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `depense`
--
ALTER TABLE `depense`
  MODIFY `numDep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `espece_vegetale`
--
ALTER TABLE `espece_vegetale`
  MODIFY `numEspVeg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `gerant`
--
ALTER TABLE `gerant`
  MODIFY `numGerant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activite_agricole`
--
ALTER TABLE `activite_agricole`
  ADD CONSTRAINT `fk_gerant_actagri` FOREIGN KEY (`numGerant`) REFERENCES `gerant` (`numGerant`);

--
-- Contraintes pour la table `campagne_agricole`
--
ALTER TABLE `campagne_agricole`
  ADD CONSTRAINT `fk_gerant_ca` FOREIGN KEY (`numGerant`) REFERENCES `gerant` (`numGerant`);

--
-- Contraintes pour la table `cultiver`
--
ALTER TABLE `cultiver`
  ADD CONSTRAINT `fk_ca_cultiver` FOREIGN KEY (`numCA`) REFERENCES `campagne_agricole` (`numCA`),
  ADD CONSTRAINT `fk_espVeg_cultiver` FOREIGN KEY (`numEspVeg`) REFERENCES `espece_vegetale` (`numEspVeg`);

--
-- Contraintes pour la table `depense`
--
ALTER TABLE `depense`
  ADD CONSTRAINT `fk_ActAgri_depense` FOREIGN KEY (`numActAgri`) REFERENCES `activite_agricole` (`numActAgri`),
  ADD CONSTRAINT `fk_ca_depense` FOREIGN KEY (`numCA`) REFERENCES `campagne_agricole` (`numCA`),
  ADD CONSTRAINT `fk_gerant_depense` FOREIGN KEY (`numGerant`) REFERENCES `gerant` (`numGerant`);

--
-- Contraintes pour la table `espece_vegetale`
--
ALTER TABLE `espece_vegetale`
  ADD CONSTRAINT `fk_gerant_espVeg` FOREIGN KEY (`numGerant`) REFERENCES `gerant` (`numGerant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
