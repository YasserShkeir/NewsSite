-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2022 at 03:30 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `newsarticles`
--

CREATE TABLE `newsarticles` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `dateWritten` varchar(45) DEFAULT NULL,
  `dateUpdated` varchar(45) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `writer_id` int(11) NOT NULL,
  `imgSrc` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `newsarticles`
--

INSERT INTO `newsarticles` (`id`, `title`, `content`, `dateWritten`, `dateUpdated`, `publisher_id`, `writer_id`, `imgSrc`, `link`) VALUES
(0, 'A family in Tripoli loses 4 members in Syria ', 'The Mesto family in the northern city of Tripoli lost four members when a boat capsized off the coast of Syria in an illegal immigration attempt.\r\n \r\n\r\nThe father and his three children were on board, while the mother survived the ordeal.', '11/11/11', '11/21/11', 3, 2, 'https://www.lbcgroup.tv/newsimages/News-S-665024-637995187444663346.jpg', 'https://www.lbcgroup.tv/news/d/news-bulletin-reports/665058/a-family-in-tripoli-loses-4-members-in-syria-sinki/en'),
(0, 'Price of gasoline increases 29000 LBP', 'On Thursday September 22, 2022, the price of 95 and 98 octane fuel increased 29000 LBP each and that of diesel increased 44000 LBP, while the price of gas increased 13000 LBP.\r\n', 'Sep 22 2022', 'Sep 22 2022', 1, 3, 'https://www.lbcgroup.tv/newsimages/News-P-664890-637994307406531898.jpg', 'https://www.lbcgroup.tv/news/d/lebanon-news/664890/price-of-gasoline-increases-29000-lbp/en'),
(1, 'Mikati holds series of meetings before leavin', 'After delivering Lebanon\'s speech before the United Nations General Assembly, Caretaker Prime Minister Najib Mikati held a series of meetings before leaving New York.', '11/11/11', '11/21/11', 1, 1, 'https://www.lbcgroup.tv/newsimages/News-S-664980-637994668872466375.jpg', 'https://www.lbcgroup.tv/news/d/news-bulletin-reports/664980/mikati-holds-series-of-meetings-before-leaving-new/en'),
(4, 'Syrian Health Ministry says death toll of sin', 'The Syrian Ministry of Health announced on Friday that the death toll from the sinking boat carrying illegal immigrants off the Syrian coast had risen to 73, the highest number since the start of the illegal immigration from the crisis-ridden Lebanon.\r\nIn a statement, Health Minister Hassan al-Ghubash stated that \"in an inconclusive toll, the number of victims of the sinking boat has reached 73, while 20 people are receiving treatment at the al-Bassel Hospital (in Tartous).', '11/11/11', '11/21/11', 2, 3, 'https://www.lbcgroup.tv/newsimages/News-S-665055-637995294883872734.jpg', 'https://www.lbcgroup.tv/news/d/regional/665055/syrian-health-ministry-says-death-toll-of-sinking/en'),
(5, 'IMF criticizes Lebanon’s very slow progress o', 'The International Monetary Fund staff issued a statement in which it has accused the Lebanese officials and all those obstructing reforms, of slow implementation of the basic conditions required of Lebanon to reach a final agreement with it.\r\n', '11/11/11', '11/21/11', 3, 2, 'https://www.lbcgroup.tv/newsimages/News-S-664983-637994679340947687.jpg', 'https://www.lbcgroup.tv/news/d/news-bulletin-reports/664983/imf-criticizes-lebanons-very-slow-progress-on-refo/en');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `id` int(11) NOT NULL,
  `publisherName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`id`, `publisherName`) VALUES
(1, 'New York Times'),
(2, 'The961'),
(3, 'Dar Jaoude');

-- --------------------------------------------------------

--
-- Table structure for table `writer`
--

CREATE TABLE `writer` (
  `id` int(11) NOT NULL,
  `writerFname` varchar(45) DEFAULT NULL,
  `writerLname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `writer`
--

INSERT INTO `writer` (`id`, `writerFname`, `writerLname`) VALUES
(1, 'Ahmad', 'Abo Ahmade'),
(2, 'Nabiha', 'Fawze'),
(3, 'Georges', 'khabaz');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `newsarticles`
--
ALTER TABLE `newsarticles`
  ADD PRIMARY KEY (`id`,`writer_id`),
  ADD KEY `fk_newsArticles_publisher_idx` (`publisher_id`),
  ADD KEY `fk_newsArticles_writer1_idx` (`writer_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `writer`
--
ALTER TABLE `writer`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `newsarticles`
--
ALTER TABLE `newsarticles`
  ADD CONSTRAINT `fk_newsArticles_publisher` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_newsArticles_writer1` FOREIGN KEY (`writer_id`) REFERENCES `writer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
