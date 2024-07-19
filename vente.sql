-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 20 juil. 2024 à 01:38
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `vente`
--

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('1kYkaVlAKR0IFsmQ', 'a:1:{s:11:\"valid_until\";i:1720559326;}', 1720579378),
('2qxhVy6IheFuAVlm', 'a:1:{s:11:\"valid_until\";i:1721431207;}', 1721451367),
('47uUkgW0avCoPVM1', 'a:1:{s:11:\"valid_until\";i:1720993890;}', 1721014034),
('64cUGvwB44HEvBb3', 'a:1:{s:11:\"valid_until\";i:1721412998;}', 1721432918),
('9rFEc3EocLCfFqVD', 'a:1:{s:11:\"valid_until\";i:1721431158;}', 1721451313),
('bIgkfsYkdwKhUhcV', 'a:1:{s:11:\"valid_until\";i:1720552799;}', 1720572539),
('CRbLrKsI9TfzLKDP', 'a:1:{s:11:\"valid_until\";i:1721167592;}', 1721187700),
('mB43bgIoN2vORaIu', 'a:1:{s:11:\"valid_until\";i:1720737424;}', 1720757531),
('niUNOZggZFS7rM5Z', 'a:1:{s:11:\"valid_until\";i:1720992574;}', 1721012722),
('RZpLtSdbZcWcwOPM', 'a:1:{s:11:\"valid_until\";i:1720990207;}', 1721010272),
('sz76zDW8HAWkjXnM', 'a:1:{s:11:\"valid_until\";i:1721430687;}', 1721450584),
('tcuJwZrhW4qwOFmv', 'a:1:{s:11:\"valid_until\";i:1720984399;}', 1721003988),
('w5SSG67izgAX1YL3', 'a:1:{s:11:\"valid_until\";i:1720991770;}', 1721011905),
('X7YrieKNU1XfI3nA', 'a:1:{s:11:\"valid_until\";i:1721050067;}', 1721070227),
('y2wQ7z5MFKSZVf3E', 'a:1:{s:11:\"valid_until\";i:1720992877;}', 1721013033);

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Electronique', '2024-07-02 12:43:21', '2024-07-14 13:20:06'),
(2, 'numerique', '2024-07-14 20:10:58', '2024-07-14 20:10:58'),
(3, 'ordinateur', '2024-07-19 17:23:48', '2024-07-19 17:23:48'),
(4, 'tablette', '2024-07-19 17:24:02', '2024-07-19 17:24:02'),
(5, 'Drones et caméra', '2024-07-19 17:27:33', '2024-07-19 17:27:33'),
(6, 'audio', '2024-07-19 17:37:26', '2024-07-19 17:37:26'),
(7, 'T.V et Home cinéma', '2024-07-19 17:43:45', '2024-07-19 17:43:45'),
(8, 'appareil connecté', '2024-07-19 17:49:41', '2024-07-19 17:49:41');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `sexe` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `nom`, `prenom`, `adresse`, `telephone`, `sexe`, `created_at`, `updated_at`) VALUES
(1, 'sy', 'pape', 'dakar', '779943853', 'Masculin', '2024-07-02 11:02:10', '2024-07-14 13:19:15'),
(2, 'lo', 'rama', 'HLM', '778593421', 'Féminin', '2024-07-14 13:11:44', '2024-07-14 13:11:44'),
(13, 'sy', 'issa', 'HLM', '77943658', 'Masculin', '2024-07-15 13:18:58', '2024-07-15 13:18:58'),
(14, 'ly', 'khadim', 'MBAO', '778965489', 'Masculin', '2024-07-19 19:50:34', '2024-07-19 19:50:34');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `numero` varchar(255) NOT NULL,
  `date_commande` timestamp NOT NULL DEFAULT current_timestamp(),
  `etat` varchar(20) NOT NULL,
  `paiement` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id`, `created_at`, `updated_at`, `client_id`, `numero`, `date_commande`, `etat`, `paiement`) VALUES
(8, '2024-07-19 18:58:10', '2024-07-19 18:58:10', 1, 'qWoFOSEN', '2024-07-19 00:00:00', 'en cours', 'wave'),
(9, '2024-07-19 19:50:37', '2024-07-19 19:50:37', 14, 'ZoyIYSEN', '2024-07-19 19:50:36', 'en cours', 'orange_money');

-- --------------------------------------------------------

--
-- Structure de la table `commande_produit`
--

CREATE TABLE `commande_produit` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `commande_id` bigint(20) UNSIGNED NOT NULL,
  `produit_id` bigint(20) UNSIGNED NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande_produit`
