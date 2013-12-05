--
-- INSERTAR DATOS DE EJEMPLO
--

--
-- Base de datos: `vidali1`
--
USE `vidali1`;

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `vdl_conver`
--

INSERT INTO `vdl_conver` (`conver_ref`) VALUES
(0),
(0);

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `vdl_friend_of`
--

INSERT INTO `vdl_friend_of` (`user1`, `user2`, `status`) VALUES
(1, 2, '1');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `vdl_group`
--

INSERT INTO `vdl_group` (`group_name`, `avatar_id`, `n_members`, `is_private`, `privacy_level`, `allow_ext_com`) VALUES
('Vidali', 'prof_def', 0, '\0', 'open', '1'),
('test', 'prof_def', 0, '#', 'close', '#');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `vdl_msg`
--

INSERT INTO `vdl_msg` (`id_msg`, `id_user`, `id_group`, `date_published`, `text`, `lat`, `lon`, `safe`) VALUES
(1, 1, 'Vidali', '2012-12-11 15:24:37', 'hola', '', '', 0),
(2, 2, 'Vidali', '2013-03-08 15:31:17', 'Testing', '', '', 0),
(3, 1, 'Vidali', '2013-03-10 20:55:21', 'asdf', '', '', 0),
(5, 1, 'Vidali', '2013-03-10 20:55:48', 'Holaa!!!', '', '', 0),
(6, 1, 'Vidali', '2013-03-10 21:00:47', '@test y #Hash', '', '', 0),
(7, 1, 'Vidali', '2013-03-10 21:05:57', 'Hola!', '', '', 0),
(8, 1, 'Vidali', '2013-03-10 21:08:22', 'asd', '', '', 0),
(10, 1, 'Vidali', '2013-03-10 21:14:36', 'ssss', '', '', 0),
(18, 1, 'Vidali', '2013-03-10 21:24:02', 'limpiando', '', '', 0),
(19, 1, 'Vidali', '2013-03-10 21:27:20', 'aaass', '', '', 0),
(20, 1, 'Vidali', '2013-03-10 21:28:30', 'asddvbn', '', '', 0),
(21, 1, 'Vidali', '2013-03-12 22:17:13', 'menu rulando!', '', '', 0),
(22, 1, 'Vidali', '2013-03-12 22:17:35', 'asd', '', '', 0),
(23, 1, 'Vidali', '2013-03-12 22:18:36', 'sdf', '', '', 0);

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `vdl_msg_conver`
--

INSERT INTO `vdl_msg_conver` (`conver_ref_id`, `id_msg`, `user_id`, `pm_msg`, `date_send`) VALUES
(0, 1, 1, 'asfgea', '2012-12-13 07:13:11'),
(0, 2, 2, 'asfweagw', '2012-12-29 09:24:09');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `vdl_trending`
--

INSERT INTO `vdl_trending` (`topic`, `count`) VALUES
('Hash', 1);

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `vdl_user`
--

INSERT INTO `vdl_user` (`id`, `email`, `nick`, `password`, `name`, `birthdate`, `sex`, `location`, `website`, `description`, `avatar_id`, `n_views`, `n_contacts`, `n_groups`, `session_key`, `session_id`, `privacy_level`, `mail_notify`, `color_theme`) VALUES
(1, 'cristo-mc@hotmail.com', 'cristomc', 'f42e022746368891b10d754c1bd9bcd9523531b1', 'Cristo', '1990-09-26', 'male', 'Tenerife', ' ', 'Hola!', 'prof_def', 0, 0, 0, '0', 'cfatrd9nm44nu9fl1jktte5el1', 'low', '\0', 'white'),
(2, 'test@test.com', 'test', '4028a0e356acc947fcd2bfbf00cef11e128d484a', 'test', '1953-12-16', 'female', 'test', ' ', 'test', 'prof_def', 0, 0, 0, '0', '0', 'low', '\0', 'white');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `vdl_u_belong`
--

INSERT INTO `vdl_u_belong` (`user_id`, `group_name`, `is_admin`) VALUES
(1, 'Vidali', '#'),
(2, 'Vidali', '\0'),
(2, 'test', '\0');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `vdl_u_conver`
--

INSERT INTO `vdl_u_conver` (`vdl_user_id`, `vdl_msg_conver_conver_ref`) VALUES
(1, 0),
(2, 0);
