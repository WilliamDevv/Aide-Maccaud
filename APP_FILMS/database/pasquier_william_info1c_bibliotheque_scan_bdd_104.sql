-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 21 Mai 2021 à 08:42
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pasquier_william_info1c_bibliotheque_scan_bdd_104`
--

-- --------------------------------------------------------
--

-- Database: pasquier_william_info1c_bibliotheque_scan_bd_104
-- Détection si une autre base de donnée du même nom existe

DROP DATABASE IF EXISTS pasquier_william_info1c_bibliotheque_scan_bdd_104;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS pasquier_william_info1c_bibliotheque_scan_bdd_104;

-- Utilisation de cette base de donnée

USE pasquier_william_info1c_bibliotheque_scan_bdd_104;

--
-- --------------------------------------------------------

--
-- Structure de la table `t_avis`
--

CREATE TABLE `t_avis` (
  `id_avis` int(11) NOT NULL,
  `avis_note` tinyint(5) NOT NULL,
  `avis_message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_avis`
--

INSERT INTO `t_avis` (`id_avis`, `avis_note`, `avis_message`) VALUES
(2, 5, 'Franchement très beau gosse comme manga je recommande');

-- --------------------------------------------------------

--
-- Structure de la table `t_avoir_avis`
--

CREATE TABLE `t_avoir_avis` (
  `id_avoir_avis` int(11) NOT NULL,
  `fk_scan` int(11) NOT NULL,
  `fk_avis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_avoir_avis`
--

INSERT INTO `t_avoir_avis` (`id_avoir_avis`, `fk_scan`, `fk_avis`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `t_avoir_genre`
--

CREATE TABLE `t_avoir_genre` (
  `id_avoir_genre` int(11) NOT NULL,
  `fk_scan` int(11) NOT NULL,
  `fk_genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_avoir_genre`
--

INSERT INTO `t_avoir_genre` (`id_avoir_genre`, `fk_scan`, `fk_genre`) VALUES
(1, 1, 2),
(2, 1, 9),
(3, 1, 10);

-- --------------------------------------------------------

--
-- Structure de la table `t_fichier`
--

CREATE TABLE `t_fichier` (
  `id_fichier` int(11) NOT NULL,
  `fichier` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_fichier`
--

INSERT INTO `t_fichier` (`id_fichier`, `fichier`) VALUES
(1, 'https://drive.google.com/file/d/1fHlyDu8dL_cchEwHSE_jALMZQ7BrJ1_G/view?usp=sharing');

-- --------------------------------------------------------

--
-- Structure de la table `t_genre`
--