--

INSERT INTO `commande_produit` (`id`, `commande_id`, `produit_id`, `quantite`, `prix`, `created_at`, `updated_at`) VALUES
(5, 8, 5, 1, 50000.00, '2024-07-19 19:29:37', '2024-07-19 19:29:37'),
(6, 8, 14, 2, 60000.00, '2024-07-19 19:31:47', '2024-07-19 19:31:47'),
(7, 9, 7, 1, 170000.00, '2024-07-19 19:50:40', '2024-07-19 19:50:40');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2024_06_15_131716_create_personal_access_tokens_table', 1),
(4, '2024_06_15_143203_create_questions_table', 1),
(5, '2024_06_15_143216_create_reponses_table', 1),
(6, '2024_06_15_144157_create_status_table', 1),
(7, '2024_06_15_144205_create_theme_table', 1),
(8, '2024_07_01_194844_create_users_table', 1),
(9, '2024_07_01_195021_create_clients_table', 1),
(10, '2024_07_01_195056_create_categories_table', 1),
(11, '2024_07_01_195222_create_produits_table', 1),
(12, '2024_07_09_114455_create_commandes_table', 2),
(13, '2024_07_09_124541_create_commandes_table', 3),
(14, '2024_07_09_184911_create_commande_produits_table', 4),
(15, '2024_07_09_185035_create_commande_produit_table', 4),
(16, '2024_07_09_185156_create_commande__produits_table', 4),
(17, '2024_07_09_190407_create_produit_stocks_table', 4),
(18, '2024_07_09_190441_create_produit_stock_table', 4),
(19, '2024_07_11_153016_create_commandes_table', 5);

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `description` varchar(12000) DEFAULT NULL,
  `prix` double DEFAULT NULL,
  `qte` int(11) DEFAULT NULL,
  `photo` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `description`, `prix`, `qte`, `photo`, `category`, `created_at`, `updated_at`) VALUES
