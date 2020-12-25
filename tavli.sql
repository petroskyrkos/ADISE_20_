-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 25 Δεκ 2020 στις 17:50:32
-- Έκδοση διακομιστή: 10.1.36-MariaDB
-- Έκδοση PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `tavli`
--

DELIMITER $$
--
-- Διαδικασίες
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_board` ()  BEGIN
	replace into board select * from board_empty;
	update `players` set username=null, token=null;
	update `game_status` set `status`='not active', `p_turn`=null, `result`=null;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `move_piece` (`x1` TINYINT, `y1` TINYINT, `x2` TINYINT, `y2` TINYINT)  BEGIN
	declare  p, p_color char;
	
	select  piece, piece_color into p, p_color FROM `board` WHERE X=x1 AND Y=y1;
	
	update board
	set piece=p, piece_color=p_color
	where x=x2 and y=y2;
	
	UPDATE board
	SET piece=null,piece_color=null
	WHERE X=x1 AND Y=y1;
	
	update game_status set p_turn=if(p_color='W','B','W');
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test_move` ()  BEGIN
SELECT * FROM
board B1 INNER JOIN board B2
WHERE B1.x=2 AND B1.y=2
AND (B2.`piece_color` IS NULL OR B2.`piece_color`<>B1.`piece_color`)
AND B1.x=B2.x AND B1.y<B2.y AND (B2.y-B1.y)<=2 ;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board`
--

CREATE TABLE `board` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `b_color` enum('B','W') NOT NULL,
  `piece_color` enum('W','B') DEFAULT NULL,
  `plakomeno` enum('Y','N') DEFAULT NULL,
  `piece_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `board`
--

INSERT INTO `board` (`x`, `y`, `b_color`, `piece_color`, `plakomeno`, `piece_number`) VALUES
(1, 1, 'B', 'B', 'N', 2),
(1, 2, 'W', '', 'N', 0),
(1, 3, 'B', '', 'N', 0),
(1, 4, 'W', '', 'N', 0),
(1, 5, 'B', '', 'N', 0),
(1, 6, 'W', '', 'N', 0),
(2, 1, 'B', '', 'N', 0),
(2, 2, 'W', '', 'N', 0),
(2, 3, 'B', '', 'N', 0),
(2, 4, 'W', '', 'N', 0),
(2, 5, 'B', '', 'N', 0),
(2, 6, 'W', '', 'N', 0),
(3, 1, 'B', 'W', 'N', 2),
(3, 2, 'W', '', 'N', 0),
(3, 3, 'B', '', 'N', 0),
(3, 4, 'W', '', 'N', 0),
(3, 5, 'B', '', 'N', 0),
(3, 6, 'W', '', 'N', 0),
(4, 1, 'B', '', 'N', 0),
(4, 2, 'W', '', 'N', 0),
(4, 3, 'B', '', 'N', 0),
(4, 4, 'W', '', 'N', 0),
(4, 5, 'B', '', 'N', 0),
(4, 6, 'W', '', 'N', 0),
(1, 1, 'B', 'B', 'N', 2),
(1, 2, 'W', '', 'N', 0),
(1, 3, 'B', '', 'N', 0),
(1, 4, 'W', '', 'N', 0),
(1, 5, 'B', '', 'N', 0),
(1, 6, 'W', '', 'N', 0),
(2, 1, 'B', '', 'N', 0),
(2, 2, 'W', '', 'N', 0),
(2, 3, 'B', '', 'N', 0),
(2, 4, 'W', '', 'N', 0),
(2, 5, 'B', '', 'N', 0),
(2, 6, 'W', '', 'N', 0),
(3, 1, 'B', 'W', 'N', 2),
(3, 2, 'W', '', 'N', 0),
(3, 3, 'B', '', 'N', 0),
(3, 4, 'W', '', 'N', 0),
(3, 5, 'B', '', 'N', 0),
(3, 6, 'W', '', 'N', 0),
(4, 1, 'B', '', 'N', 0),
(4, 2, 'W', '', 'N', 0),
(4, 3, 'B', '', 'N', 0),
(4, 4, 'W', '', 'N', 0),
(4, 5, 'B', '', 'N', 0),
(4, 6, 'W', '', 'N', 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board_empty`
--

CREATE TABLE `board_empty` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `b_color` enum('B','W') NOT NULL,
  `piece_color` enum('W','B') DEFAULT NULL,
  `plakomeno` enum('Y','N') DEFAULT NULL,
  `piece_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `board_empty`
--

INSERT INTO `board_empty` (`x`, `y`, `b_color`, `piece_color`, `plakomeno`, `piece_number`) VALUES
(1, 1, 'B', 'B', 'N', 2),
(1, 2, 'W', '', 'N', 0),
(1, 3, 'B', '', 'N', 0),
(1, 4, 'W', '', 'N', 0),
(1, 5, 'B', '', 'N', 0),
(1, 6, 'W', '', 'N', 0),
(2, 1, 'B', '', 'N', 0),
(2, 2, 'W', '', 'N', 0),
(2, 3, 'B', '', 'N', 0),
(2, 4, 'W', '', 'N', 0),
(2, 5, 'B', '', 'N', 0),
(2, 6, 'W', '', 'N', 0),
(3, 1, 'B', 'W', 'N', 2),
(3, 2, 'W', '', 'N', 0),
(3, 3, 'B', '', 'N', 0),
(3, 4, 'W', '', 'N', 0),
(3, 5, 'B', '', 'N', 0),
(3, 6, 'W', '', 'N', 0),
(4, 1, 'B', '', 'N', 0),
(4, 2, 'W', '', 'N', 0),
(4, 3, 'B', '', 'N', 0),
(4, 4, 'W', '', 'N', 0),
(4, 5, 'B', '', 'N', 0),
(4, 6, 'W', '', 'N', 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `game_status`
--

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('W','B') DEFAULT NULL,
  `result` enum('B','W','D') DEFAULT NULL,
  `last_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `game_status`
--

INSERT INTO `game_status` (`status`, `p_turn`, `result`, `last_change`) VALUES
('aborded', NULL, 'B', '2020-12-25 12:23:16');

--
-- Δείκτες `game_status`
--
DELIMITER $$
CREATE TRIGGER `game_status_update` BEFORE UPDATE ON `game_status` FOR EACH ROW BEGIN
		set NEW.last_change = now();
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `players`
--

CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `piece_color` enum('B','W') NOT NULL,
  `token` varchar(32) DEFAULT NULL,
  `last_action` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `players`
--

INSERT INTO `players` (`username`, `piece_color`, `token`, `last_action`) VALUES
('petros', 'B', '82d6250c8ebd503564946c8b500c2c91', '2020-12-25 12:18:14'),
('athina', 'W', '077c4d34de149652b3767cb179436cbe', '2020-12-25 12:17:45');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`piece_color`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