CREATE TABLE `t_genre` (
  `id_genre` int(11) NOT NULL COMMENT 'Valeur unique du genre',
  `genre` varchar(30) NOT NULL COMMENT 'Genre du scan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_genre`
--

INSERT INTO `t_genre` (`id_genre`, `genre`) VALUES
(1, 'Shonen'),
(2, 'Seinen'),
(3, 'Shojo'),
(4, 'Horreur'),
(5, 'Hentai'),
(6, 'Yaoi'),
(7, 'Yuri'),
(8, 'Exorsisme'),
(9, 'Course'),
(10, 'Aventure');

-- --------------------------------------------------------

--
-- Structure de la table `t_mail`
--

CREATE TABLE `t_mail` (
  `id_mail` int(11) NOT NULL COMMENT 'Valeur unique du mail',
  `mail` varchar(320) NOT NULL COMMENT 'Mail de la personne'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_mail`
--

INSERT INTO `t_mail` (`id_mail`, `mail`) VALUES
(1, 'williampasquier.pro@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `t_motdepasse`
--

CREATE TABLE `t_motdepasse` (
  `id_motDePasse` int(11) NOT NULL COMMENT 'Valeur unique du mot de passe',
  `motDePasse` varchar(300) NOT NULL COMMENT 'Mot de passe de la personne'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_motdepasse`
--

INSERT INTO `t_motdepasse` (`id_motDePasse`, `motDePasse`) VALUES
(1, 'JeSuisUnBg17_');

-- --------------------------------------------------------

--
-- Structure de la table `t_personne`
--

CREATE TABLE `t_personne` (
  `id_personne` int(11) NOT NULL COMMENT 'Valeur unique de la personne',
  `pers_nom` varchar(30) NOT NULL COMMENT 'Nom de famille de la personne',
  `pers_prenom` varchar(30) NOT NULL COMMENT 'Prénom de la personne',
  `pers_dateDeNaissance` date DEFAULT NULL COMMENT 'Date de naissance de la personne',
  `pers_ageValide` tinyint(1) NOT NULL COMMENT 'Sera vrai si la personne à plus de 18 ans pour accéder à certain contenu',
  `fk_pseudo` int(11) DEFAULT NULL COMMENT 'Clé étrangère de T_Pseudo',
  `fk_mail` int(11) DEFAULT NULL COMMENT 'Clé étrangère de T_Mail',
  `fk_motDePasse` int(11) DEFAULT NULL COMMENT 'Clé étrangère de T_MotDePasse'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_personne`
--

INSERT INTO `t_personne` (`id_personne`, `pers_nom`, `pers_prenom`, `pers_dateDeNaissance`, `pers_ageValide`, `fk_pseudo`, `fk_mail`, `fk_motDePasse`) VALUES
(2, 'Pasquier', 'William', '2002-08-17', 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_pseudo`
--

CREATE TABLE `t_pseudo` (
  `id_pseudo` int(11) NOT NULL COMMENT 'Valeur unique du pseudo',
  `pseudo` varchar(30) NOT NULL COMMENT 'Pseudo de la personne'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_pseudo`
--

INSERT INTO `t_pseudo` (`id_pseudo`, `pseudo`) VALUES
(1, 'Homie');

-- --------------------------------------------------------

--
-- Structure de la table `t_scan`
--

CREATE TABLE `t_scan` (
  `id_scan` int(11) NOT NULL COMMENT 'Valeur unique du scan',
  `scan_titre` varchar(60) NOT NULL COMMENT 'Titre du Scan (manga)',
  `scan_auteur` varchar(60) NOT NULL COMMENT 'Nom et prénom de l''auteur du Scan (manga)',
  `scan_dessinateur` varchar(60) NOT NULL COMMENT 'Nom et prénom du dessinateur du Scan (manga)',
  `scan_nombreDePages` int(4) NOT NULL COMMENT 'Nombre de pages du Scan (manga)',
  `scan_maisonDEdition` varchar(30) NOT NULL COMMENT 'Maison d''édition du manga',
  `fk_fichier` int(11) DEFAULT NULL COMMENT 'Clé étrangère de T_Fichier'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_scan`
--

INSERT INTO `t_scan` (`id_scan`, `scan_titre`, `scan_auteur`, `scan_dessinateur`, `scan_nombreDePages`, `scan_maisonDEdition`, `fk_fichier`) VALUES
(1, 'Jojo\'s Bizarre Adventure - Steel Ball Run - Tome 17', 'Hirohiko Araki', 'Hirohiko Araki', 106, 'Tonkam', 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_souhaiter_lire`
--

CREATE TABLE `t_souhaiter_lire` (
  `id_souhaiter_lire` int(11) NOT NULL,
  `fk_personne` int(11) NOT NULL,
  `fk_scan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_souhaiter_lire`
--

INSERT INTO `t_souhaiter_lire` (`id_souhaiter_lire`, `fk_personne`, `fk_scan`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_telecharger`
--

CREATE TABLE `t_telecharger` (
  `id_telecharger` int(11) NOT NULL,
  `fk_personne` int(11) NOT NULL,
  `fk_scan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `t_avis`
--
ALTER TABLE `t_avis`
  ADD PRIMARY KEY (`id_avis`);

--
-- Index pour la table `t_avoir_avis`
--
ALTER TABLE `t_avoir_avis`
  ADD PRIMARY KEY (`id_avoir_avis`),
  ADD KEY `fk_scan` (`fk_scan`),
  ADD KEY `fk_avis` (`fk_avis`);

--
-- Index pour la table `t_avoir_genre`
--
ALTER TABLE `t_avoir_genre`
  ADD PRIMARY KEY (`id_avoir_genre`),
  ADD KEY `fk_scan` (`fk_scan`),
  ADD KEY `fk_genre` (`fk_genre`);

--
-- Index pour la table `t_fichier`
--
ALTER TABLE `t_fichier`
  ADD PRIMARY KEY (`id_fichier`);

--
-- Index pour la table `t_genre`
--
ALTER TABLE `t_genre`
  ADD PRIMARY KEY (`id_genre`);

--
-- Index pour la table `t_mail`
--
ALTER TABLE `t_mail`
  ADD PRIMARY KEY (`id_mail`);

--
-- Index pour la table `t_motdepasse`
--
ALTER TABLE `t_motdepasse`
  ADD PRIMARY KEY (`id_motDePasse`);

--
-- Index pour la table `t_personne`
--
ALTER TABLE `t_personne`
  ADD PRIMARY KEY (`id_personne`),
  ADD KEY `fk_pseudo` (`fk_pseudo`),
  ADD KEY `fk_mail` (`fk_mail`),
  ADD KEY `fk_motDePasse` (`fk_motDePasse`);

--
-- Index pour la table `t_pseudo`
--
ALTER TABLE `t_pseudo`
  ADD PRIMARY KEY (`id_pseudo`);

--
-- Index pour la table `t_scan`
--
ALTER TABLE `t_scan`
  ADD PRIMARY KEY (`id_scan`),
  ADD KEY `fk_fichier` (`fk_fichier`);

--
-- Index pour la table `t_souhaiter_lire`
--
ALTER TABLE `t_souhaiter_lire`
  ADD PRIMARY KEY (`id_souhaiter_lire`),
  ADD KEY `fk_personne` (`fk_personne`),
  ADD KEY `fk_scan` (`fk_scan`);

--
-- Index pour la table `t_telecharger`
--
ALTER TABLE `t_telecharger`
  ADD PRIMARY KEY (`id_telecharger`),
  ADD KEY `fk_personne` (`fk_personne`),
  ADD KEY `fk_scan` (`fk_scan`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `t_avis`
--
ALTER TABLE `t_avis`
  MODIFY `id_avis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `t_avoir_avis`
--
ALTER TABLE `t_avoir_avis`
  MODIFY `id_avoir_avis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `t_avoir_genre`
--
ALTER TABLE `t_avoir_genre`
  MODIFY `id_avoir_genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `t_fichier`
--
ALTER TABLE `t_fichier`
  MODIFY `id_fichier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `t_genre`
--
ALTER TABLE `t_genre`
  MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Valeur unique du genre', AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `t_mail`
--
ALTER TABLE `t_mail`
  MODIFY `id_mail` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Valeur unique du mail', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `t_motdepasse`
--
ALTER TABLE `t_motdepasse`
  MODIFY `id_motDePasse` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Valeur unique du mot de passe', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `t_personne`
--
ALTER TABLE `t_personne`
  MODIFY `id_personne` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Valeur unique de la personne', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `t_pseudo`
--
ALTER TABLE `t_pseudo`
  MODIFY `id_pseudo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Valeur unique du pseudo', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `t_scan`
--
ALTER TABLE `t_scan`
  MODIFY `id_scan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Valeur unique du scan', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `t_souhaiter_lire`
--
ALTER TABLE `t_souhaiter_lire`
  MODIFY `id_souhaiter_lire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `t_telecharger`
--
ALTER TABLE `t_telecharger`
  MODIFY `id_telecharger` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `t_avoir_avis`
--
ALTER TABLE `t_avoir_avis`
  ADD CONSTRAINT `t_avoir_avis_ibfk_1` FOREIGN KEY (`fk_scan`) REFERENCES `t_scan` (`id_scan`),
  ADD CONSTRAINT `t_avoir_avis_ibfk_2` FOREIGN KEY (`fk_avis`) REFERENCES `t_avis` (`id_avis`);

--
-- Contraintes pour la table `t_avoir_genre`
--
ALTER TABLE `t_avoir_genre`
  ADD CONSTRAINT `t_avoir_genre_ibfk_1` FOREIGN KEY (`fk_scan`) REFERENCES `t_scan` (`id_scan`),
  ADD CONSTRAINT `t_avoir_genre_ibfk_2` FOREIGN KEY (`fk_genre`) REFERENCES `t_genre` (`id_genre`);

--
-- Contraintes pour la table `t_personne`
--
ALTER TABLE `t_personne`
  ADD CONSTRAINT `t_personne_ibfk_1` FOREIGN KEY (`fk_pseudo`) REFERENCES `t_pseudo` (`id_pseudo`),
  ADD CONSTRAINT `t_personne_ibfk_2` FOREIGN KEY (`fk_mail`) REFERENCES `t_mail` (`id_mail`),
  ADD CONSTRAINT `t_personne_ibfk_3` FOREIGN KEY (`fk_motDePasse`) REFERENCES `t_motdepasse` (`id_motDePasse`);

--
-- Contraintes pour la table `t_scan`
--
ALTER TABLE `t_scan`
  ADD CONSTRAINT `t_scan_ibfk_1` FOREIGN KEY (`fk_fichier`) REFERENCES `t_fichier` (`id_fichier`);

--
-- Contraintes pour la table `t_souhaiter_lire`
--
ALTER TABLE `t_souhaiter_lire`
  ADD CONSTRAINT `t_souhaiter_lire_ibfk_1` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_personne`),
  ADD CONSTRAINT `t_souhaiter_lire_ibfk_2` FOREIGN KEY (`fk_scan`) REFERENCES `t_scan` (`id_scan`);

--
-- Contraintes pour la table `t_telecharger`
--
ALTER TABLE `t_telecharger`
  ADD CONSTRAINT `t_telecharger_ibfk_1` FOREIGN KEY (`fk_personne`) REFERENCES `t_personne` (`id_personne`),
  ADD CONSTRAINT `t_telecharger_ibfk_2` FOREIGN KEY (`fk_scan`) REFERENCES `t_scan` (`id_scan`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