(1, 'iphone14', 'RFF', 100000, 4, '20240702131948.png', 'Electronique', '2024-07-02 13:19:48', '2024-07-19 14:41:13'),
(4, 'iphone10', 'nwcd', 80000, 6, '20240709183612.jpg', 'Electronique', '2024-07-09 18:36:12', '2024-07-16 21:39:09'),
(5, 'iphone11', 'jgjvj', 50000, 4, '20240714134643.jpg', 'Electronique', '2024-07-14 13:46:43', '2024-07-19 19:29:37'),
(6, 'Ordinateur portable tactile 14 pouces 12 Go', 'Performances solides\nMémoire RAM : 12 Go de RAM, offrant une capacité suffisante pour le multitâche fluide, y compris l\'exécution simultanée de plusieurs applications gourmandes en mémoire.\nProcesseur : Équipé d\'un processeur performant, adapté aux tâches courantes et à certaines applications plus exigeantes', 250000, 9, '20240719170812.png', 'ordinateur', '2024-07-19 17:08:12', '2024-07-19 17:25:20'),
(7, 'Ordinateur 24 Go + écran 29 pouces clavier et souris', 'Performances avancées :\n\nMémoire RAM : 24 Go, offrant une capacité exceptionnelle pour le multitâche intensif et les applications gourmandes en mémoire.\nProcesseur : Equipé d\'un processeur puissant adapté aux tâches complexes, allant du traitement de données à la création de contenu multimédia.', 170000, 7, '20240719171930.jpg', 'ordinateur', '2024-07-19 17:19:30', '2024-07-19 19:50:40'),
(8, 'Ordinateur portable MSP 14 pouces 16 Go, gris carbone', 'Mémoire RAM : 16 Go de RAM, assurant une excellente réactivité et permettant de gérer efficacement plusieurs applications et tâches simultanées.\nProcesseur : Equipé d\'un processeur performant adapté aux besoins quotidiens, du multitâche au divertissement en ligne.', 150000, 10, '20240719172203.jpg', 'ordinateur', '2024-07-19 17:22:03', '2024-07-19 17:58:33'),
(9, 'Écran tactile Pilates 16 pouces 24 Go', 'Mémoire RAM : 24 Go de RAM, fournissant une capacité de mémoire massive pour une exécution fluide de plusieurs applications et tâches gourmandes en ressources.\nProcesseur : Processeur puissant, adapté aux exigences des applications modernes et du multitâche intensif.', 310000, 8, '20240719172500.jpg', 'ordinateur', '2024-07-19 17:25:00', '2024-07-19 17:59:46'),
(10, 'Caméra de surveillance extérieure', 'Résolution HD ou Full HD : Offre une qualité d\'image haute définition pour une surveillance claire et détaillée.\nVision Nocturne : Equipée de LEDs infrarouges pour une vision nocturne claire, permettant de surveiller même dans l\'obscurité totale.', 25000, 6, '20240719172838.jpg', 'Drones et caméra', '2024-07-19 17:28:38', '2024-07-19 18:00:38'),
(11, 'Mini drone quadrirotor avec télécommande', 'Compact et Léger : Conception petite et légère, facilitant le transport et la manipulation.\nQuatre Hélices : Equipé de quatre rotors (quadrirotor), assurant une stabilité en vol et une manœuvrabilité améliorée.', 45000, 7, '20240719172940.jpg', 'Drones et caméra', '2024-07-19 17:29:40', '2024-07-19 18:01:42'),
(12, 'Mini Drone EXE avec télécommande', 'Caméra Intégrée : Certaines versions peuvent être équipées d\'une caméra intégrée pour capturer des photos et des vidéos aériennes.\nCapteurs : Capteurs de stabilisation pour maintenir une position stable en vol, même par conditions venteuses.', 80000, 4, '20240719173057.jpg', 'Drones et caméra', '2024-07-19 17:30:57', '2024-07-19 18:02:21'),
(13, 'Caméra de surveillance intérieure sans fil H1C 1080p', 'Détection de Mouvement : Capable de détecter les mouvements suspects et d\'envoyer des alertes à l\'utilisateur via une application mobile ou un système de surveillance.\nAudio Bidirectionnel : Permet la communication à distance, avec un micro intégré pour écouter et un haut-parleur pour parler via l\'application.', 50000, 5, '20240719173222.jpg', 'Drones et caméra', '2024-07-19 17:32:22', '2024-07-19 18:02:57'),
(14, 'Tablette S7 - 11 pouces, 128 Go Wi-Fi', 'Capacité de Stockage : 128 Go de mémoire interne, offrant suffisamment d\'espace pour stocker des applications, des photos, des vidéos et d\'autres fichiers.\nMémoire RAM : Configurée pour une réactivité optimale et une exécution fluide des applications et des jeux.', 60000, 5, '20240719173336.jpg', 'tablette', '2024-07-19 17:33:36', '2024-07-19 19:31:47'),
(15, 'Mini tablette Sheer Pro 7,9 pouces', 'Performances : Équipée d\'un processeur adapté aux tâches courantes, assurant une réactivité fluide lors de la navigation, du multitâche et de l\'exécution d\'applications.\nStockage : Options de stockage variant selon le modèle, permettant de choisir entre différentes capacités pour répondre aux besoins de stockage de l\'utilisateur.', 50000, 4, '20240719173504.png', 'tablette', '2024-07-19 17:35:04', '2024-07-19 18:04:57'),
(16, 'Ocean Pro Tactile 11 / 12,3 pouces', 'Performances : Équipée d\'un processeur adapté aux tâches courantes, assurant une réactivité fluide lors de la navigation, du multitâche et de l\'exécution d\'applications.\nStockage : Options de stockage variant selon le modèle, permettant de choisir entre différentes capacités pour répondre aux besoins de stockage de l\'utilisateur.', 30000, 5, '20240719173713.png', 'tablette', '2024-07-19 17:37:13', '2024-07-19 18:05:46'),
(17, 'Casques sans fil 700 antibruit', 'dljknjgfxvfgcDesign Élégant : Élégant et moderne, avec des matériaux de haute qualité et une finition soignée, offrant à la fois durabilité et esthétique agréable.\nConfort Supérieur : Coussinets d\'oreille doux et ergonomiques pour un port prolongé sans inconfort, permettant une immersion totale dans l\'audio sans fatigue.', 30000, 6, '20240719173814.png', 'audio', '2024-07-19 17:38:14', '2024-07-19 18:07:02'),
(18, 'Écouteurs intra-auriculaires antibruit sans fil', 'Annulation de Bruit Active (ANC) : Intégration d\'une technologie avancée d\'annulation active du bruit pour filtrer efficacement les sons externes perturbateurs, permettant une immersion totale dans la musique ou les appels téléphoniques.\nIsolation Passive : Conception intra-auriculaire qui bloque naturellement une partie du bruit environnant, améliorant ainsi l\'efficacité de l\'ANC.', 20000, 5, '20240719173930.jpg', 'audio', '2024-07-19 17:39:30', '2024-07-19 18:08:50'),
(19, 'Écouteurs intra-auriculaires blancs sans fil', 'Annulation de Bruit Active (ANC) : Intégration d\'une technologie avancée d\'annulation active du bruit pour filtrer efficacement les sons externes perturbateurs, permettant une immersion totale dans la musique ou les appels téléphoniques.\nIsolation Passive : Conception intra-auriculaire qui bloque naturellement une partie du bruit environnant, améliorant ainsi l\'efficacité de l\'ANC.', 10000, 3, '20240719174105.jpg', 'audio', '2024-07-19 17:41:05', '2024-07-19 18:09:27'),
(20, 'Enceinte portable Turn5 Bluetooth', 'Bluetooth : Connexion sans fil Bluetooth pour une compatibilité universelle avec une large gamme d\'appareils, permettant une diffusion audio pratique depuis smartphones, tablettes et ordinateurs.\nPort Auxiliaire : Option de connexion filaire via un câble audio auxiliaire pour les appareils non Bluetooth.', 8000, 4, '20240719174218.jpg', 'audio', '2024-07-19 17:42:18', '2024-07-19 18:10:49'),
(21, 'Télévision Smart 50 pouces Class LED 4K UHD', 'Plateforme Smart TV : Intégration d\'une plateforme Smart TV avec accès à une variété d\'applications, de services de streaming et de contenu en ligne.\nConnectivité Internet : Connexion Wi-Fi intégrée et possibilité de connexion Ethernet pour un accès rapide à Internet.', 144000, 5, '20240719174428.jpg', 'T.V et Home cinéma', '2024-07-19 17:44:28', '2024-07-19 18:11:43'),
(22, 'Télévision connectée 65 pouces LED 4K', 'Plateforme Smart TV : Intégration d\'une plateforme Smart TV avec accès à une variété d\'applications, de services de streaming et de contenu en ligne.\nConnectivité Internet : Connexion Wi-Fi intégrée et possibilité de connexion Ethernet pour un accès rapide à Internet.', 120000, 2, '20240719174524.jpg', 'T.V et Home cinéma', '2024-07-19 17:45:24', '2024-07-19 18:11:57'),
(23, 'Télévision connectée 42 pouces Full HD', 'Plateforme Smart TV : Intégration d\'une plateforme Smart TV avec accès à une variété d\'applications, de services de streaming et de contenu en ligne.\nConnectivité Internet : Connexion Wi-Fi intégrée et possibilité de connexion Ethernet pour un accès rapide à Internet.', 90000, 5, '20240719174646.jpg', 'T.V et Home cinéma', '2024-07-19 17:46:46', '2024-07-19 18:12:09'),
(24, 'Mini projecteur sans fil JP 470', 'KUJCorrection Keystone : Fonctionnalité de correction automatique de l\'image pour une projection optimale même sous différents angles.\nProjection à Courte Focale : Permet de projeter des images de grande taille à une courte distance de l\'écran ou du mur.', 60000, 5, '20240719174835.jpg', 'T.V et Home cinéma', '2024-07-19 17:48:35', '2024-07-19 18:13:16'),
(25, 'Montre connectée Space Moon avec chargeur', 'Capteurs Intégrés : Capteurs avancés pour surveiller votre fréquence cardiaque, vos pas, vos calories brûlées et votre sommeil.\nApplications de Santé : Applications intégrées pour suivre votre activité physique et améliorer votre bien-être global.', 40000, 4, '20240719175047.jpg', 'appareil connecté', '2024-07-19 17:50:47', '2024-07-19 18:14:37'),
(26, 'Casque réalité virtuelle XD', 'Optique Avancée : Lentilles haute définition pour une clarté visuelle exceptionnelle et un champ de vision étendu.\nÉcrans Haute Résolution : Écrans intégrés offrant des images nettes et détaillées pour une immersion totale dans le monde virtuel.', 60000, 3, '20240719175139.jpg', 'appareil connecté', '2024-07-19 17:51:39', '2024-07-19 18:15:29'),
(27, 'Bracelet connecté Fitness avec suivi du rythme cardiaque', 'Capteur de Rythme Cardiaque : Capteur intégré pour surveiller en continu votre fréquence cardiaque pendant vos séances d\'exercice et au repos.\nSuivi d\'Activité : Enregistrement précis des pas, de la distance parcourue, des calories brûlées et de la qualité du sommeil.', 30000, 5, '20240719175327.jpg', 'appareil connecté', '2024-07-19 17:53:27', '2024-07-19 18:16:15'),
(28, 'Montre connectée fitness XDH', 'Capteur de Rythme Cardiaque : Capteur intégré pour surveiller en continu votre fréquence cardiaque pendant vos séances d\'exercice et au repos.\nSuivi d\'Activité : Enregistrement précis des pas, de la distance parcourue, des calories brûlées et de la qualité du sommeil.', 30000, 4, '20240719175501.jpg', 'appareil connecté', '2024-07-19 17:55:01', '2024-07-19 18:16:29');

