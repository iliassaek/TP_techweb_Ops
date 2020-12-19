-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 19 déc. 2020 à 14:17
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `tptechnoweb`
--

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `value` float NOT NULL,
  `series_entity_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4mjfq3bub15dlc29h63cmkbqa` (`series_entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`id`, `comment`, `date`, `value`, `series_entity_id`) VALUES
(1, 'comment', '2019-12-28 00:00:00.000000', 2, 1),
(3, 'comment', '2019-12-28 00:00:00.000000', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `event_tag_entity_list`
--

DROP TABLE IF EXISTS `event_tag_entity_list`;
CREATE TABLE IF NOT EXISTS `event_tag_entity_list` (
  `event_id` bigint(20) NOT NULL,
  `tag_entity_list_id` bigint(20) NOT NULL,
  KEY `FK7tvsrnay7bpjsata457mfjyqy` (`tag_entity_list_id`),
  KEY `FKf0jj5avmj0rlf1wtlrmnh3swp` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `series`
--

DROP TABLE IF EXISTS `series`;
CREATE TABLE IF NOT EXISTS `series` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_hsvdwda43ces5322tlgcgl4sk` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `series`
--

INSERT INTO `series` (`id`, `description`, `title`) VALUES
(1, 'desc1', 'title1'),
(3, 'desc2', 'title2'),
(4, 'desc3', 'title3');

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `FK4mjfq3bub15dlc29h63cmkbqa` FOREIGN KEY (`series_entity_id`) REFERENCES `series` (`id`);

--
-- Contraintes pour la table `event_tag_entity_list`
--
ALTER TABLE `event_tag_entity_list`
  ADD CONSTRAINT `FK7tvsrnay7bpjsata457mfjyqy` FOREIGN KEY (`tag_entity_list_id`) REFERENCES `tag` (`id`),
  ADD CONSTRAINT `FKf0jj5avmj0rlf1wtlrmnh3swp` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
