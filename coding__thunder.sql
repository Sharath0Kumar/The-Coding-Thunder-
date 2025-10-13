-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2025 at 06:55 PM
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
-- Database: `coding _thunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_no`, `msg`, `date`, `email`) VALUES
(1, 'first post', '123456789', 'first post', '2025-09-07 21:55:14', 'firstpost@gmail.com'),
(2, 'Batman', '986543210', 'wertyujfg ofygku n', NULL, 'abc@google.com'),
(3, 'Ironman', '32566762', 'i am the ironman', '2025-09-07 22:35:17', 'gsudygu@gmail.com'),
(4, 'Batman', '3256676', 'wertyyuk yfgiuolj', '2025-09-07 23:42:52', 'gsudygu@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'my life my rule', 'this is the edit', 'new-post1', 'rsytfugihghjujk figuohugkhj fyigukjb', 'abc.img', '2025-09-12 23:46:14'),
(2, 'Article about IT jobs', 'This is second post', 'second-post', 'The tech job market in India is booming, driven by rapid digital transformation and the adoption of cutting-edge technologies. For those looking to enter or advance in the IT sector, the landscape is ripe with opportunities, particularly in specialized fields.\r\n\r\nHigh-Demand Tech Roles\r\nSeveral domains are experiencing significant growth and are projected to be the most promising for 2025 and beyond.\r\n\r\nArtificial Intelligence (AI) and Machine Learning (ML): As Indian companies increasingly integrate AI into their operations, roles like AI/ML Architect, Engineer, and Data Scientist are in high demand. These professionals design and implement sophisticated machine learning models, analyze vast datasets, and turn business visions into technical realities. India is noted as a world leader in AI skill penetration, with a workforce that has grown significantly in this area.\r\n\r\nCloud Computing: The shift to cloud-based solutions has created a massive need for Cloud Architects and Engineers. These roles involve designing, implementing, and managing scalable and secure cloud infrastructures on platforms like AWS, Microsoft Azure, and Google Cloud. The demand for cloud professionals is expected to rise by 20% in the coming years.\r\n\r\nCybersecurity: With the increasing sophistication of cyberattacks, the demand for Cybersecurity Engineers and Information Security Analysts has skyrocketed. These professionals are essential for protecting sensitive data and safeguarding organizations from digital threats.\r\n\r\nData Science and Big Data: Data Scientists and Big Data Engineers are crucial for businesses that rely on data for strategic decisions. They collect, analyze, and interpret large datasets to uncover trends and provide actionable insights.\r\n\r\nDevOps Engineering: DevOps engineers bridge the gap between software development and IT operations, focusing on automation, efficiency, and system reliability. Their skills in continuous integration and deployment (CI/CD) pipelines are highly valued.\r\n\r\nFull-Stack Development: Versatile developers who can handle both front-end and back-end development remain in high demand. Their ability to work across the entire application stack makes them valuable assets for building and scaling web applications.', 'about-bg.jpg', '2025-09-10 23:45:00'),
(3, 'Article about the Game', 'This is the 3rd post', 'third-post', 'The Indian gaming industry is experiencing explosive growth, transforming from a niche hobby into a mainstream entertainment powerhouse. Propelled by affordable smartphones, widespread internet access, and a massive youth demographic, the sector is on track to surpass the USD 1 billion mark in 2025 and is projected to reach USD 1.5 billion by 2027, making it the fastest-growing market in the world.\r\n\r\nThe Mobile Gaming Revolution\r\nMobile gaming is the undisputed king in India, accounting for over 77% of the total gaming revenue. In the 2024-25 fiscal year, India led the world with a staggering 8.45 billion mobile game downloads. This dominance is fueled by a young player base—77% of whom are between 18 and 34 years old—and a preference for free-to-play titles.\r\n\r\nCulturally resonant games like Ludo King dominate the download charts, while competitive titles such as Free Fire and Battlegrounds Mobile India (BGMI) lead in revenue generation through in-app purchases.\r\n\r\nThe Meteoric Rise of Esports\r\nEsports, or competitive gaming, has evolved into a major cultural and economic force. The Indian esports market is projected to reach USD 151 million by 2025, with an estimated 1.5 million professional and semi-professional players.\r\n\r\nThis growth is supported by a robust ecosystem of tournament organizers like NODWIN Gaming and Skyesports, who host large-scale events with significant prize pools. Popular games in the Indian esports circuit include BGMI, Valorant, and Counter-Strike 2. Recognizing its potential, the Indian government has officially recognized esports as a competitive sport, a move expected to boost funding and infrastructure development.', 'post-bg.jpg', '2025-09-11 00:04:00'),
(4, 'Article about the Phone', 'This is 4th Post', 'fourth-post', '5G Connectivity is Now Standard The rollout of 5G networks has significantly impacted the smartphone market. What was once a premium feature is now a standard offering across most new devices, even in the budget segment. This has enabled faster download and upload speeds, lower latency, and has opened the door for more sophisticated mobile applications, including high-fidelity cloud gaming and enhanced augmented reality (AR) experiences.\r\n\r\nArtificial Intelligence is Everywhere AI is no longer just for flagship phones. Mobile processors from leading manufacturers like Qualcomm, MediaTek, and Apple now include powerful Neural Processing Units (NPUs) dedicated to AI tasks. This has led to a host of intelligent features, such as:\r\n\r\nSmarter Cameras: AI algorithms are used for scene recognition, real-time image optimization, and advanced portrait modes that can produce DSLR-like quality.\r\n\r\nEnhanced Battery Life: AI-powered software optimizes battery consumption by learning user habits and managing background processes more efficiently.\r\n\r\nReal-time Translation: On-device AI enables instant translation of spoken and written language without needing an internet connection.\r\n\r\nProactive Assistants: Virtual assistants are more context-aware, capable of anticipating user needs and providing relevant information before being asked.\r\n\r\nFoldable Phones are Gaining Traction After several years of development and refinement, foldable smartphones have become more durable, affordable, and popular. Major players like Samsung, Google, and several Chinese manufacturers have released new generations of foldables with improved hinge mechanisms, more resilient screens, and software that is better optimized for the unique form factor. While still a premium category, the price of entry has lowered, making them accessible to a wider audience.\r\n\r\nNotable Phones on the Market\r\nWhile a definitive \"best\" phone depends on individual needs, several models are noteworthy in the current market:\r\n\r\nThe Samsung Galaxy Z Fold and Z Flip series continue to lead the foldable market with polished designs and robust multitasking features.\r\n\r\nApple\'s latest iPhone models feature advanced camera systems powered by their A-series bionic chips, offering unparalleled performance in video recording and computational photography.\r\n\r\nGoogle\'s Pixel lineup remains a top choice for those who want the purest Android experience, combined with a camera system that excels at capturing stunning still images through software prowess.\r\n\r\nBrands like Xiaomi, OnePlus, and Vivo are competing fiercely in the \"flagship killer\" space, offering high-end specifications like 120Hz displays, ultra-fast charging, and powerful processors at more competitive price points.', 'post-bg.jpg', '2025-09-11 00:06:17'),
(5, 'Article about Computer', 'This is the 5th post', 'fifth-post', 'The most significant trend of 2025 is the widespread emergence of the \"AI PC.\" These are not just faster computers; they are systems fundamentally designed to handle artificial intelligence tasks locally, rather than relying on the cloud. This is made possible by the inclusion of a Neural Processing Unit (NPU) alongside the traditional CPU and GPU.\r\n\r\nThis dedicated AI hardware accelerates a range of new capabilities, including:\r\n\r\nReal-time Language Translation: Instantaneous translation during video calls without significant performance impact.\r\n\r\nAdvanced Content Creation: AI-powered features in creative software, such as intelligent object removal in photos, generative art, and sophisticated video editing effects, run much faster.\r\n\r\nEnhanced Security: AI algorithms can now more effectively detect malware and phishing attempts in real-time by analyzing behavior on the device itself.\r\n\r\nSmarter Operating Systems: Features like Microsoft\'s Copilot and other OS-level AI assistants are more responsive and context-aware, capable of summarizing documents, drafting emails, and managing settings proactively.\r\n\r\nKey Market Segments and Technologies\r\nLaptops: Thinner, Lighter, and More Powerful\r\nThe laptop market continues to be the dominant force in personal computing. The key trends are:\r\n\r\nProcessor Wars: The long-standing dominance of the x86 architecture (from Intel and AMD) is being challenged by ARM-based processors, most notably Apple\'s M-series silicon in their MacBooks. These ARM chips offer remarkable performance-per-watt, leading to powerful yet fanless designs with exceptionally long battery life. Other manufacturers like Qualcomm, in partnership with Microsoft, are also making significant inroads with ARM-based chips for Windows laptops.\r\n\r\nOLED Displays: Once a premium feature, OLED screens are becoming more common across mid-range and high-end laptops, offering superior contrast, vibrant colors, and true blacks.\r\n\r\nConnectivity: Wi-Fi 7 is the new standard for high-end laptops and desktops, providing faster speeds, lower latency, and more stable connections, which is crucial for cloud gaming and high-resolution streaming.\r\n\r\nDesktops: The Choice for Power Users and Gamers\r\nWhile the laptop market grows, the desktop remains the platform of choice for those who need maximum performance.\r\n\r\nModular and Upgradable: The core appeal of the desktop—the ability to customize and upgrade components like GPUs, RAM, and storage—remains its greatest strength.\r\n\r\nGaming Dominance: For high-end PC gaming, desktops are essential for accommodating the most powerful graphics cards from NVIDIA and AMD, which are needed to drive 4K gaming at high frame rates and power demanding virtual reality (VR) experiences.\r\n\r\nWorkstation Power: Professionals in fields like 3D rendering, video production, and scientific computing rely on desktop workstations for their unparalleled processing power and expandability.', 'post-bg.jpg', '2025-09-11 00:07:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
