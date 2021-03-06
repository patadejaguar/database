-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 01, 2013 at 11:23 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `simplerisk`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`value`, `name`) VALUES
(7, 'Technical Vulnerability Management'),
(6, 'Sensitive Data Management'),
(5, 'Policy and Procedure'),
(4, 'Physical Security'),
(3, 'Monitoring'),
(2, 'Environmental Resilience'),
(1, 'Access Management'),
(8, 'Third-Party Management');

-- --------------------------------------------------------

--
-- Table structure for table `close_reason`
--

CREATE TABLE IF NOT EXISTS `close_reason` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `close_reason`
--

INSERT INTO `close_reason` (`value`, `name`) VALUES
(1, 'Fully Mitigated'),
(2, 'System Retired'),
(3, 'Cancelled'),
(4, 'Too Insignificant');

-- --------------------------------------------------------

--
-- Table structure for table `closures`
--

CREATE TABLE IF NOT EXISTS `closures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) NOT NULL,
  `closure_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `close_reason` int(11) NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `closures`
--


-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `impact`
--

CREATE TABLE IF NOT EXISTS `impact` (
  `name` varchar(20) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `impact`
--

INSERT INTO `impact` (`name`, `value`) VALUES
('Insignificant', 1),
('Minor', 2),
('Moderate', 3),
('Major', 4),
('Extreme/Catastrophic', 5);

-- --------------------------------------------------------

--
-- Table structure for table `likelihood`
--

CREATE TABLE IF NOT EXISTS `likelihood` (
  `name` varchar(20) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likelihood`
--

INSERT INTO `likelihood` (`name`, `value`) VALUES
('Remote', 1),
('Unlikely', 2),
('Credible', 3),
('Likely', 4),
('Almost Certain', 5);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`value`, `name`) VALUES
(1, 'Austin, TX');

-- --------------------------------------------------------

--
-- Table structure for table `mgmt_reviews`
--

CREATE TABLE IF NOT EXISTS `mgmt_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `review` int(11) NOT NULL,
  `reviewer` int(11) NOT NULL,
  `next_step` int(11) NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mgmt_reviews`
--


-- --------------------------------------------------------

--
-- Table structure for table `mitigations`
--

CREATE TABLE IF NOT EXISTS `mitigations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `planning_strategy` int(11) NOT NULL,
  `mitigation_effort` int(11) NOT NULL,
  `current_solution` text NOT NULL,
  `security_requirements` text NOT NULL,
  `security_recommendations` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mitigations`
--


-- --------------------------------------------------------

--
-- Table structure for table `mitigation_effort`
--

CREATE TABLE IF NOT EXISTS `mitigation_effort` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mitigation_effort`
--

INSERT INTO `mitigation_effort` (`value`, `name`) VALUES
(1, 'Trivial'),
(2, 'Minor'),
(3, 'Considerable'),
(4, 'Significant'),
(5, 'Exceptional');

-- --------------------------------------------------------

--
-- Table structure for table `next_step`
--

CREATE TABLE IF NOT EXISTS `next_step` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `next_step`
--

INSERT INTO `next_step` (`value`, `name`) VALUES
(1, 'Accept Until Next Review'),
(2, 'Consider for Project'),
(3, 'Submit as a Production Issue');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE IF NOT EXISTS `password_reset` (
  `username` varchar(20) NOT NULL,
  `token` varchar(20) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `password_reset`
--


-- --------------------------------------------------------

--
-- Table structure for table `planning_strategy`
--

CREATE TABLE IF NOT EXISTS `planning_strategy` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `planning_strategy`
--

INSERT INTO `planning_strategy` (`value`, `name`) VALUES
(1, 'Research'),
(2, 'Accept'),
(3, 'Mitigate'),
(4, 'Watch');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`value`, `name`) VALUES
(1, 'Approve Risk'),
(2, 'Reject Risk');

-- --------------------------------------------------------

--
-- Table structure for table `review_levels`
--

CREATE TABLE IF NOT EXISTS `review_levels` (
  `value` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_levels`
--

INSERT INTO `review_levels` (`value`, `name`) VALUES
(90, 'High'),
(180, 'Medium'),
(360, 'Low');

-- --------------------------------------------------------

--
-- Table structure for table `risks`
--

CREATE TABLE IF NOT EXISTS `risks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `location` int(11) NOT NULL,
  `likelihood` int(11) NOT NULL,
  `impact` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `team` int(11) NOT NULL,
  `technology` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `manager` int(11) NOT NULL,
  `assessment` longtext NOT NULL,
  `notes` longtext NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mitigation_id` int(11) NOT NULL,
  `mgmt_review` int(11) NOT NULL,
  `close_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `risks`
--


-- --------------------------------------------------------

--
-- Table structure for table `risk_levels`
--

CREATE TABLE IF NOT EXISTS `risk_levels` (
  `value` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `risk_levels`
--

INSERT INTO `risk_levels` (`value`, `name`) VALUES
(20, 'High'),
(8, 'Medium'),
(4, 'Low');

-- --------------------------------------------------------

--
-- Table structure for table `risk_lookup`
--

CREATE TABLE IF NOT EXISTS `risk_lookup` (
  `impact` int(11) NOT NULL,
  `likelihood` int(11) NOT NULL,
  `risk` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `risk_lookup`
--

INSERT INTO `risk_lookup` (`impact`, `likelihood`, `risk`) VALUES
(1, 1, 2),
(1, 2, 3),
(1, 3, 4),
(1, 4, 5),
(1, 5, 6),
(2, 1, 4),
(2, 2, 6),
(2, 3, 8),
(2, 4, 10),
(2, 5, 12),
(3, 1, 6),
(3, 2, 9),
(3, 3, 12),
(3, 4, 15),
(3, 5, 18),
(4, 1, 8),
(4, 2, 12),
(4, 3, 16),
(4, 4, 20),
(4, 5, 24),
(5, 1, 10),
(5, 2, 15),
(5, 3, 20),
(5, 4, 25),
(5, 5, 30);

-- --------------------------------------------------------

--
-- Table structure for table `risk_models`
--

CREATE TABLE IF NOT EXISTS `risk_models` (
  `value` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `risk_models`
--

INSERT INTO `risk_models` (`value`, `name`) VALUES
(1, 'Likelihood x Impact + 2(Impact)'),
(2, 'Likelihood x Impact + Impact'),
(3, 'Likelihood x Impact'),
(4, 'Likelihood x Impact + Likelihood'),
(5, 'Likelihood x Impact + 2(Likelihood)');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `name` varchar(20) NOT NULL,
  `value` varchar(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`name`, `value`) VALUES
('risk_model', '2'),
('db_version', '20130501-001');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`value`, `name`) VALUES
(1, 'Branch Management'),
(2, 'Collaboration'),
(3, 'Data Center & Storage'),
(4, 'Database'),
(5, 'Information Security'),
(6, 'IT Systems Management'),
(7, 'Network'),
(8, 'Unix'),
(9, 'Web Systems'),
(10, 'Windows');

-- --------------------------------------------------------

--
-- Table structure for table `technology`
--

CREATE TABLE IF NOT EXISTS `technology` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `technology`
--

INSERT INTO `technology` (`value`, `name`) VALUES
(1, 'All'),
(2, 'Anti-Virus'),
(3, 'Backups'),
(4, 'Blackberry'),
(5, 'Citrix'),
(6, 'Datacenter'),
(7, 'Mail Routing'),
(8, 'Live Collaboration'),
(9, 'Messaging'),
(10, 'Mobile'),
(11, 'Network'),
(12, 'Power'),
(13, 'Remote Access'),
(14, 'SAN'),
(15, 'Telecom'),
(16, 'Unix'),
(17, 'VMWare'),
(18, 'Web'),
(19, 'Windows');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` binary(60) NOT NULL,
  `last_login` datetime NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `review_high` tinyint(1) NOT NULL,
  `review_medium` tinyint(1) NOT NULL,
  `review_low` tinyint(1) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`value`, `username`, `name`, `email`, `password`, `last_login`, `admin`, `review_high`, `review_medium`, `review_low`) VALUES
(1, 'admin', 'Admin', 'admin@yourcompany.com', '$2a$15$21232f297a57a5a743894Oi8eYwNRFyfL7SWQ8schB43FnU2qULWq', '0000-00-00 00:00:00', 1, 1, 1, 1);
