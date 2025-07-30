-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2025 at 09:37 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobsight`
--

-- --------------------------------------------------------

--
-- Table structure for table `deleted_jobs`
--

CREATE TABLE `deleted_jobs` (
  `id` int(11) NOT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `job_type` varchar(100) DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `social_media_link` varchar(255) DEFAULT NULL,
  `skills_required` text DEFAULT NULL,
  `education_required` text DEFAULT NULL,
  `job_posting_link` text DEFAULT NULL,
  `min_salary` float DEFAULT NULL,
  `max_salary` float DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_data_update`
--

CREATE TABLE `job_data_update` (
  `id` int(11) NOT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `job_type` varchar(100) DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `social_media_link` varchar(255) DEFAULT NULL,
  `skills_required` text DEFAULT NULL,
  `education_required` text DEFAULT NULL,
  `job_posting_link` text DEFAULT NULL,
  `min_salary` float DEFAULT NULL,
  `max_salary` float DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_data_update`
--

INSERT INTO `job_data_update` (`id`, `job_title`, `company_name`, `job_type`, `company_website`, `social_media_link`, `skills_required`, `education_required`, `job_posting_link`, `min_salary`, `max_salary`, `timestamp`) VALUES
(52, 'Quantum Computing Researcher', 'QTech Labs', 'Full-time', 'qtechlabs.com', 'none', 'Qiskit, Python, PyTorch', 'PhD Physics/CS', 'http://127.0.0.1:5000/rozee.pk/qtech-quantum', 300000, 500000, '2025-06-18 13:06:27'),
(54, 'Cloud Security Architect', 'SecureCloud (Arfa Tower)', 'Full-time', 'securecloud.pk', 'none', 'AWS Security, CISSP', 'MS Cybersecurity', 'securecloud.pk/careers', 250000, 400000, '2025-05-18 14:58:16'),
(55, 'Flutter Intern', 'AppWorks (Johar Town)', 'Internship', 'none', 'twitter.com/appworkspk', 'Dart Basics', 'BS CS Student', 'mustakbil.com/appworks-intern', 20000, 35000, '2025-05-18 14:58:16'),
(57, 'WordPress Designer', 'WPExperts (MM Alam Road)', 'Remote', 'wpexperts.pk', 'none', 'Elementor, CSS', 'Diploma Web Design', 'upwork.com/wpexperts-design', 40000, 75000, '2025-05-18 14:58:16'),
(58, 'Data Engineering Lead', 'DataHive (Tech Zone)', 'Full-time', 'datahive.io', 'fb.com/datahivepk', 'Spark, Hadoop', 'BS CS + 5yrs exp', 'datahive.io/jobs', 220000, 350000, '2025-05-18 14:58:16'),
(59, 'Game Sound Designer', 'SoundCraft (Ferozepur Road)', 'Contract', 'none', 'none', 'FL Studio, Wwise', 'Music Certification', 'mustakbil.com/soundcraft-jobs', 45000, 80000, '2025-05-18 14:58:16'),
(60, 'DevOps Trainer', 'SkillVertex (Bahria Town)', 'Part-time', 'skillvertex.edu.pk', 'twitter.com/skillvertex', 'Docker, Kubernetes', 'BS IT + Cert', 'http://127.0.0.1:5000/rozee.pk/devops-trainer', 90000, 150000, '2025-05-26 08:42:16'),
(61, 'Blockchain Legal Consultant', 'ChainLaw (Defence)', 'Full-time', 'chainlaw.pk', 'none', 'Smart Contract Law', 'LLB + Crypto Knowledge', 'linkedin.com/chainlaw-jobs', 150000, 250000, '2025-05-18 14:58:16'),
(62, 'IT Procurement Specialist', 'TechBuy (Liberty)', 'Full-time', 'techbuy.pk', 'none', 'Vendor Management', 'BS Supply Chain', 'techbuy.pk/careers', 80000, 130000, '2025-05-18 14:58:16'),
(63, 'Remote Technical Writer', 'DocuLabs (Garden Town)', 'Remote', 'doculabs.pk', 'none', 'Markdown, API Docs', 'BS English/CS', 'upwork.com/doculabs-writer', 50000, 90000, '2025-05-18 14:58:16'),
(64, 'Robotics Engineer', 'RoboMinati (UET)', 'Full-time', 'robominati.com', 'linkedin.com/robominati', 'ROS, Embedded C++', 'BS Mechatronics', 'robominati.com/jobs', 170000, 260000, '2025-05-18 14:58:16'),
(65, 'FinTech Developer', 'PayInnovate (DHA Phase 6)', 'Full-time', 'payinnovate.pk', 'twitter.com/payinnovate', 'Blockchain, APIs CSS', 'BS CS/Finance', 'https://rozee.pk/payinnovate-dev', 160000, 240000, '2025-05-26 11:05:32'),
(66, 'SEO Analyst', 'DigitalHive (Model Town)', 'Full-time', 'none', 'fb.com/digitalhivepk', 'Ahrefs, SEMrush', 'none', 'mustakbil.com/digitalhive-seo', 35000, 65000, '2025-05-18 14:58:16'),
(67, 'Embedded Systems Intern', 'ChipCraft (Punjab Uni)', 'Internship', 'chipcraft.edu.pk', 'none', 'C, RTOS Basics', 'Engineering Student', 'linkedin.com/chipcraft-intern', 18000, 30000, '2025-05-18 14:58:16'),
(68, 'IT Governance Manager', 'TechGov (Cantt)', 'Full-time', 'techgov.pk', 'none', 'COBIT, ITIL', 'MBA IT Management', 'techgov.pk/careers', 200000, 320000, '2025-05-18 14:58:16'),
(69, 'Freelance 3D Artist', 'PolyMakers (Gulberg III)', 'Remote', 'polymakers.com', 'behance.net/polymakers', 'Blender, Maya', 'Portfolio Only', 'fiverr.com/polymakers', 0, 0, '2025-05-18 14:58:16'),
(70, 'Network Security Engineer', 'NetShield (Lahore Tech Park)', 'Full-time', 'netshield.pk', 'none', 'Firewalls, VPN', 'BS Networking', 'netshield.pk/jobs', 140000, 220000, '2025-05-18 14:58:16'),
(71, 'Python Django Developer', 'CodeBakers (Johar Town)', 'Full-time', 'codebakers.io', 'twitter.com/codebakers', 'Django REST, PostgreSQL', 'BS CS/SE', 'rozee.pk/codebakers-dev', 100000, 170000, '2025-05-18 14:58:16'),
(72, 'Quantum Computing Researcher', 'QTech Labs (DHA Phase 3)', 'Full-time', 'qtechlabs.com', 'none', 'Qiskit, Python', 'PhD Physics/CS', 'rozee.pk/qtech-quantum', 300000, 500000, '2025-05-18 15:14:57'),
(73, 'AR/VR Content Creator', 'XR Studios (Gulberg)', 'Part-time', 'xrstudiospk.com', 'instagram.com/xrstudiospk', 'Unity3D, Blender', 'none', 'linkedin.com/xr-studios-jobs', 55000, 95000, '2025-05-18 15:14:57'),
(74, 'Cloud Security Architect', 'SecureCloud (Arfa Tower)', 'Full-time', 'securecloud.pk', 'none', 'AWS Security, CISSP', 'MS Cybersecurity', 'securecloud.pk/careers', 250000, 400000, '2025-05-18 15:14:57'),
(75, 'Flutter Intern', 'AppWorks (Johar Town)', 'Internship', 'none', 'twitter.com/appworkspk', 'Dart Basics', 'BS CS Student', 'mustakbil.com/appworks-intern', 20000, 35000, '2025-05-18 15:14:57'),
(76, 'AI Ethics Specialist', 'EthicalAI (LUMS)', 'Full-time', 'ethicalai.org', 'linkedin.com/ethicalai', 'AI Governance', 'MS Philosophy/CS', 'rozee.pk/ai-ethics-spec', 180000, 280000, '2025-05-18 15:14:57'),
(77, 'WordPress Designer', 'WPExperts (MM Alam Road)', 'Remote', 'wpexperts.pk', 'none', 'Elementor, CSS', 'Diploma Web Design', 'upwork.com/wpexperts-design', 40000, 75000, '2025-05-18 15:14:57'),
(78, 'Data Engineering Lead', 'DataHive (Tech Zone)', 'Full-time', 'datahive.io', 'fb.com/datahivepk', 'Spark, Hadoop', 'BS CS + 5yrs exp', 'datahive.io/jobs', 220000, 350000, '2025-05-18 15:14:57'),
(79, 'Game Sound Designer', 'SoundCraft (Ferozepur Road)', 'Contract', 'none', 'none', 'FL Studio, Wwise', 'Music Certification', 'mustakbil.com/soundcraft-jobs', 45000, 80000, '2025-05-18 15:14:57'),
(80, 'DevOps Trainer', 'SkillVertex (Bahria Town)', 'Part-time', 'skillvertex.edu.pk', 'twitter.com/skillvertex', 'Docker, Kubernetes', 'BS IT + Cert', 'rozee.pk/devops-trainer', 90000, 150000, '2025-05-18 15:14:57'),
(81, 'Blockchain Legal Consultant', 'ChainLaw (Defence)', 'Full-time', 'chainlaw.pk', 'none', 'Smart Contract Law', 'LLB + Crypto Knowledge', 'linkedin.com/chainlaw-jobs', 150000, 250000, '2025-05-18 15:14:57'),
(82, 'IT Procurement Specialist', 'TechBuy (Liberty)', 'Full-time', 'techbuy.pk', 'none', 'Vendor Management', 'BS Supply Chain', 'techbuy.pk/careers', 80000, 130000, '2025-05-18 15:14:57'),
(83, 'Remote Technical Writer', 'DocuLabs (Garden Town)', 'Remote', 'doculabs.pk', 'none', 'Markdown, API Docs', 'BS English/CS', 'upwork.com/doculabs-writer', 50000, 90000, '2025-05-18 15:14:57'),
(84, 'Robotics Engineer', 'RoboMinati (UET)', 'Full-time', 'robominati.com', 'linkedin.com/robominati', 'ROS, Embedded C++', 'BS Mechatronics', 'robominati.com/jobs', 170000, 260000, '2025-05-18 15:14:57'),
(86, 'SEO Analyst', 'DigitalHive (Model Town)', 'Full-time', 'none', 'fb.com/digitalhivepk', 'Ahrefs, SEMrush', 'none', 'mustakbil.com/digitalhive-seo', 35000, 65000, '2025-05-18 15:14:57'),
(87, 'Embedded Systems Intern', 'ChipCraft (Punjab Uni)', 'Internship', 'chipcraft.edu.pk', 'none', 'C, RTOS Basics', 'Engineering Student', 'linkedin.com/chipcraft-intern', 18000, 30000, '2025-05-18 15:14:57'),
(88, 'IT Governance Manager', 'TechGov (Cantt)', 'Full-time', 'techgov.pk', 'none', 'COBIT, ITIL', 'MBA IT Management', 'techgov.pk/careers', 200000, 320000, '2025-05-18 15:14:57'),
(90, 'Network Security Engineer', 'NetShield (Lahore Tech Park)', 'Full-time', 'netshield.pk', 'none', 'Firewalls, VPN', 'BS Networking', 'netshield.pk/jobs', 140000, 220000, '2025-05-18 15:14:57'),
(91, 'Python Django Developer', 'CodeBakers (Johar Town)', 'Full-time', 'codebakers.io', 'twitter.com/codebakers', 'Django REST, PostgreSQL', 'BS CS/SE', 'rozee.pk/codebakers-dev', 100000, 170000, '2025-05-18 15:14:57'),
(92, 'Graphic Designing', 'olx', 'Remote', 'https://olx.com.pk', '', 'Illustrator, Canva, Photoshop', 'none', 'https://www.olx.com.pk/item/conference-table-meeting-table-iid-1083881514', 10000, 25000, '2025-05-19 09:37:34'),
(94, 'Graphic Designing', 'olx', 'Internship', 'https://olx.com.pk', '', 'Illustrator, Canva, Photoshop', 'none', 'https://www.olx.com.pk/item/conference-table-meeting-table-iid-1083881514', 10000, 25000, '2025-05-19 09:46:28'),
(95, 'It Manager', 'Daraz Mall', 'Internship', 'https://daraz.pk', '', 'It, Cyber, Network', 'BS CS', 'https://www.daraz.pk/products/quality-backpack-bag-for-school-laptop-college-university-both-for-boys-and-girls-i417072938-s3172864810.html?', 20000, 0, '2025-05-19 10:04:07'),
(96, 'AI Product Manager', 'AInnovate (DHA Phase 5)', 'Full-time', 'ainnovate.ai', 'linkedin.com/ainnovate', 'ML Lifecycle, Scrum', 'MBA + Tech Background', 'ainnovate.ai/careers', 280000, 420000, '2025-05-19 10:30:55'),
(97, 'Game QA Tester', 'PixelPlay (Ferozepur Road)', 'Internship', 'none', 'twitter.com/pixelplaypk', 'Bug Reporting', 'none', 'rozee.pk/pixelplay-qa', 35000, 60000, '2025-05-19 10:30:55'),
(98, 'Remote React Dev', 'CodeHive (Gulberg)', 'Remote', 'codehive.dev', 'none', 'React, Redux', 'BS CS/SE', 'upwork.com/codehive-react', 120000, 200000, '2025-05-19 10:30:55'),
(99, 'IoT Engineer', 'ConnectThings (Arfa Tower)', 'Full-time', 'connectthings.pk', 'fb.com/connectthings', 'Raspberry Pi, MQTT', 'BS Electronics', 'linkedin.com/connectthings-jobs', 150000, 230000, '2025-05-19 10:30:55'),
(100, 'Freelance Illustrator', 'ArtForTech (MM Alam Road)', 'Contract', 'none', 'instagram.com/artfortech', 'Procreate, Adobe Fresco', 'Portfolio Only', 'fiverr.com/artfortech', 0, 0, '2025-05-19 10:30:55'),
(101, 'Data Governance Analyst', 'DataGuard (Bahria Town)', 'Full-time', 'dataguard.pk', 'none', 'SQL, GDPR', 'BS Data Science', 'mustakbil.com/dataguard', 130000, 210000, '2025-05-19 10:30:55'),
(102, 'Kotlin Developer', 'AndroidLabs (Johar Town)', 'Full-time', 'androidlabs.com', 'twitter.com/androidlabspk', 'Android SDK', 'BS CS/SE', 'androidlabs.com/jobs', 110000, 180000, '2025-05-19 10:30:55'),
(103, 'Cloud Intern', 'CloudSeed (Tech Zone)', 'Internship', 'cloudseed.io', 'none', 'AWS Fundamentals', 'CS Student', 'rozee.pk/cloudseed-intern', 22000, 38000, '2025-05-19 10:30:55'),
(104, 'Tech Journalist', 'TechBeatPK (Garden Town)', 'Part-time', 'techbeat.pk', 'fb.com/techbeatpk', 'Writing, Research', 'Journalism Degree', 'linkedin.com/techbeat-jobs', 45000, 75000, '2025-05-19 10:30:55'),
(105, 'Rust Developer', 'SafeCode (DHA Phase 4)', 'Full-time', 'safecode.io', 'none', 'Blockchain, WASM', 'BS CS + Rust Exp', 'safecode.io/careers', 180000, 260000, '2025-05-19 10:30:55'),
(106, 'IT Auditor', 'AuditPro (Model Town)', 'Full-time', 'auditpro.pk', 'none', 'SOX, Risk Mgmt', 'BS Accounting/IT', 'mustakbil.com/auditpro', 95000, 160000, '2025-05-19 10:30:55'),
(107, 'AR/VR Intern', 'RealityLabs (UET)', 'Internship', 'realitylabs.pk', 'none', 'Unity Basics', 'Engineering Student', 'rozee.pk/realitylabs-intern', 18000, 32000, '2025-05-19 10:30:55'),
(108, 'FinTech UX Designer', 'PayUX (Defence)', 'Full-time', 'payux.design', 'behance.net/payux', 'Figma, Prototyping', 'BS Design', 'linkedin.com/payux-jobs', 140000, 220000, '2025-05-19 10:30:55'),
(109, 'Remote SQL DBA', 'DataFort (Gulberg III)', 'Remote', 'datafort.com', 'none', 'MySQL, PostgreSQL', 'BS DBA', 'upwork.com/datafort-dba', 90000, 150000, '2025-05-19 10:30:55'),
(110, '5G Network Engineer', 'Link5G (Lahore Tech Park)', 'Full-time', 'link5g.pk', 'twitter.com/link5gpk', 'Network Slicing', 'BS Telecom', 'link5g.pk/careers', 170000, 250000, '2025-05-19 10:30:55'),
(111, 'Freelance Web Scraper', 'ScrapeNinja (Online)', 'Contract', 'none', 'none', 'Python, BeautifulSoup', 'none', 'fiverr.com/scrapeninja', 30000, 55000, '2025-05-19 10:30:55'),
(112, 'AI Trainer', 'ModelTutors (DHA Phase 6)', 'Part-time', 'modeltutors.com', 'none', 'LLM Fine-Tuning', 'BS CS/AI', 'mustakbil.com/modeltutors', 65000, 110000, '2025-05-19 10:30:55'),
(113, 'IT Procurement Intern', 'TechSource (Liberty)', 'Internship', 'none', 'none', 'Vendor Research', 'Business Student', 'rozee.pk/techsource-intern', 15000, 25000, '2025-05-19 10:30:55'),
(114, 'Game Narrative Designer', 'StoryGames (Gulberg)', 'Full-time', 'storygames.pk', 'twitter.com/storygamespk', 'Creative Writing', 'BA English/Literature', 'linkedin.com/storygames-jobs', 80000, 130000, '2025-05-19 10:30:55'),
(115, 'Edge Computing Dev', 'EdgeNova (Arfa Tower)', 'Full-time', 'edgenova.tech', 'none', 'Kubernetes, IoT', 'MS Distributed Systems', 'edgenova.tech/careers', 200000, 320000, '2025-05-19 10:30:55'),
(116, 'Senior IT Manager', 'Aliexpress', 'Part-time', 'https://www.aliexpress.com/', '', 'It, Cyber, Network', 'BS CS', 'https://www.aliexpress.com/item/1005007288617305.html?spm=a2g0o.tm1000009216.d0.1.3107474cuGJzBJ&sourceType=562&pvid=cb255100-ccd7-46f9-8f0d-387141e542b9&pdp_ext_f=%7B%22ship_from%22:%22CN%22,%22sku_id%22:%2212000040077778919%22%7D&scm=1007.28480.425796.0&scm-url=1007.28480.425796.0&scm_id=1007.28480.425796.0&pdp_npi=4%40dis%21PKR%21PKR%203%2C198%21PKR%201%2C759%21%21%2111.33%216.23%21%40213ba0c517478481199358754e1ea8%2112000040077778919%21gsd%21PK%212821401764%21X&channel=sd&aecmd=true', 40000, 85000, '2025-05-21 22:22:38'),
(117, 'AI Research Scientist', 'NeuralNet (DHA Phase 7)', 'Full-time', 'neuralnet.ai', 'linkedin.com/neuralnetpk', 'Deep Learning, PyTorch', 'MS/PhD AI/CS', 'neuralnet.ai/careers', 300000, 450000, '2025-05-22 08:51:06'),
(118, 'Mobile Game Developer', 'GameForge (Mall Road)', 'Full-time', 'gameforge.pk', 'twitter.com/gameforgepk', 'Unity, C#', 'BS CS/SE', 'rozee.pk/gameforge-dev', 80000, 140000, '2025-05-22 08:51:06'),
(119, 'Remote Backend Dev', 'CloudCore (Gulberg II)', 'Remote', 'cloudcore.dev', 'none', 'Node.js, MongoDB', 'BS CS/SE', 'upwork.com/cloudcore-backend', 130000, 220000, '2025-05-22 08:51:06'),
(120, 'IoT Firmware Engineer', 'SmartLink (Tech City)', 'Full-time', 'smartlink.pk', 'fb.com/smartlinkpk', 'Embedded C, RTOS', 'BS Electronics', 'linkedin.com/smartlink-jobs', 160000, 250000, '2025-05-22 08:51:06'),
(121, 'Freelance UI Designer', 'DesignWave (Model Town)', 'Contract', 'none', 'instagram.com/designwavepk', 'Figma, Adobe XD', 'Portfolio Only', 'fiverr.com/designwave', 0, 0, '2025-05-22 08:51:06'),
(122, 'Data Analyst', 'InsightPeak (Bahria Town)', 'Full-time', 'insightpeak.pk', 'none', 'Python, Power BI', 'BS Data Science', 'mustakbil.com/insightpeak', 100000, 180000, '2025-05-22 08:51:06'),
(123, 'Android Developer', 'MobileTrend (Johar Town)', 'Full-time', 'mobiletrend.pk', 'twitter.com/mobiletrendpk', 'Kotlin, Jetpack Compose', 'BS CS/SE', 'mobiletrend.pk/jobs', 120000, 200000, '2025-05-22 08:51:06'),
(124, 'Cloud Security Intern', 'SecureCloud (Arfa Tower)', 'Internship', 'securecloud.io', 'none', 'AWS, Cybersecurity Basics', 'CS Student', 'rozee.pk/securecloud-intern', 20000, 35000, '2025-05-22 08:51:06'),
(125, 'Tech Content Writer', 'TechVibe (Garden Town)', 'Part-time', 'techvibe.pk', 'fb.com/techvibepk', 'SEO, Technical Writing', 'BA English/Journalism', 'linkedin.com/techvibe-jobs', 50000, 90000, '2025-05-22 08:51:06'),
(126, 'Blockchain Developer', 'ChainWorks (DHA Phase 3)', 'Full-time', 'chainworks.io', 'none', 'Solidity, Ethereum', 'BS CS + Blockchain Exp', 'chainworks.io/careers', 200000, 300000, '2025-05-22 08:51:06'),
(127, 'IT Risk Analyst', 'SafeNet (Liberty Market)', 'Full-time', 'safenet.pk', 'none', 'Risk Assessment, ISO 27001', 'BS IT/Accounting', 'mustakbil.com/safenet', 90000, 150000, '2025-05-22 08:51:06'),
(128, 'AR Developer Intern', 'VisionLabs (UET Campus)', 'Internship', 'visionlabs.pk', 'none', 'Unity, ARKit', 'Engineering Student', 'rozee.pk/visionlabs-intern', 15000, 30000, '2025-05-22 08:51:06'),
(129, 'UX Researcher', 'UserFirst (Defence)', 'Full-time', 'userfirst.design', 'behance.net/userfirstpk', 'User Testing, Miro', 'BS Design/Psychology', 'linkedin.com/userfirst-jobs', 140000, 230000, '2025-05-22 08:51:06'),
(130, 'Remote Data Engineer', 'DataStream (Gulberg III)', 'Remote', 'datastream.pk', 'none', 'Spark, Hadoop', 'BS CS/Data Science', 'upwork.com/datastream-engineer', 110000, 190000, '2025-05-22 08:51:06'),
(131, 'Network Architect', 'NetCore (Lahore Tech Park)', 'Full-time', 'netcore.pk', 'twitter.com/netcorepk', 'SDN, Cisco', 'BS Telecom', 'netcore.pk/careers', 180000, 270000, '2025-05-22 08:51:06'),
(132, 'Freelance Data Scraper', 'WebExtract (Online)', 'Contract', 'none', 'none', 'Python, Scrapy', 'none', 'fiverr.com/webextract', 35000, 60000, '2025-05-22 08:51:06'),
(133, 'ML Ops Engineer', 'AIForge (DHA Phase 6)', 'Full-time', 'aiforge.ai', 'none', 'Docker, Kubeflow', 'BS CS/AI', 'aiforge.ai/careers', 170000, 260000, '2025-05-22 08:51:06'),
(134, 'Procurement Assistant', 'TechBuy (Ferozepur Road)', 'Internship', 'none', 'none', 'Vendor Mgmt, Excel', 'Business Student', 'rozee.pk/techbuy-intern', 18000, 28000, '2025-05-22 08:51:06'),
(135, 'Game Level Designer', 'PlayCraft (Gulberg)', 'Full-time', 'playcraft.pk', 'twitter.com/playcraftpk', 'Level Design, Unreal Engine', 'BA Game Design', 'linkedin.com/playcraft-jobs', 90000, 150000, '2025-05-22 08:51:06'),
(136, 'DevOps Engineer', 'InfraTech (Arfa Tower)', 'Full-time', 'infratech.pk', 'none', 'Terraform, CI/CD', 'MS CS/Systems', 'infratech.pk/careers', 200000, 330000, '2025-05-22 08:51:06'),
(141, 'AI Content Writer', 'TechWords (Gulberg)', 'Full-time', 'none', 'fb.com/techwordspk', 'GPT-4 Prompting', 'BA English', 'linkedin.com/techwords-jobs', 40000, 70000, '2025-05-25 17:08:36'),
(142, 'Blockchain Architect', 'ChainNexus (DHA Phase 6)', 'Full-time', 'chainnexus.io', 'none', 'Solidity, DeFi', 'MS Blockchain', 'chainnexus.io/careers', 300000, 450000, '2025-05-25 17:08:36'),
(143, 'Game Physics Programmer', 'GravityLabs (Tech Zone)', 'Full-time', 'gravitylabs.pk', 'twitter.com/gravitylabspk', 'C++, Unity Physics', 'BS Game Dev', 'rozee.pk/gravitylabs', 180000, 260000, '2025-05-25 17:08:36'),
(144, 'Cloud Sales Engineer', 'CloudScale (MM Alam Road)', 'Full-time', 'cloudscale.pk', 'linkedin.com/cloudscale', 'AWS/Azure Sales', 'BS CS/Marketing', 'cloudscale.pk/jobs', 120000, 200000, '2025-05-25 17:08:36'),
(145, 'AR/VR Animator', 'XRAnimations (Garden Town)', 'Contract', 'none', 'behance.net/xranimations', 'Maya, Blender', 'Art Diploma', 'fiverr.com/xr-animator', 65000, 110000, '2025-05-25 17:08:36'),
(146, 'Data Privacy Officer', 'DataGuard (Defence)', 'Full-time', 'dataguard.pk', 'none', 'GDPR, HIPAA', 'LLB + Tech Background', 'mustakbil.com/dataguard-dpo', 160000, 240000, '2025-05-25 17:08:36'),
(147, 'Embedded Linux Dev', 'LinuxEmbed (UET)', 'Full-time', 'linuxembed.com.pk', 'none', 'Yocto, RTOS', 'BS Electronics', 'linkedin.com/linuxembed-jobs', 140000, 220000, '2025-05-25 17:08:36'),
(148, 'Freelance SEO Expert', 'SEOMasters (Online)', 'Remote', 'none', 'twitter.com/seomasterspk', 'Ahrefs, SEMrush', 'Certifications Accepted', 'upwork.com/seo-masters', 50000, 90000, '2025-05-25 17:08:36'),
(149, '5G Test Engineer', 'TelcoLabs (Lahore Tech Park)', 'Full-time', 'telcolabs.pk', 'fb.com/telcolabspk', 'Network Testing', 'BS Telecom', 'telcolabs.pk/careers', 130000, 210000, '2025-05-25 17:08:36'),
(150, 'NFT Artist', 'CryptoArtPK (Gulberg III)', 'Contract', 'none', 'instagram.com/cryptoartpk', 'Digital Art', 'Portfolio Only', 'fiverr.com/cryptoartpk', 0, 0, '2025-05-25 17:08:36'),
(151, 'IT Procurement Manager', 'TechSource (Main Boulevard)', 'Full-time', 'techsource.pk', 'none', 'Vendor Negotiation', 'MBA Supply Chain', 'rozee.pk/techsource-procurement', 150000, 230000, '2025-05-25 17:08:36'),
(152, 'Robotics Instructor', 'RoboEdu (Punjab Uni)', 'Part-time', 'roboedu.pk', 'none', 'Arduino, ROS', 'Engineering Degree', 'mustakbil.com/roboedu', 80000, 140000, '2025-05-25 17:08:36'),
(153, 'Voice AI Developer', 'VoiceTech (DHA Phase 4)', 'Full-time', 'voicetech.ai', 'linkedin.com/voicetech', 'NLP, ASR', 'MS Speech Processing', 'voicetech.ai/jobs', 170000, 250000, '2025-05-25 17:08:36'),
(154, 'Freelance Tech Translator', 'TransloTech (Online)', 'Remote', 'none', 'none', 'English/Urdu Tech Terms', 'Language Degree', 'upwork.com/translotech', 35000, 65000, '2025-05-25 17:08:36'),
(155, 'Game Community Manager', 'PlayVerse (Johar Town)', 'Full-time', 'playverse.pk', 'twitter.com/playversepk', 'Discord, Social Media', 'none', 'linkedin.com/playverse-jobs', 60000, 100000, '2025-05-25 17:08:36'),
(156, 'Edge AI Researcher', 'EdgeMind (Arfa Tower)', 'Full-time', 'edgemind.ai', 'none', 'TensorFlow Lite', 'PhD AI/ML', 'edgemind.ai/careers', 240000, 360000, '2025-05-25 17:08:36'),
(157, 'Freelance 3D Artist', 'PolyMakers (Gulberg III)', 'Remote', 'polymakers.com', 'behance.net/polymakers', 'Blender, Maya', 'Portfolio Only', 'Link', 10000, 0, '2025-05-25 23:02:49'),
(158, 'Metaverse Developer', 'MetaVersePK (DHA Phase 5)', 'Full-time', 'metaversepk.com', 'linkedin.com/metaversepk', 'Unity3D, Web3', 'BS Game Development', 'metaversepk.com/careers', 220000, 350000, '2025-05-25 23:02:52'),
(159, 'Quantum Intern', 'QTech (LUMS)', 'Internship', 'qtech.edu.pk', 'none', 'Linear Algebra Basics', 'Physics/CS Student', 'rozee.pk/qtech-intern', 25000, 45000, '2025-05-25 23:02:54'),
(160, 'Remote Flutter Dev', 'AppCraft (Johar Town)', 'Remote', 'appcraft.io', 'twitter.com/appcraftpk', 'Dart, Firebase', 'BS CS/SE', 'upwork.com/appcraft-flutter', 150000, 230000, '2025-05-25 23:02:55'),
(161, 'Cybersecurity Trainer', 'CyberEdu (Arfa Tower)', 'Part-time', 'cyberedu.pk', 'none', 'CEH, Pentesting', 'Certifications Required', 'mustakbil.com/cyber-trainer', 90000, 150000, '2025-05-25 23:02:57'),
(162, 'AR/VR Content Creator', 'XR Studios (Gulberg)', 'Part-time', 'xrstudiospk.com', 'instagram.com/xrstudiospk', 'Unity3D, Blender', 'none', 'linkedin.com/xr-studios-jobs', 55000, 95000, '2025-06-10 13:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_auth`
--

CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_auth`
--

INSERT INTO `user_auth` (`id`, `username`, `full_name`, `email`, `password`, `is_admin`) VALUES
(1, 'admin', 'Administrator', 'admin@example.com', 'scrypt:32768:8:1$1sdW37I1wVibG6wR$7f9ac0b640d2ff5cebef073440b11d8d217ddc8e3425613ce335d3f7c97825ac0ae0cb04ba73731b66dcf4b2fde39195f27dd7c68befc30f37b9391da74b33f8', 1),
(2, 'tadianazeemi04', 'Tadian Ahmad Azeemi', 'tadianazeemi04@gmail.com', 'scrypt:32768:8:1$pZ2GfgJjC8hml9lH$a5c41ba7e73237cdf2fbf37a96908f658f2267737c7162b64ff392069e06acd624e754a574b703375d531b68d5211800bb4b07d80504ad1bee3b7d3fb5c1e6bd', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `job_data_update`
--
ALTER TABLE `job_data_update`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_auth`
--
ALTER TABLE `user_auth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `job_data_update`
--
ALTER TABLE `job_data_update`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `user_auth`
--
ALTER TABLE `user_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
