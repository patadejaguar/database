SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE IF NOT EXISTS `audit_log` (
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `risk_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`value` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`value`, `name`) VALUES
(7, 'Gestión de Tecnica de Vulnerabilidades'),
(6, 'Gestión de datos sensibles'),
(5, 'Politica y Procedimiento'),
(4, 'Seguridad Física'),
(3, 'Vigilancia'),
(2, 'La Resistencia Ambiental'),
(1, 'Gestión de Acceso'),
(8, 'Gestión de Terceros');

-- --------------------------------------------------------

--
-- Table structure for table `close_reason`
--

CREATE TABLE IF NOT EXISTS `close_reason` (
`value` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `close_reason`
--

INSERT INTO `close_reason` (`value`, `name`) VALUES
(0, 'Rechazado'),
(1, 'Totalmente Mitigada'),
(2, 'Sistema Retirado'),
(3, 'Cancelado'),
(4, 'Demasiado Insignificante');

-- --------------------------------------------------------

--
-- Table structure for table `closures`
--

CREATE TABLE IF NOT EXISTS `closures` (
`id` int(11) NOT NULL,
  `risk_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `closure_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `close_reason` int(11) NOT NULL,
  `note` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`id` int(11) NOT NULL,
  `risk_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL,
  `comment` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `CVSS_scoring`
--

CREATE TABLE IF NOT EXISTS `CVSS_scoring` (
`id` int(11) NOT NULL,
  `metric_name` varchar(30) NOT NULL,
  `abrv_metric_name` varchar(3) NOT NULL,
  `metric_value` varchar(30) NOT NULL,
  `abrv_metric_value` varchar(3) NOT NULL,
  `numeric_value` float NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CVSS_scoring`
--

INSERT INTO `CVSS_scoring` (`id`, `metric_name`, `abrv_metric_name`, `metric_value`, `abrv_metric_value`, `numeric_value`) VALUES
(1, 'AccessComplexity', 'AC', 'Alto', 'H', 0.35),
(2, 'AccessComplexity', 'AC', 'Medio', 'M', 0.61),
(3, 'AccessComplexity', 'AC', 'Bajo', 'L', 0.71),
(4, 'AccessVector', 'AV', 'Local', 'L', 0.395),
(5, 'AccessVector', 'AV', 'Red Adyacente', 'A', 0.646),
(6, 'AccessVector', 'AV', 'Red', 'N', 1),
(7, 'Authentication', 'Au', 'Ninguno', 'N', 0.704),
(8, 'Authentication', 'Au', 'Instancia', 'S', 0.56),
(9, 'Authentication', 'Au', 'Multiples Instancias', 'M', 0.45),
(10, 'AvailabilityRequirement', 'AR', 'No definido', 'ND', 1),
(11, 'AvailabilityRequirement', 'AR', 'Bajo', 'L', 0.5),
(12, 'AvailabilityRequirement', 'AR', 'Medio', 'M', 1),
(13, 'AvailabilityRequirement', 'AR', 'Alto', 'H', 1.51),
(14, 'AvailImpact', 'A', 'Ninguno', 'N', 0),
(15, 'AvailImpact', 'A', 'Parcial', 'P', 0.275),
(16, 'AvailImpact', 'A', 'Completado', 'C', 0.66),
(17, 'CollateralDamagePotential', 'CDP', 'No definido', 'ND', 0),
(18, 'CollateralDamagePotential', 'CDP', 'Ninguno', 'N', 0),
(19, 'CollateralDamagePotential', 'CDP', 'BAjo (Baja Perdida)', 'L', 0.1),
(20, 'CollateralDamagePotential', 'CDP', 'Medio-Bajo', 'LM', 0.3),
(21, 'CollateralDamagePotential', 'CDP', 'Medio-Alto', 'MH', 0.4),
(22, 'CollateralDamagePotential', 'CDP', 'Alto', 'H', 0.5),
(23, 'ConfidentialityRequirement', 'CR', 'No definido', 'ND', 1),
(24, 'ConfidentialityRequirement', 'CR', 'Bajo', 'L', 0.5),
(25, 'ConfidentialityRequirement', 'CR', 'Medio', 'M', 1),
(26, 'ConfidentialityRequirement', 'CR', 'Alto', 'H', 1.51),
(27, 'ConfImpact', 'C', 'Ninguno', 'N', 0),
(28, 'ConfImpact', 'C', 'Parcial', 'P', 0.275),
(29, 'ConfImpact', 'C', 'Completado', 'C', 0.66),
(30, 'Exploitability', 'E', 'No definido', 'ND', 1),
(31, 'Exploitability', 'E', 'No comporbadas Estas Funciones', 'U', 0.85),
(32, 'Exploitability', 'E', 'Prueba de Concepto', 'POC', 0.9),
(33, 'Exploitability', 'E', 'Explotar Funciones Existentes', 'F', 0.95),
(34, 'Exploitability', 'E', 'Extendido', 'H', 1),
(35, 'IntegImpact', 'I', 'Ninguno', 'N', 0),
(36, 'IntegImpact', 'I', 'Parcial', 'P', 0.275),
(37, 'IntegImpact', 'I', 'Completado', 'C', 0.66),
(38, 'IntegrityRequirement', 'IR', 'No definido', 'ND', 1),
(39, 'IntegrityRequirement', 'IR', 'Bajo', 'L', 0.5),
(40, 'IntegrityRequirement', 'IR', 'Medio', 'M', 1),
(41, 'IntegrityRequirement', 'IR', 'Alto', 'H', 1.51),
(42, 'RemediationLevel', 'RL', 'No definido', 'ND', 1),
(43, 'RemediationLevel', 'RL', 'Arreglo', 'OF', 0.87),
(44, 'RemediationLevel', 'RL', 'Arreglo Temporal', 'TF', 0.9),
(45, 'RemediationLevel', 'RL', 'Solucion', 'W', 0.95),
(46, 'RemediationLevel', 'RL', 'No disponible', 'U', 1),
(47, 'ReportConfidence', 'RC', 'No definido', 'ND', 1),
(48, 'ReportConfidence', 'RC', 'Sin Confirmar', 'UC', 0.9),
(49, 'ReportConfidence', 'RC', 'No corroborada', 'UR', 0.95),
(50, 'ReportConfidence', 'RC', 'Confirmada', 'C', 1),
(51, 'TargetDistribution', 'TD', 'No definido', 'ND', 1),
(52, 'TargetDistribution', 'TD', 'Ninguno (0%)', 'N', 0),
(53, 'TargetDistribution', 'TD', 'Bajo (0-25%)', 'L', 0.25),
(54, 'TargetDistribution', 'TD', 'Medio (26-75%)', 'M', 0.75),
(55, 'TargetDistribution', 'TD', 'Alto (76-100%)', 'H', 1);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
`id` int(11) NOT NULL,
  `risk_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `unique_name` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `size` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL,
  `content` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `impact`
--

CREATE TABLE IF NOT EXISTS `impact` (
  `name` varchar(20) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `impact`
--

INSERT INTO `impact` (`name`, `value`) VALUES
('Insignificante', 1),
('Menor', 2),
('Moderado', 3),
('Mayor', 4),
('Extremo/Catastrofico', 5);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
`value` int(11) NOT NULL,
  `name` varchar(2) NOT NULL,
  `full` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`value`, `name`, `full`) VALUES
(1, 'en', 'English'),
(2, 'bp', 'Brazilian Portuguese'),
(3, 'es', 'Espanol');

-- --------------------------------------------------------

--
-- Table structure for table `likelihood`
--

CREATE TABLE IF NOT EXISTS `likelihood` (
  `name` varchar(20) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `likelihood`
--

INSERT INTO `likelihood` (`name`, `value`) VALUES
('Remota', 1),
('Improbable', 2),
('Creible', 3),
('Probable', 4),
('Casi Certero', 5);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
`value` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`value`, `name`) VALUES
(1, 'Todas las Locaciones');

-- --------------------------------------------------------

--
-- Table structure for table `mgmt_reviews`
--

CREATE TABLE IF NOT EXISTS `mgmt_reviews` (
`id` int(11) NOT NULL,
  `risk_id` int(11) NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `review` int(11) NOT NULL,
  `reviewer` int(11) NOT NULL,
  `next_step` int(11) NOT NULL,
  `comments` mediumtext NOT NULL,
  `next_review` varchar(10) NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mitigations`
--

CREATE TABLE IF NOT EXISTS `mitigations` (
`id` int(11) NOT NULL,
  `risk_id` int(11) NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `planning_strategy` int(11) NOT NULL,
  `mitigation_effort` int(11) NOT NULL,
  `current_solution` mediumtext NOT NULL,
  `security_requirements` mediumtext NOT NULL,
  `security_recommendations` mediumtext NOT NULL,
  `submitted_by` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mitigation_effort`
--

CREATE TABLE IF NOT EXISTS `mitigation_effort` (
`value` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mitigation_effort`
--

INSERT INTO `mitigation_effort` (`value`, `name`) VALUES
(1, 'Insignificante'),
(2, 'Menor'),
(3, 'Considerable'),
(4, 'Significante'),
(5, 'Excepcional');

-- --------------------------------------------------------

--
-- Table structure for table `next_step`
--

CREATE TABLE IF NOT EXISTS `next_step` (
`value` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `next_step`
--

INSERT INTO `next_step` (`value`, `name`) VALUES
(1, 'Aceptada Hasta Proxima Revision'),
(2, 'Considerado por Proyecto'),
(3, 'Presentar como un Problema de Produccion');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE IF NOT EXISTS `password_reset` (
  `username` varchar(20) NOT NULL,
  `token` varchar(20) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `planning_strategy`
--

CREATE TABLE IF NOT EXISTS `planning_strategy` (
`value` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `planning_strategy`
--

INSERT INTO `planning_strategy` (`value`, `name`) VALUES
(1, 'Investigar'),
(2, 'Acceptado'),
(3, 'Mitigado'),
(4, 'Ver');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
`value` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '999999',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`value`, `name`, `order`, `status`) VALUES
(0, 'Riesgo no Asignado', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `regulation`
--

CREATE TABLE IF NOT EXISTS `regulation` (
`value` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `regulation`
--

INSERT INTO `regulation` (`value`, `name`) VALUES
(1, 'PCI DSS'),
(2, 'Sarbanes-Oxley (SOX)'),
(3, 'HIPAA'),
(4, 'ISO 27001');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
`value` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`value`, `name`) VALUES
(1, 'Aprobar Riesgo'),
(2, 'Rechazar Riesgo y Cerca');

-- --------------------------------------------------------

--
-- Table structure for table `review_levels`
--

CREATE TABLE IF NOT EXISTS `review_levels` (
  `value` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
`id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `reference_id` varchar(20) NOT NULL DEFAULT '',
  `regulation` int(11) DEFAULT NULL,
  `control_number` varchar(20) DEFAULT NULL,
  `location` int(11) NOT NULL,
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
  `project_id` int(11) NOT NULL DEFAULT '0',
  `close_id` int(11) NOT NULL,
  `submitted_by` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `risk_levels`
--

CREATE TABLE IF NOT EXISTS `risk_levels` (
  `value` decimal(2,1) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `risk_levels`
--

INSERT INTO `risk_levels` (`value`, `name`) VALUES
(7.0, 'High'),
(4.0, 'Medium'),
(0.0, 'Low');

-- --------------------------------------------------------

--
-- Table structure for table `risk_models`
--

CREATE TABLE IF NOT EXISTS `risk_models` (
  `value` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `risk_models`
--

INSERT INTO `risk_models` (`value`, `name`) VALUES
(1, 'Probabilidad x Impacto + 2(Impacto)'),
(2, 'Probabilidad x Impacto + Impacto'),
(3, 'Probabilidad x Impacto'),
(4, 'Probabilidad x Impacto + Probabilidad'),
(5, 'Probabilidad x Impacto + 2(Probabilidad)');

-- --------------------------------------------------------

--
-- Table structure for table `risk_scoring`
--

CREATE TABLE IF NOT EXISTS `risk_scoring` (
  `id` int(11) NOT NULL,
  `scoring_method` int(11) NOT NULL,
  `calculated_risk` float NOT NULL,
  `CLASSIC_likelihood` float NOT NULL DEFAULT '5',
  `CLASSIC_impact` float NOT NULL DEFAULT '5',
  `CVSS_AccessVector` varchar(3) NOT NULL DEFAULT 'N',
  `CVSS_AccessComplexity` varchar(3) NOT NULL DEFAULT 'L',
  `CVSS_Authentication` varchar(3) NOT NULL DEFAULT 'N',
  `CVSS_ConfImpact` varchar(3) NOT NULL DEFAULT 'C',
  `CVSS_IntegImpact` varchar(3) NOT NULL DEFAULT 'C',
  `CVSS_AvailImpact` varchar(3) NOT NULL DEFAULT 'C',
  `CVSS_Exploitability` varchar(3) NOT NULL DEFAULT 'ND',
  `CVSS_RemediationLevel` varchar(3) NOT NULL DEFAULT 'ND',
  `CVSS_ReportConfidence` varchar(3) NOT NULL DEFAULT 'ND',
  `CVSS_CollateralDamagePotential` varchar(3) NOT NULL DEFAULT 'ND',
  `CVSS_TargetDistribution` varchar(3) NOT NULL DEFAULT 'ND',
  `CVSS_ConfidentialityRequirement` varchar(3) NOT NULL DEFAULT 'ND',
  `CVSS_IntegrityRequirement` varchar(3) NOT NULL DEFAULT 'ND',
  `CVSS_AvailabilityRequirement` varchar(3) NOT NULL DEFAULT 'ND',
  `DREAD_DamagePotential` int(11) DEFAULT '10',
  `DREAD_Reproducibility` int(11) DEFAULT '10',
  `DREAD_Exploitability` int(11) DEFAULT '10',
  `DREAD_AffectedUsers` int(11) DEFAULT '10',
  `DREAD_Discoverability` int(11) DEFAULT '10',
  `OWASP_SkillLevel` int(11) DEFAULT '10',
  `OWASP_Motive` int(11) DEFAULT '10',
  `OWASP_Opportunity` int(11) DEFAULT '10',
  `OWASP_Size` int(11) DEFAULT '10',
  `OWASP_EaseOfDiscovery` int(11) DEFAULT '10',
  `OWASP_EaseOfExploit` int(11) DEFAULT '10',
  `OWASP_Awareness` int(11) DEFAULT '10',
  `OWASP_IntrusionDetection` int(11) DEFAULT '10',
  `OWASP_LossOfConfidentiality` int(11) DEFAULT '10',
  `OWASP_LossOfIntegrity` int(11) DEFAULT '10',
  `OWASP_LossOfAvailability` int(11) DEFAULT '10',
  `OWASP_LossOfAccountability` int(11) DEFAULT '10',
  `OWASP_FinancialDamage` int(11) DEFAULT '10',
  `OWASP_ReputationDamage` int(11) DEFAULT '10',
  `OWASP_NonCompliance` int(11) DEFAULT '10',
  `OWASP_PrivacyViolation` int(11) DEFAULT '10',
  `Custom` float DEFAULT '10'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(32) NOT NULL,
  `access` int(10) unsigned DEFAULT NULL,
  `data` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `name` varchar(20) NOT NULL,
  `value` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`name`, `value`) VALUES
('risk_model', '3'),
('db_version', '20141013-001');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
`value` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`value`, `name`) VALUES
(1, 'Gestion de Rama'),
(2, 'Colaboracion'),
(3, 'Centro de Datos & Almacenamiento'),
(4, 'Base de datos'),
(5, 'Información de Seguridad'),
(6, 'Gestión de Sistemas IT'),
(7, 'Red'),
(8, 'Unix'),
(9, 'Sistemas Web'),
(10, 'Windows');

-- --------------------------------------------------------

--
-- Table structure for table `technology`
--

CREATE TABLE IF NOT EXISTS `technology` (
`value` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `technology`
--

INSERT INTO `technology` (`value`, `name`) VALUES
(1, 'Todos'),
(2, 'Anti-Virus'),
(3, 'Backups'),
(4, 'Blackberry'),
(5, 'Citrix'),
(6, 'Datacenter'),
(7, 'Mail Routing'),
(8, 'Live Collaboration'),
(9, 'Mesajeria'),
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
`value` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) NOT NULL DEFAULT 'simplerisk',
  `username` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `salt` varchar(20) DEFAULT NULL,
  `password` binary(60) NOT NULL,
  `last_login` datetime NOT NULL,
  `teams` varchar(200) NOT NULL DEFAULT 'none',
  `lang` varchar(2) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `review_high` tinyint(1) NOT NULL DEFAULT '0',
  `review_medium` tinyint(1) NOT NULL DEFAULT '0',
  `review_low` tinyint(1) NOT NULL DEFAULT '0',
  `submit_risks` tinyint(1) NOT NULL DEFAULT '0',
  `modify_risks` tinyint(1) NOT NULL DEFAULT '0',
  `plan_mitigations` tinyint(1) NOT NULL DEFAULT '0',
  `close_risks` tinyint(1) NOT NULL DEFAULT '1',
  `multi_factor` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`value`, `enabled`, `type`, `username`, `name`, `email`, `salt`, `password`, `last_login`, `teams`, `lang`, `admin`, `review_high`, `review_medium`, `review_low`, `submit_risks`, `modify_risks`, `plan_mitigations`, `close_risks`, `multi_factor`) VALUES
(1, 1, 'simplerisk', 'admin', 'Admin', 'user@example.com', 'sAbwTbIFywWKcheyQw9a', 0x2432612431352437623236303162343937396231616430333162326675716631586b65536134694e7873484b32377471355661326a4c687a6b536857, '2014-10-13 23:29:56', 'all', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`value`);

--
-- Indexes for table `close_reason`
--
ALTER TABLE `close_reason`
 ADD PRIMARY KEY (`value`);

--
-- Indexes for table `closures`
--
ALTER TABLE `closures`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `CVSS_scoring`
--
ALTER TABLE `CVSS_scoring`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
 ADD PRIMARY KEY (`value`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
 ADD PRIMARY KEY (`value`);

--
-- Indexes for table `mgmt_reviews`
--
ALTER TABLE `mgmt_reviews`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mitigations`
--
ALTER TABLE `mitigations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mitigation_effort`
--
ALTER TABLE `mitigation_effort`
 ADD PRIMARY KEY (`value`);

--
-- Indexes for table `next_step`
--
ALTER TABLE `next_step`
 ADD PRIMARY KEY (`value`);

--
-- Indexes for table `planning_strategy`
--
ALTER TABLE `planning_strategy`
 ADD PRIMARY KEY (`value`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
 ADD PRIMARY KEY (`value`);

--
-- Indexes for table `regulation`
--
ALTER TABLE `regulation`
 ADD PRIMARY KEY (`value`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
 ADD PRIMARY KEY (`value`);

--
-- Indexes for table `risks`
--
ALTER TABLE `risks`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `risk_scoring`
--
ALTER TABLE `risk_scoring`
 ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
 ADD PRIMARY KEY (`name`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
 ADD PRIMARY KEY (`value`);

--
-- Indexes for table `technology`
--
ALTER TABLE `technology`
 ADD PRIMARY KEY (`value`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`value`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `value` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `close_reason`
--
ALTER TABLE `close_reason`
MODIFY `value` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `closures`
--
ALTER TABLE `closures`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `CVSS_scoring`
--
ALTER TABLE `CVSS_scoring`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
MODIFY `value` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
MODIFY `value` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mgmt_reviews`
--
ALTER TABLE `mgmt_reviews`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mitigations`
--
ALTER TABLE `mitigations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mitigation_effort`
--
ALTER TABLE `mitigation_effort`
MODIFY `value` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `next_step`
--
ALTER TABLE `next_step`
MODIFY `value` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `planning_strategy`
--
ALTER TABLE `planning_strategy`
MODIFY `value` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
MODIFY `value` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `regulation`
--
ALTER TABLE `regulation`
MODIFY `value` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
MODIFY `value` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `risks`
--
ALTER TABLE `risks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
MODIFY `value` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `technology`
--
ALTER TABLE `technology`
MODIFY `value` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `value` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;