-- --------------------------------------------------------

--
-- Structure de la table `produit_stock`
--

CREATE TABLE `produit_stock` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `produit_id` bigint(20) UNSIGNED NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titre` varchar(255) NOT NULL,
  `contenu` varchar(255) NOT NULL,
  `theme` varchar(255) NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reponses`
--

CREATE TABLE `reponses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contenu` varchar(255) NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `question_id` int(11) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `valide` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

CREATE TABLE `status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

CREATE TABLE `theme` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `email`, `password`, `status`, `photo`, `created_at`, `updated_at`) VALUES
(6, 'sy', 'laye', 'sy@gmail.com', '$2y$12$Z0YH4dOUFKNjCRV09N/p0e8WJmOTsIMxRMjbtrVZ24X.9h14QEpLS', 'Responsable produit', '20240702145004.jpg', '2024-07-02 14:50:04', '2024-07-14 20:46:18'),
(7, 'diop', 'issa', 'issa@gmail.com', '$2y$12$8/l6Xwu/ApBS9h4e/NtPLuLfg3keZieShWalequqrSm5D70Y5nwwy', 'Admin', '20240714203803.avif', '2024-07-14 20:38:03', '2024-07-14 20:46:53'),
(8, 'ba', 'khalil', 'khalil@gmail.com', '$2y$12$61g0rKUIkNu1GVmqWv4r/ehcaGvk3EJrFpFwCZWMkavtwrj9vKTkC', 'User', '20240719193935.avif', '2024-07-19 19:39:35', '2024-07-19 19:39:35'),
(9, 'lo', 'pape', 'pape@gmail.com', '$2y$12$VV6YH2LC8NLjfLu1pY4lx.nSzgLbxHAi3a9XjDpYqJm4UzBWSa/7e', 'Responsable Commande', '20240719194123.avif', '2024-07-19 19:41:23', '2024-07-19 19:41:23'),
(10, 'ly', 'aziz', 'ly@gmail.com', '$2y$12$gjJrYlrknggHP1Mh58Xnvu0nc2V7OURpMV5e2rKt8ST1WiCk3MJlO', 'user', '1721430777.avif', '2024-07-19 23:12:57', '2024-07-19 23:12:57');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commandes_client_id_foreign` (`client_id`);

--
-- Index pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commande_produit_commande_id_foreign` (`commande_id`),
  ADD KEY `commande_produit_produit_id_foreign` (`produit_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produit_stock`
--
ALTER TABLE `produit_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produit_stock_produit_id_foreign` (`produit_id`);

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reponses`
--
ALTER TABLE `reponses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `produit_stock`
--
ALTER TABLE `produit_stock`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reponses`
--
ALTER TABLE `reponses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `status`
--
ALTER TABLE `status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `theme`
--
ALTER TABLE `theme`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD CONSTRAINT `commande_produit_commande_id_foreign` FOREIGN KEY (`commande_id`) REFERENCES `commandes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `commande_produit_produit_id_foreign` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `produit_stock`
--
ALTER TABLE `produit_stock`
  ADD CONSTRAINT `produit_stock_produit_id_foreign` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
