-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2013 a las 13:15:42
-- Versión del servidor: 5.5.32
-- Versión de PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `vidali1`
--
CREATE DATABASE IF NOT EXISTS `vidali1` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `vidali1`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_comment`
--

CREATE TABLE IF NOT EXISTS `vdl_comment` (
  `id_user` int(11) NOT NULL,
  `id_msg_ref` int(11) NOT NULL,
  `reply` varchar(140) COLLATE utf8_bin NOT NULL,
  `date_reply` datetime NOT NULL,
  PRIMARY KEY (`id_user`,`id_msg_ref`),
  KEY `fk_vdl_comment_vdl_msg1` (`id_msg_ref`),
  KEY `fk_vdl_comment_vdl_user1` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_config`
--

CREATE TABLE IF NOT EXISTS `vdl_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `config_value` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `vdl_config`
--

INSERT INTO `vdl_config` (`config_id`, `config_name`, `config_value`) VALUES
(9, 'STORAGE', 'SERVER'),
(6, 'PRIVACY', 'high'),
(5, 'REGISTER', 'public'),
(4, 'ADMIN', '1'),
(3, 'TITLE', 'Vidali - Red Social Libre'),
(2, 'THEME', 'Default'),
(1, 'LANG', 'ES'),
(10, 'BASEDIR', 'http://127.0.0.1/Vidali');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_conver`
--

CREATE TABLE IF NOT EXISTS `vdl_conver` (
  `conver_ref` int(11) NOT NULL,
  KEY `fk_vdl_msg_conver_vdl_conver1` (`conver_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_event`
--

CREATE TABLE IF NOT EXISTS `vdl_event` (
  `id` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_msg` int(11) NOT NULL,
  `event_tittle` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_tittle_UNIQUE` (`event_tittle`),
  KEY `fk_vdl_event_vdl_msg1` (`id_msg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_file`
--

CREATE TABLE IF NOT EXISTS `vdl_file` (
  `id` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_msg` int(11) DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `type` set('image','audio','video','other') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vdl_file_vdl_msg1` (`id_msg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_friend_of`
--

CREATE TABLE IF NOT EXISTS `vdl_friend_of` (
  `user1` int(11) NOT NULL,
  `user2` int(11) NOT NULL,
  `status` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`user1`,`user2`),
  KEY `fk_vdl_friend_of_vdl_user1` (`user1`),
  KEY `fk_vdl_friend_of_vdl_user2` (`user2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_group`
--

CREATE TABLE IF NOT EXISTS `vdl_group` (
  `group_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `avatar_id` varchar(45) COLLATE utf8_bin NOT NULL,
  `n_members` int(11) NOT NULL DEFAULT '0',
  `is_private` binary(1) NOT NULL,
  `privacy_level` set('open','close') COLLATE utf8_bin NOT NULL,
  `allow_ext_com` binary(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_msg`
--

CREATE TABLE IF NOT EXISTS `vdl_msg` (
  `id_msg` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_group` varchar(45) COLLATE utf8_bin NOT NULL,
  `date_published` datetime NOT NULL,
  `text` varchar(140) COLLATE utf8_bin NOT NULL,
  `lat` varchar(30) COLLATE utf8_bin NOT NULL,
  `lon` varchar(30) COLLATE utf8_bin NOT NULL,
  `safe` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_msg`,`id_user`,`id_group`,`date_published`),
  KEY `fk_vdl_msg_vdl_user1_idx` (`id_user`),
  KEY `fk_vdl_msg_vdl_group1_idx` (`id_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_msg_conver`
--

CREATE TABLE IF NOT EXISTS `vdl_msg_conver` (
  `conver_ref_id` int(11) NOT NULL,
  `id_msg` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `pm_msg` text NOT NULL,
  `date_send` datetime NOT NULL,
  PRIMARY KEY (`id_msg`,`conver_ref_id`,`date_send`),
  UNIQUE KEY `date_send_UNIQUE` (`date_send`),
  KEY `fk_vdl_msg_conver_vdl_user1_idx` (`user_id`),
  KEY `fk_vdl_msg_conver_vdl_conver1` (`conver_ref_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_notify`
--

CREATE TABLE IF NOT EXISTS `vdl_notify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_sender` int(11) NOT NULL,
  `msg_related` int(11) DEFAULT NULL,
  `type` int(10) unsigned NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_sender` (`user_sender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_places`
--

CREATE TABLE IF NOT EXISTS `vdl_places` (
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `lat` varchar(30) COLLATE utf8_bin NOT NULL,
  `lon` varchar(30) COLLATE utf8_bin NOT NULL,
  `description` varchar(140) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`email`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_token`
--

CREATE TABLE IF NOT EXISTS `vdl_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(45) COLLATE utf8_bin NOT NULL,
  `email` varchar(45) COLLATE utf8_bin NOT NULL,
  `ip` varchar(15) COLLATE utf8_bin NOT NULL,
  `expiration_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_tracking`
--

CREATE TABLE IF NOT EXISTS `vdl_tracking` (
  `user_id` int(11) NOT NULL,
  `lat` varchar(30) COLLATE utf8_bin NOT NULL,
  `lon` varchar(30) COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_trending`
--

CREATE TABLE IF NOT EXISTS `vdl_trending` (
  `topic` varchar(140) COLLATE utf8_bin NOT NULL,
  `count` int(10) NOT NULL,
  UNIQUE KEY `topic` (`topic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_user`
--

CREATE TABLE IF NOT EXISTS `vdl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `nick` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `sex` enum('male','female') COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(140) COLLATE utf8_unicode_ci NOT NULL,
  `avatar_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_views` int(10) unsigned DEFAULT '0',
  `n_contacts` int(10) unsigned DEFAULT '0',
  `n_groups` int(10) unsigned DEFAULT '0',
  `session_key` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `session_id` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `privacy_level` set('low','medium','high') COLLATE utf8_unicode_ci NOT NULL,
  `mail_notify` binary(1) NOT NULL,
  `color_theme` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nick_UNIQUE` (`nick`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_user_opt`
--

CREATE TABLE IF NOT EXISTS `vdl_user_opt` (
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `job` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `dni` varchar(9) COLLATE utf8_bin DEFAULT NULL,
  `phone` int(9) DEFAULT NULL,
  `mobile` int(9) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_u_belong`
--

CREATE TABLE IF NOT EXISTS `vdl_u_belong` (
  `user_id` int(11) NOT NULL,
  `group_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `is_admin` binary(1) NOT NULL,
  KEY `fk_vdl_u_belong_vdl_user1` (`user_id`),
  KEY `fk_vdl_u_belong_vdl_group1` (`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vdl_u_conver`
--

CREATE TABLE IF NOT EXISTS `vdl_u_conver` (
  `vdl_user_id` int(11) NOT NULL,
  `vdl_msg_conver_conver_ref` int(11) NOT NULL,
  PRIMARY KEY (`vdl_user_id`,`vdl_msg_conver_conver_ref`),
  KEY `fk_vdl_user_has_vdl_msg_conver_vdl_msg_conver1_idx` (`vdl_msg_conver_conver_ref`),
  KEY `fk_vdl_user_has_vdl_msg_conver_vdl_user1_idx` (`vdl_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `vdl_comment`
--
ALTER TABLE `vdl_comment`
  ADD CONSTRAINT `fk_vdl_comment_vdl_msg1` FOREIGN KEY (`id_msg_ref`) REFERENCES `vdl_msg` (`id_msg`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vdl_comment_vdl_user1` FOREIGN KEY (`id_user`) REFERENCES `vdl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vdl_event`
--
ALTER TABLE `vdl_event`
  ADD CONSTRAINT `fk_vdl_event_vdl_msg1` FOREIGN KEY (`id_msg`) REFERENCES `vdl_msg` (`id_msg`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vdl_file`
--
ALTER TABLE `vdl_file`
  ADD CONSTRAINT `fk_vdl_file_vdl_msg1` FOREIGN KEY (`id_msg`) REFERENCES `vdl_msg` (`id_msg`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vdl_friend_of`
--
ALTER TABLE `vdl_friend_of`
  ADD CONSTRAINT `fk_vdl_friend_of_vdl_user1` FOREIGN KEY (`user1`) REFERENCES `vdl_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vdl_friend_of_vdl_user2` FOREIGN KEY (`user2`) REFERENCES `vdl_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vdl_msg`
--
ALTER TABLE `vdl_msg`
  ADD CONSTRAINT `fk_vdl_msg_vdl_group1` FOREIGN KEY (`id_group`) REFERENCES `vdl_group` (`group_name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vdl_msg_vdl_user1` FOREIGN KEY (`id_user`) REFERENCES `vdl_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vdl_msg_conver`
--
ALTER TABLE `vdl_msg_conver`
  ADD CONSTRAINT `fk_vdl_msg_conver_vdl_conver1` FOREIGN KEY (`conver_ref_id`) REFERENCES `vdl_conver` (`conver_ref`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vdl_msg_conver_vdl_user1` FOREIGN KEY (`user_id`) REFERENCES `vdl_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vdl_places`
--
ALTER TABLE `vdl_places`
  ADD CONSTRAINT `fk_vdl_places_vdl_user1` FOREIGN KEY (`email`) REFERENCES `vdl_user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vdl_tracking`
--
ALTER TABLE `vdl_tracking`
  ADD CONSTRAINT `fk_vdl_tracking_vdl_user1` FOREIGN KEY (`user_id`) REFERENCES `vdl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vdl_user_opt`
--
ALTER TABLE `vdl_user_opt`
  ADD CONSTRAINT `fk_vdl_user_opt_vdl_user1` FOREIGN KEY (`email`) REFERENCES `vdl_user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vdl_u_belong`
--
ALTER TABLE `vdl_u_belong`
  ADD CONSTRAINT `fk_vdl_u_belong_vdl_user1` FOREIGN KEY (`user_id`) REFERENCES `vdl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vdl_u_belong_ibfk_1` FOREIGN KEY (`group_name`) REFERENCES `vdl_group` (`group_name`);

--
-- Filtros para la tabla `vdl_u_conver`
--
ALTER TABLE `vdl_u_conver`
  ADD CONSTRAINT `fk_vdl_user_has_vdl_msg_conver_vdl_msg_conver1` FOREIGN KEY (`vdl_msg_conver_conver_ref`) REFERENCES `vdl_conver` (`conver_ref`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vdl_u_conver_ibfk_1` FOREIGN KEY (`vdl_user_id`) REFERENCES `vdl_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
