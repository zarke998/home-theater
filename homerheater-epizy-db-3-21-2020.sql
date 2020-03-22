-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql111.epizy.com
-- Generation Time: Mar 21, 2020 at 07:43 AM
-- Server version: 5.6.45-86.1
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epiz_25301456_hometheater`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(16, 'Action'),
(15, 'Biography'),
(14, 'Sci-Fi'),
(13, 'Adventure'),
(12, 'Comedy'),
(11, 'Mystery'),
(10, 'Drama'),
(9, 'Crime'),
(17, 'Animation'),
(18, 'Fantasy'),
(19, 'Romance'),
(20, 'History'),
(21, 'Thriller'),
(22, 'Western'),
(23, 'Music');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `year_released` smallint(6) NOT NULL,
  `runtime` smallint(6) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `metascore` smallint(6) NOT NULL,
  `content_types_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `title`, `description`, `year_released`, `runtime`, `rating`, `metascore`, `content_types_id`, `created`) VALUES
(222, 'Prisoners', 'When Keller Dover\'s daughter and her friend go missing, he takes matters into his own hands as the police pursue multiple leads and the pressure mounts.\r\n', 2013, 153, '4.0', 74, 1, '2020-03-19 12:33:31'),
(223, 'The Grand Budapest Hotel', 'A writer encounters the owner of an aging high-class hotel, who tells him of his early years serving as a lobby boy in the hotel\'s glorious years under an exceptional concierge.', 2014, 99, '4.0', 88, 1, '2020-03-19 13:57:21'),
(224, 'Interstellar', 'Earth\'s future has been riddled by disasters, famines, and droughts. There is only one way to ensure mankind\'s survival: Interstellar travel. A newly discovered wormhole in the far reaches of our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right environment to sustain human life.', 2014, 169, '4.3', 74, 1, '2020-03-19 14:07:24'),
(225, 'The Wolf of Wall Street', 'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.', 2013, 180, '4.1', 75, 1, '2020-03-19 14:11:13'),
(226, 'Mad Max: Fury Road', 'In a post-apocalyptic wasteland, a woman rebels against a tyrannical ruler in search for her homeland with the aid of a group of female prisoners, a psychotic worshiper, and a drifter named Max.', 2015, 120, '4.0', 90, 1, '2020-03-19 14:22:19'),
(227, 'Your Name.', 'Two strangers find themselves linked in a bizarre way. When a connection forms, will distance be the only thing to keep them apart?\r\n\r\n', 2016, 106, '4.4', 79, 1, '2020-03-19 14:25:22'),
(228, 'Manchester by the Sea', 'A depressed uncle is asked to take care of his teenage nephew after the boy\'s father dies.', 2016, 137, '3.8', 96, 1, '2020-03-19 14:33:33'),
(229, 'Inception', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.\r\n', 2010, 148, '4.6', 74, 1, '2020-03-19 14:35:02'),
(231, 'Toy Story 3', 'The toys are mistakenly delivered to a day-care center instead of the attic right before Andy leaves for college, and it\'s up to Woody to convince the other toys that they weren\'t abandoned and to return home.', 2010, 103, '4.2', 92, 1, '2020-03-19 14:40:57'),
(232, 'Paterson', 'A quiet observation of the triumphs and defeats of daily life, along with the poetry evident in its smallest details.', 2016, 118, '3.7', 90, 1, '2020-03-19 14:45:21'),
(233, 'Boyhood', 'The life of Mason, from early childhood to his arrival at college.\r\n', 2014, 165, '3.9', 100, 1, '2020-03-19 14:49:12'),
(234, 'Inside Out', 'After young Riley is uprooted from her Midwest life and moved to San Francisco, her emotions - Joy, Fear, Anger, Disgust and Sadness - conflict on how best to navigate a new city, house, and school.', 2015, 95, '4.1', 94, 1, '2020-03-19 14:53:20'),
(235, 'Dunkirk', 'Allied soldiers from Belgium, the British Empire, and France are surrounded by the German Army, and evacuated during a fierce battle in World War II.\r\n', 2017, 106, '3.9', 94, 1, '2020-03-19 19:59:39'),
(236, 'Black Swan', 'A committed dancer struggles to maintain her sanity after winning the lead role in a production of Tchaikovsky\'s \"Swan Lake\".', 2010, 108, '4.0', 79, 1, '2020-03-19 20:02:58'),
(237, 'Gone Girl', 'With his wife\'s disappearance having become the focus of an intense media circus, a man sees the spotlight turned on him when it\'s suspected that he may not be innocent.', 2014, 149, '4.1', 79, 1, '2020-03-19 20:14:35'),
(238, 'Blade Runner 2049', 'Thirty years after the events of Blade Runner (1982), a new Blade Runner, L.A.P.D. Officer \"K\" (Ryan Gosling), unearths a long-buried secret that has the potential to plunge what\'s left of society into chaos. K\'s discovery leads him on a quest to find Rick Deckard (Harrison Ford), a former L.A.P.D. Blade Runner, who has been missing for thirty years.', 2017, 164, '4.1', 81, 1, '2020-03-19 20:21:03'),
(239, 'The Imitation Game', 'During World War II, the English mathematical genius Alan Turing tries to crack the German Enigma code with help from fellow mathematicians.', 2014, 114, '4.3', 73, 1, '2020-03-19 20:23:25'),
(240, '12 Years a Slave', 'In the antebellum United States, Solomon Northup, a free black man from upstate New York, is abducted and sold into slavery.', 2013, 134, '4.0', 96, 1, '2020-03-19 20:26:39'),
(241, 'The King\'s Speech', 'The story of King George VI, his impromptu ascension to the throne of the British Empire in 1936, and the speech therapist who helped the unsure monarch overcome his stammer.', 2010, 118, '3.9', 88, 1, '2020-03-19 20:29:39'),
(242, 'Spotlight', 'The true story of how the Boston Globe uncovered the massive scandal of child molestation and cover-up within the local Catholic Archdiocese, shaking the entire Catholic Church to its core.', 2015, 129, '4.2', 93, 1, '2020-03-19 20:32:33'),
(243, 'Django Unchained', 'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.', 2012, 165, '4.7', 81, 1, '2020-03-19 20:34:56'),
(244, 'The Tree of Life', 'The story of a family in Waco, Texas in 1956. The eldest son witnesses the loss of innocence and struggles with his parents\' conflicting teachings.', 2011, 139, '3.1', 85, 1, '2020-03-19 20:41:16'),
(245, 'Whiplash', 'A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student\'s potential.', 2014, 106, '4.4', 88, 1, '2020-03-19 20:45:19'),
(246, 'La La Land', 'While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.', 2016, 128, '4.2', 93, 1, '2020-03-19 20:47:24'),
(248, 'Logan', 'In the near future, a weary Logan (Hugh Jackman) cares for an ailing Professor X (Patrick Stewart) at a remote outpost on the Mexican border. His plan to hide from the outside world gets upended when he meets a young mutant (Dafne Keen) who is very much like him. Logan must now protect the girl and battle the dark forces that want to capture her.', 2017, 137, '4.3', 77, 1, '2020-03-19 20:54:19'),
(249, 'The Social Network', 'As Harvard student Mark Zuckerberg creates the social networking site that would become known as Facebook, he is sued by the twins who claimed he stole their idea, and by the co-founder who was later squeezed out of the business.', 2010, 120, '3.9', 95, 1, '2020-03-19 20:57:12'),
(250, 'Arrival', 'A linguist works with the military to communicate with alien lifeforms after twelve mysterious spacecraft appear around the world.', 2016, 116, '3.8', 81, 1, '2020-03-19 20:58:25'),
(251, 'Before Midnight', 'We meet Jesse and Celine nine years on in Greece. Almost two decades have passed since their first meeting on that train bound for Vienna.', 2013, 109, '3.8', 94, 1, '2020-03-19 21:00:10'),
(252, 'Nebraska', 'An aging, booze-addled father makes the trip from Montana to Nebraska with his estranged son in order to claim a million-dollar Mega Sweepstakes Marketing prize.', 2013, 115, '3.8', 86, 1, '2020-03-19 21:04:05'),
(253, 'Phantom Thread', 'Set in 1950s London, Reynolds Woodcock is a renowned dressmaker whose fastidious life is disrupted by a young, strong-willed woman, Alma, who becomes his muse and lover.', 2017, 130, '3.8', 90, 1, '2020-03-20 10:54:12'),
(254, 'Argo', 'Acting under the cover of a Hollywood producer scouting a location for a science fiction film, a CIA agent launches a dangerous operation to rescue six Americans in Tehran during the U.S. hostage crisis in Iran in 1979.', 2012, 120, '3.7', 86, 1, '2020-03-20 10:57:06'),
(255, 'Hacksaw Ridge', 'World War II American Army Medic Desmond T. Doss, who served during the Battle of Okinawa, refuses to kill people, and becomes the first man in American history to receive the Medal of Honor without firing a shot.', 2016, 139, '4.1', 71, 1, '2020-03-20 10:59:05'),
(256, 'The Revenant', 'A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.', 2015, 156, '4.2', 76, 1, '2020-03-20 11:01:39'),
(257, 'Moonrise Kingdom', 'A pair of young lovers flee their New England town, which causes a local search party to fan out to find them.', 2012, 94, '3.9', 84, 1, '2020-03-20 11:04:42'),
(259, 'Captain Fantastic', 'Ben Cash, his wife Leslie and their six children live in the Washington wilderness. Ben and Leslie are former anarchist activists disillusioned with capitalism and American life, and chose to instill survivalist skills, left wing politics, and philosophy in their children - educating them to think critically, training them to be self-reliant, physically fit and athletic, guiding them without technology, demonstrating the beauty of coexisting with nature and celebrating Noam Chomsky\'s birthday instead of Christmas..', 2016, 118, '3.9', 72, 1, '2020-03-20 11:16:48'),
(260, 'Nightcrawler', 'When Louis Bloom, a con man desperate for work, muscles into the world of L.A. crime journalism, he blurs the line between observer and participant to become the star of his own story.', 2014, 117, '3.9', 76, 1, '2020-03-20 11:29:15'),
(261, 'Her', 'In a near future, a lonely writer develops an unlikely relationship with an operating system designed to meet his every need.', 2013, 126, '4.0', 90, 1, '2020-03-20 11:31:35'),
(262, 'Hidden Figures', 'The story of a team of female African-American mathematicians who served a vital role in NASA during the early years of the U.S. space program.', 2016, 127, '3.8', 74, 1, '2020-03-20 11:33:06'),
(263, 'Edge of Tomorrow', 'A soldier fighting aliens gets to relive the same day over and over again, the day restarting every time he dies.', 2014, 113, '3.9', 71, 1, '2020-03-20 11:35:08'),
(264, 'The Perks of Being a Wallflower', 'An introvert freshman is taken under the wings of two seniors who welcome him to the real world.', 2012, 103, '4.0', 67, 1, '2020-03-20 11:36:38'),
(265, 'Bridge of Spies', 'During the Cold War, an American lawyer is recruited to defend an arrested Soviet spy in court, and then help the CIA facilitate an exchange of the spy for the Soviet captured American U2 spy plane pilot, Francis Gary Powers.', 2015, 142, '3.7', 81, 1, '2020-03-20 11:37:50'),
(266, 'Call Me by Your Name', 'In 1980s Italy, romance blossoms between a seventeen-year-old student and the older man hired as his father\'s research assistant.', 2017, 132, '3.9', 93, 1, '2020-03-20 11:40:34'),
(271, 'The Master', 'A Naval veteran arrives home from war unsettled and uncertain of his future - until he is tantalized by the Cause and its charismatic leader.', 2012, 138, '3.4', 86, 1, '2020-03-20 11:58:18'),
(268, 'The Big Short', 'In 2006-2007 a group of investors bet against the US mortgage market. In their research they discover how flawed and corrupt the market is.', 2015, 130, '3.9', 81, 1, '2020-03-20 11:44:35'),
(269, 'The Avengers', 'Earth\'s mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.', 2012, 143, '4.0', 69, 1, '2020-03-20 11:46:54'),
(270, 'The Disaster Artist', 'When Greg Sestero, an aspiring film actor, meets the weird and mysterious Tommy Wiseau in an acting class, they form a unique friendship and travel to Hollywood to make their dreams come true.', 2017, 104, '3.8', 76, 1, '2020-03-20 11:51:09'),
(272, 'The Dark Knight Rises', 'Eight years after the Joker\'s reign of anarchy, Batman, with the help of the enigmatic Catwoman, is forced from his exile to save Gotham City from the brutal guerrilla terrorist Bane.', 2012, 164, '4.3', 78, 1, '2020-03-20 11:59:43'),
(273, 'The Martian', 'An astronaut becomes stranded on Mars after his team assume him dead, and must rely on his ingenuity to find a way to signal to Earth that he is alive.', 2015, 144, '4.0', 80, 1, '2020-03-20 12:01:34'),
(274, 'Zero Dark Thirty', 'A chronicle of the decade-long hunt for al-Qaeda terrorist leader Osama bin Laden after the September 2001 attacks, and his death at the hands of the Navy S.E.A.L.s Team 6 in May 2011.', 2012, 157, '3.8', 95, 1, '2020-03-20 12:02:50'),
(275, 'Life of Pi', 'A young man who survives a disaster at sea is hurtled into an epic journey of adventure and discovery. While cast away, he forms an unexpected connection with another survivor: a fearsome Bengal tiger.', 2012, 127, '3.9', 79, 1, '2020-03-20 12:04:07'),
(276, 'Game of Thrones', 'In the mythical continent of Westeros, several powerful families fight for control of the Seven Kingdoms. As conflict erupts in the kingdoms of men, an ancient enemy rises once again to threaten them all. Meanwhile, the last heirs of a recently usurped dynasty plot to take back their homeland from across the Narrow Sea.', 2011, 57, '4.9', 86, 2, '2020-03-20 23:26:33'),
(277, 'The Leftovers', 'Three years after the disappearance of two percent of the global population, a group of people in a small New York community try to continue their lives while coping with the tragedy of the unexplained nature of the event.', 2014, 60, '4.5', 93, 2, '2020-03-20 23:26:47'),
(278, 'Westworld', 'Set at the intersection of the near future and the reimagined past, explore a world in which every human appetite can be indulged without consequence.', 2016, 62, '4.6', 78, 2, '2020-03-20 23:26:17'),
(279, 'Better Call Saul', 'The trials and tribulations of criminal lawyer Jimmy McGill in the time before he established his strip-mall law office in Albuquerque, New Mexico.', 2015, 46, '4.2', 82, 2, '2020-03-20 23:27:58'),
(280, 'Breaking Bad', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family\'s future.', 2008, 49, '4.8', 91, 2, '2020-03-20 23:31:19'),
(281, 'Succession', 'Succession follows a dysfunctional American global-media family.', 2018, 60, '4.3', 76, 2, '2020-03-20 23:33:31'),
(282, 'Mr. Robot', 'Elliot, a brilliant but highly unstable young cyber-security engineer and vigilante hacker, becomes a key figure in a complex game of global dominance when he and his shadowy allies try to take down the corrupt corporation he works for.', 2015, 49, '4.4', 87, 2, '2020-03-20 23:35:43'),
(283, 'Fargo', 'Various chronicles of deception, intrigue and murder in and around frozen Minnesota. Yet all of these tales mysteriously lead back one way or another to Fargo, North Dakota.', 2014, 53, '4.5', 93, 2, '2020-03-20 23:37:05'),
(284, 'The Crown', 'Follows the political rivalries and romance of Queen Elizabeth II\'s reign and the events that shaped the second half of the twentieth century.', 2016, 58, '4.5', 87, 2, '2020-03-20 23:39:30'),
(285, 'Shameless', 'A scrappy, feisty, fiercely loyal Chicago family makes no apologies.', 2011, 46, '4.1', 88, 2, '2020-03-20 23:44:37'),
(286, 'Vikings', 'Vikings transports us to the brutal and mysterious world of Ragnar Lothbrok, a Viking warrior and farmer who yearns to explore - and raid - the distant shores across the ocean.', 2013, 44, '4.3', 89, 2, '2020-03-20 23:45:48'),
(287, 'Sharp Objects', 'A reporter confronts the psychological demons from her past when she returns to her hometown to cover a violent murder.', 2018, 421, '4.4', 79, 2, '2020-03-20 23:47:12'),
(288, 'Watchmen', 'Set in an alternate history where masked vigilantes are treated as outlaws, Watchmen embraces the nostalgia of the original groundbreaking graphic novel of the same name, while attempting to break new ground of its own.', 2019, 60, '4.1', 82, 2, '2020-03-20 23:49:29'),
(289, 'Chernobyl', 'In April 1986, an explosion at the Chernobyl nuclear power plant in the Union of Soviet Socialist Republics becomes one of the world\'s worst man-made catastrophes.', 2019, 330, '4.8', 92, 2, '2020-03-21 09:51:51'),
(290, 'Veep', 'Former Senator Selina Meyer finds that being Vice President of the United States is nothing like she hoped and everything that everyone ever warned her about.', 2012, 28, '4.1', 86, 2, '2020-03-21 09:52:40'),
(291, 'Barry', 'A hit man from the Midwest moves to Los Angeles and gets caught up in the city\'s theatre arts scene.', 2018, 30, '4.0', 78, 2, '2020-03-21 09:53:42'),
(292, 'Atlanta', 'Based in Atlanta, Earn and his cousin Alfred try to make their way in the world through the rap scene. Along the way they come face to face with social and economic issues touching on race, relationships, poverty, status, and parenthood.', 2016, 30, '4.2', 80, 2, '2020-03-21 09:58:53'),
(293, 'BoJack Horseman', 'BoJack Horseman was the star of the hit television show \"Horsin\' Around\" in the \'80s and \'90s, now he\'s washed up, living in Hollywood, complaining about everything, and wearing colorful sweaters.', 2014, 25, '4.6', 85, 2, '2020-03-21 10:00:06'),
(294, 'Big Little Lies', 'The apparently perfect lives of upper-class mothers, at a prestigious elementary school, unravel to the point of murder when a single-mother moves to their quaint Californian beach town.', 2017, 60, '4.3', 76, 2, '2020-03-21 10:01:15'),
(295, 'Legion', 'David Haller is a troubled young man diagnosed as schizophrenic, but after a strange encounter, he discovers special powers that will change his life forever.', 2017, 60, '4.1', 84, 2, '2020-03-21 10:02:13'),
(296, 'House of Cards', 'A Congressman works with his equally conniving wife to exact revenge on the people who betrayed him.', 2013, 51, '4.7', 91, 2, '2020-03-21 10:03:25'),
(297, 'The Young Pope', 'The beginning of the pontificate of Lenny Belardo, alias Pius XIII, the first American Pope in history.', 2016, 546, '4.1', 84, 2, '2020-03-21 10:04:12'),
(298, 'Daredevil', 'A blind lawyer by day, vigilante by night. Matt Murdock fights the crime of New York as Daredevil.', 2015, 54, '4.6', 81, 2, '2020-03-21 10:05:08'),
(299, 'Rick and Morty', 'An animated series that follows the exploits of a super scientist and his not-so-bright grandson.', 2013, 23, '4.8', 93, 2, '2020-03-21 10:06:30'),
(300, 'The Handmaid\'s Tale', 'Set in a dystopian future, a woman is forced to live as a concubine under a fundamentalist theocratic dictatorship.', 2017, 60, '4.5', 84, 2, '2020-03-21 10:07:56'),
(301, 'Lucifer', 'Lucifer Morningstar has decided he\'s had enough of being the dutiful servant in Hell and decides to spend some time on Earth to better understand humanity. He settles in Los Angeles - the City of Angels.', 2015, 42, '4.6', 91, 2, '2020-03-21 10:09:37');

-- --------------------------------------------------------

--
-- Table structure for table `content_categories`
--

CREATE TABLE `content_categories` (
  `content_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content_categories`
--

INSERT INTO `content_categories` (`content_id`, `category_id`) VALUES
(214, 1),
(214, 2),
(216, 1),
(216, 2),
(218, 1),
(218, 2),
(219, 1),
(219, 2),
(220, 1),
(220, 2),
(221, 1),
(221, 2),
(222, 9),
(222, 10),
(222, 11),
(223, 9),
(223, 12),
(223, 13),
(224, 10),
(224, 13),
(224, 14),
(225, 9),
(225, 10),
(225, 15),
(226, 13),
(226, 14),
(226, 16),
(227, 10),
(227, 17),
(227, 18),
(228, 10),
(229, 13),
(229, 14),
(229, 16),
(230, 12),
(230, 13),
(230, 17),
(231, 12),
(231, 13),
(231, 17),
(232, 10),
(232, 12),
(232, 19),
(233, 10),
(234, 12),
(234, 13),
(234, 17),
(235, 10),
(235, 16),
(235, 20),
(236, 10),
(236, 21),
(237, 10),
(237, 11),
(237, 21),
(238, 10),
(238, 11),
(238, 16),
(239, 10),
(239, 15),
(239, 21),
(240, 10),
(240, 15),
(240, 20),
(241, 10),
(241, 15),
(241, 20),
(242, 9),
(242, 10),
(242, 15),
(243, 10),
(243, 22),
(244, 10),
(244, 18),
(245, 10),
(245, 23),
(246, 10),
(246, 12),
(246, 23),
(247, 10),
(247, 14),
(247, 16),
(248, 10),
(248, 14),
(248, 16),
(249, 10),
(249, 15),
(250, 10),
(250, 11),
(250, 14),
(251, 10),
(251, 19),
(252, 10),
(252, 12),
(252, 13),
(253, 10),
(253, 19),
(254, 10),
(254, 15),
(254, 21),
(255, 10),
(255, 15),
(255, 20),
(256, 13),
(256, 15),
(256, 16),
(257, 10),
(257, 12),
(257, 19),
(258, 10),
(258, 12),
(259, 10),
(259, 12),
(260, 9),
(260, 10),
(260, 21),
(261, 10),
(261, 14),
(261, 19),
(262, 10),
(262, 15),
(262, 20),
(263, 14),
(263, 16),
(264, 10),
(264, 19),
(265, 10),
(265, 20),
(265, 21),
(266, 10),
(266, 19),
(267, 10),
(268, 10),
(268, 12),
(268, 15),
(269, 13),
(269, 14),
(269, 16),
(270, 10),
(270, 12),
(270, 15),
(271, 10),
(272, 13),
(272, 16),
(273, 10),
(273, 13),
(273, 14),
(274, 10),
(274, 21),
(275, 10),
(275, 13),
(275, 18),
(276, 10),
(276, 13),
(276, 16),
(277, 10),
(277, 11),
(277, 18),
(278, 10),
(278, 11),
(278, 14),
(279, 9),
(279, 10),
(280, 9),
(280, 10),
(280, 21),
(281, 10),
(282, 9),
(282, 10),
(282, 21),
(283, 9),
(283, 10),
(283, 21),
(284, 10),
(284, 20),
(285, 10),
(285, 12),
(286, 10),
(286, 13),
(286, 16),
(287, 9),
(287, 10),
(287, 11),
(288, 10),
(288, 11),
(288, 16),
(289, 10),
(289, 20),
(289, 21),
(290, 12),
(291, 9),
(291, 12),
(291, 16),
(292, 10),
(292, 12),
(292, 23),
(293, 10),
(293, 12),
(293, 17),
(294, 9),
(294, 10),
(294, 11),
(295, 10),
(295, 14),
(295, 16),
(296, 10),
(297, 10),
(298, 9),
(298, 10),
(298, 16),
(299, 12),
(299, 13),
(299, 17),
(300, 10),
(300, 14),
(300, 21),
(301, 9),
(301, 10),
(301, 18);

-- --------------------------------------------------------

--
-- Table structure for table `content_images`
--

CREATE TABLE `content_images` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isCover` tinyint(1) NOT NULL,
  `isThumbnail` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content_images`
--

INSERT INTO `content_images` (`id`, `file_name`, `file_path`, `isCover`, `isThumbnail`, `created`, `content_id`) VALUES
(295, 'Deadpool Alpha.png', '../images/cover/295.png', 1, 0, '2020-03-18 20:02:32', 214),
(296, 'Darth Vader 2.jpg', '../images/thumb/296.jpg', 0, 1, '2020-03-18 20:02:32', 214),
(297, 'Darth Vader 2.jpg', '../images/wallpapers/297.jpg', 0, 0, '2020-03-18 20:02:32', 214),
(301, 'Batman.jpg', '../images/cover/301.jpg', 1, 0, '2020-03-18 20:07:28', 216),
(302, 'Batman 2.jpg', '../images/thumb/302.jpg', 0, 1, '2020-03-18 20:07:28', 216),
(303, 'Batman.jpg', '../images/wallpapers/303.jpg', 0, 0, '2020-03-18 20:07:28', 216),
(304, 'Darth Vader.jpg', '../images/wallpapers/304.jpg', 0, 0, '2020-03-18 20:07:28', 216),
(310, 'Black Widow alpha.png', '../images/cover/310.png', 1, 0, '2020-03-18 20:32:54', 218),
(311, 'Batman 2.jpg', '../images/thumb/311.jpg', 0, 1, '2020-03-18 20:32:54', 218),
(312, 'Black Widow alpha.png', '../images/cover/312.png', 1, 0, '2020-03-18 20:35:09', 219),
(313, 'Batman.jpg', '../images/thumb/313.jpg', 0, 1, '2020-03-18 20:35:10', 219),
(314, 'black-widow.png', '../images/cover/314.png', 1, 0, '2020-03-18 20:35:58', 220),
(315, 'bloodshot.jpg', '../images/thumb/315.jpg', 0, 1, '2020-03-18 20:35:58', 220),
(316, 'IMG-5882df5157e995d7b0f1a95ab5da9482-V.jpg', '../images/cover/316.jpg', 1, 0, '2020-03-19 11:42:23', 221),
(317, 'IMG-5882df5157e995d7b0f1a95ab5da9482-V.jpg', '../images/thumb/317.jpg', 0, 1, '2020-03-19 11:42:23', 221),
(318, 'Prisoners.jpg', '../images/cover/318.jpg', 1, 0, '2020-03-19 12:33:31', 222),
(319, 'Prisoners.jpg', '../images/thumb/319.jpg', 0, 1, '2020-03-19 12:33:31', 222),
(320, 'The Grand Budapest Hotel.jpg', '../images/cover/320.jpg', 1, 0, '2020-03-19 13:57:21', 223),
(321, 'The Grand Budapest Hotel.jpg', '../images/thumb/321.jpg', 0, 1, '2020-03-19 13:57:21', 223),
(322, 'Interstellar.jpg', '../images/cover/322.jpg', 1, 0, '2020-03-19 14:05:09', 224),
(323, 'Interstellar.jpg', '../images/thumb/323.jpg', 0, 1, '2020-03-19 14:05:09', 224),
(324, 'Interstellar-wallpaper.jpg', '../images/wallpapers/324.jpg', 0, 0, '2020-03-19 14:05:09', 224),
(325, 'The Wolf of Wall Street.jpg', '../images/cover/325.jpg', 1, 0, '2020-03-19 14:11:13', 225),
(326, 'The Wolf of Wall Street.jpg', '../images/thumb/326.jpg', 0, 1, '2020-03-19 14:11:13', 225),
(327, 'Mad Max -Fury Road.jpg', '../images/cover/327.jpg', 1, 0, '2020-03-19 14:22:19', 226),
(328, 'Mad Max -Fury Road.jpg', '../images/thumb/328.jpg', 0, 1, '2020-03-19 14:22:19', 226),
(329, 'Your Name..jpg', '../images/cover/329.jpg', 1, 0, '2020-03-19 14:25:22', 227),
(330, 'Your Name..jpg', '../images/thumb/330.jpg', 0, 1, '2020-03-19 14:25:22', 227),
(331, 'Manchester by the Sea.jpg', '../images/cover/331.jpg', 1, 0, '2020-03-19 14:33:33', 228),
(332, 'Manchester by the Sea.jpg', '../images/thumb/332.jpg', 0, 1, '2020-03-19 14:33:33', 228),
(333, 'Inception.jpg', '../images/cover/333.jpg', 1, 0, '2020-03-19 14:35:02', 229),
(334, 'Inception.jpg', '../images/thumb/334.jpg', 0, 1, '2020-03-19 14:35:02', 229),
(335, 'Toy Story 3.jpg', '../images/cover/335.jpg', 1, 0, '2020-03-19 14:37:30', 230),
(336, 'Toy Story 3.jpg', '../images/thumb/336.jpg', 0, 1, '2020-03-19 14:37:30', 230),
(337, 'Toy Story 3.jpg', '../images/cover/337.jpg', 1, 0, '2020-03-19 14:40:57', 231),
(338, 'Toy Story 3.jpg', '../images/thumb/338.jpg', 0, 1, '2020-03-19 14:40:57', 231),
(339, 'Paterson.jpg', '../images/cover/339.jpg', 1, 0, '2020-03-19 14:45:21', 232),
(340, 'Paterson.jpg', '../images/thumb/340.jpg', 0, 1, '2020-03-19 14:45:21', 232),
(341, 'Boyhood.jpg', '../images/cover/341.jpg', 1, 0, '2020-03-19 14:49:13', 233),
(342, 'Boyhood.jpg', '../images/thumb/342.jpg', 0, 1, '2020-03-19 14:49:13', 233),
(343, 'Inside out.jpg', '../images/cover/343.jpg', 1, 0, '2020-03-19 14:53:20', 234),
(344, 'Inside out.jpg', '../images/thumb/344.jpg', 0, 1, '2020-03-19 14:53:20', 234),
(345, 'Dunkirk.jpg', '../images/cover/345.jpg', 1, 0, '2020-03-19 19:59:39', 235),
(346, 'Dunkirk.jpg', '../images/thumb/346.jpg', 0, 1, '2020-03-19 19:59:39', 235),
(347, 'Black Swan.jpg', '../images/cover/347.jpg', 1, 0, '2020-03-19 20:02:58', 236),
(348, 'Black Swan.jpg', '../images/thumb/348.jpg', 0, 1, '2020-03-19 20:02:58', 236),
(349, 'Gone Girl.jpg', '../images/cover/349.jpg', 1, 0, '2020-03-19 20:14:35', 237),
(350, 'Gone Girl.jpg', '../images/thumb/350.jpg', 0, 1, '2020-03-19 20:14:35', 237),
(351, 'Blade Runner 2049.jpg', '../images/cover/351.jpg', 1, 0, '2020-03-19 20:21:03', 238),
(352, 'Blade Runner 2049.jpg', '../images/thumb/352.jpg', 0, 1, '2020-03-19 20:21:03', 238),
(353, 'Blade-Runner-2049.jpg', '../images/wallpapers/353.jpg', 0, 0, '2020-03-19 20:21:03', 238),
(354, 'The Imitation Game.jpg', '../images/cover/354.jpg', 1, 0, '2020-03-19 20:23:25', 239),
(355, 'The Imitation Game.jpg', '../images/thumb/355.jpg', 0, 1, '2020-03-19 20:23:25', 239),
(356, '12 Years a Slave.jpg', '../images/cover/356.jpg', 1, 0, '2020-03-19 20:26:39', 240),
(357, '12 Years a Slave.jpg', '../images/thumb/357.jpg', 0, 1, '2020-03-19 20:26:39', 240),
(358, 'The Kings Speech.jpg', '../images/cover/358.jpg', 1, 0, '2020-03-19 20:29:39', 241),
(359, 'The Kings Speech.jpg', '../images/thumb/359.jpg', 0, 1, '2020-03-19 20:29:39', 241),
(360, 'Spotlight.jpg', '../images/cover/360.jpg', 1, 0, '2020-03-19 20:32:33', 242),
(361, 'Spotlight.jpg', '../images/thumb/361.jpg', 0, 1, '2020-03-19 20:32:33', 242),
(362, 'Django Unchained.jpg', '../images/cover/362.jpg', 1, 0, '2020-03-19 20:34:56', 243),
(363, 'Django Unchained.jpg', '../images/thumb/363.jpg', 0, 1, '2020-03-19 20:34:56', 243),
(364, 'The Tree of Life.jpg', '../images/cover/364.jpg', 1, 0, '2020-03-19 20:41:16', 244),
(365, 'The Tree of Life.jpg', '../images/thumb/365.jpg', 0, 1, '2020-03-19 20:41:16', 244),
(366, 'Whiplash.jpg', '../images/cover/366.jpg', 1, 0, '2020-03-19 20:45:19', 245),
(367, 'Whiplash.jpg', '../images/thumb/367.jpg', 0, 1, '2020-03-19 20:45:19', 245),
(368, 'La la Land.jpg', '../images/cover/368.jpg', 1, 0, '2020-03-19 20:47:24', 246),
(369, 'La la Land.jpg', '../images/thumb/369.jpg', 0, 1, '2020-03-19 20:47:24', 246),
(370, 'Logan.jpg', '../images/cover/370.jpg', 1, 0, '2020-03-19 20:51:50', 247),
(371, 'Logan.jpg', '../images/thumb/371.jpg', 0, 1, '2020-03-19 20:51:50', 247),
(372, 'Logan.jpg', '../images/wallpapers/372.jpg', 0, 0, '2020-03-19 20:51:50', 247),
(373, 'Logan.jpg', '../images/cover/373.jpg', 1, 0, '2020-03-19 20:54:19', 248),
(374, 'Logan.jpg', '../images/thumb/374.jpg', 0, 1, '2020-03-19 20:54:19', 248),
(375, 'Logan.jpg', '../images/wallpapers/375.jpg', 0, 0, '2020-03-19 20:54:19', 248),
(376, 'The Social Network.jpg', '../images/cover/376.jpg', 1, 0, '2020-03-19 20:57:12', 249),
(377, 'The Social Network.jpg', '../images/thumb/377.jpg', 0, 1, '2020-03-19 20:57:12', 249),
(378, 'Arrival.jpg', '../images/cover/378.jpg', 1, 0, '2020-03-19 20:58:25', 250),
(379, 'Arrival.jpg', '../images/thumb/379.jpg', 0, 1, '2020-03-19 20:58:25', 250),
(380, 'Before Midnight.jpg', '../images/cover/380.jpg', 1, 0, '2020-03-19 21:00:10', 251),
(381, 'Before Midnight.jpg', '../images/thumb/381.jpg', 0, 1, '2020-03-19 21:00:10', 251),
(382, 'Nebraska.jpg', '../images/cover/382.jpg', 1, 0, '2020-03-19 21:04:05', 252),
(383, 'Nebraska.jpg', '../images/thumb/383.jpg', 0, 1, '2020-03-19 21:04:05', 252),
(384, 'Phantom Thread.jpg', '../images/cover/384.jpg', 1, 0, '2020-03-20 10:54:12', 253),
(385, 'Phantom Thread.jpg', '../images/thumb/385.jpg', 0, 1, '2020-03-20 10:54:12', 253),
(386, 'Argo.jpg', '../images/cover/386.jpg', 1, 0, '2020-03-20 10:57:06', 254),
(387, 'Argo.jpg', '../images/thumb/387.jpg', 0, 1, '2020-03-20 10:57:06', 254),
(388, 'Hacksaw Ridge.jpg', '../images/cover/388.jpg', 1, 0, '2020-03-20 10:59:05', 255),
(389, 'Hacksaw Ridge.jpg', '../images/thumb/389.jpg', 0, 1, '2020-03-20 10:59:05', 255),
(390, 'The Revenant.jpg', '../images/cover/390.jpg', 1, 0, '2020-03-20 11:01:39', 256),
(391, 'The Revenant.jpg', '../images/thumb/391.jpg', 0, 1, '2020-03-20 11:01:39', 256),
(392, 'Moonries Kingdom.jpg', '../images/cover/392.jpg', 1, 0, '2020-03-20 11:04:42', 257),
(393, 'Moonries Kingdom.jpg', '../images/thumb/393.jpg', 0, 1, '2020-03-20 11:04:42', 257),
(394, 'Captain Fantastic.jpg', '../images/cover/394.jpg', 1, 0, '2020-03-20 11:06:50', 258),
(395, 'Captain Fantastic.jpg', '../images/thumb/395.jpg', 0, 1, '2020-03-20 11:06:50', 258),
(396, 'Captain Fantastic.jpg', '../images/cover/396.jpg', 1, 0, '2020-03-20 11:16:48', 259),
(397, 'Captain Fantastic.jpg', '../images/thumb/397.jpg', 0, 1, '2020-03-20 11:16:48', 259),
(398, 'Captain-Fantastic.jpg', '../images/wallpapers/398.jpg', 0, 0, '2020-03-20 11:16:48', 259),
(399, 'Nightcrawler.jpg', '../images/cover/399.jpg', 1, 0, '2020-03-20 11:29:15', 260),
(400, 'Nightcrawler.jpg', '../images/thumb/400.jpg', 0, 1, '2020-03-20 11:29:15', 260),
(401, 'Her.jpg', '../images/cover/401.jpg', 1, 0, '2020-03-20 11:31:35', 261),
(402, 'Her.jpg', '../images/thumb/402.jpg', 0, 1, '2020-03-20 11:31:35', 261),
(403, 'Hidden Figures.jpg', '../images/cover/403.jpg', 1, 0, '2020-03-20 11:33:06', 262),
(404, 'Hidden Figures.jpg', '../images/thumb/404.jpg', 0, 1, '2020-03-20 11:33:06', 262),
(405, 'Edge of Tomorrow.jpg', '../images/cover/405.jpg', 1, 0, '2020-03-20 11:35:08', 263),
(406, 'Edge of Tomorrow.jpg', '../images/thumb/406.jpg', 0, 1, '2020-03-20 11:35:08', 263),
(407, 'The Perks of Being a Wallflower.jpg', '../images/cover/407.jpg', 1, 0, '2020-03-20 11:36:38', 264),
(408, 'The Perks of Being a Wallflower.jpg', '../images/thumb/408.jpg', 0, 1, '2020-03-20 11:36:38', 264),
(409, 'Bridge of Spies.jpg', '../images/cover/409.jpg', 1, 0, '2020-03-20 11:37:50', 265),
(410, 'Bridge of Spies.jpg', '../images/thumb/410.jpg', 0, 1, '2020-03-20 11:37:50', 265),
(411, 'Call Me by Your Name.jpg', '../images/cover/411.jpg', 1, 0, '2020-03-20 11:40:34', 266),
(412, 'Call Me by Your Name.jpg', '../images/thumb/412.jpg', 0, 1, '2020-03-20 11:40:34', 266),
(413, '', '../images/cover/413', 1, 0, '2020-03-20 11:42:19', 267),
(414, 'The Master.jpg', '../images/thumb/414.jpg', 0, 1, '2020-03-20 11:42:19', 267),
(415, 'The Big Short.jpg', '../images/cover/415.jpg', 1, 0, '2020-03-20 11:44:35', 268),
(416, 'The Big Short.jpg', '../images/thumb/416.jpg', 0, 1, '2020-03-20 11:44:35', 268),
(417, 'The Avengers.jpg', '../images/cover/417.jpg', 1, 0, '2020-03-20 11:46:54', 269),
(418, 'The Avengers.jpg', '../images/thumb/418.jpg', 0, 1, '2020-03-20 11:46:54', 269),
(419, 'The Disaster Artist.jpg', '../images/cover/419.jpg', 1, 0, '2020-03-20 11:51:09', 270),
(420, 'The Disaster Artist.jpg', '../images/thumb/420.jpg', 0, 1, '2020-03-20 11:51:09', 270),
(421, 'The Master.jpg', '../images/cover/421.jpg', 1, 0, '2020-03-20 11:58:18', 271),
(422, 'The Master.jpg', '../images/thumb/422.jpg', 0, 1, '2020-03-20 11:58:18', 271),
(423, 'The Dark Knight Rises.jpg', '../images/cover/423.jpg', 1, 0, '2020-03-20 11:59:43', 272),
(424, 'The Dark Knight Rises.jpg', '../images/thumb/424.jpg', 0, 1, '2020-03-20 11:59:43', 272),
(425, 'The Martian.jpg', '../images/cover/425.jpg', 1, 0, '2020-03-20 12:01:34', 273),
(426, 'The Martian.jpg', '../images/thumb/426.jpg', 0, 1, '2020-03-20 12:01:34', 273),
(427, 'Zero Dark Thirty.jpg', '../images/cover/427.jpg', 1, 0, '2020-03-20 12:02:50', 274),
(428, 'Zero Dark Thirty.jpg', '../images/thumb/428.jpg', 0, 1, '2020-03-20 12:02:50', 274),
(429, 'Life of Pie.jpg', '../images/cover/429.jpg', 1, 0, '2020-03-20 12:04:07', 275),
(430, 'Life of Pie.jpg', '../images/thumb/430.jpg', 0, 1, '2020-03-20 12:04:07', 275),
(431, 'Game of Thrones.jpg', '../images/cover/431.jpg', 1, 0, '2020-03-20 23:20:21', 276),
(432, 'Game of Thrones.jpg', '../images/thumb/432.jpg', 0, 1, '2020-03-20 23:20:21', 276),
(433, 'Game of Thrones.jpg', '../images/wallpapers/433.jpg', 0, 0, '2020-03-20 23:20:21', 276),
(434, 'The Leftovers.jpg', '../images/cover/434.jpg', 1, 0, '2020-03-20 23:22:42', 277),
(435, 'The Leftovers.jpg', '../images/thumb/435.jpg', 0, 1, '2020-03-20 23:22:42', 277),
(436, 'Westworld.jpg', '../images/cover/436.jpg', 1, 0, '2020-03-20 23:26:17', 278),
(437, 'Westworld.jpg', '../images/thumb/437.jpg', 0, 1, '2020-03-20 23:26:17', 278),
(438, 'Better Call Saul.jpg', '../images/cover/438.jpg', 1, 0, '2020-03-20 23:27:58', 279),
(439, 'Better Call Saul.jpg', '../images/thumb/439.jpg', 0, 1, '2020-03-20 23:27:58', 279),
(440, 'Breaking Bad.jpg', '../images/cover/440.jpg', 1, 0, '2020-03-20 23:31:19', 280),
(441, 'Breaking Bad.jpg', '../images/thumb/441.jpg', 0, 1, '2020-03-20 23:31:19', 280),
(442, 'Succession.jpg', '../images/cover/442.jpg', 1, 0, '2020-03-20 23:33:31', 281),
(443, 'Succession.jpg', '../images/thumb/443.jpg', 0, 1, '2020-03-20 23:33:31', 281),
(444, 'Mr Robot.jpg', '../images/cover/444.jpg', 1, 0, '2020-03-20 23:35:43', 282),
(445, 'Mr Robot.jpg', '../images/thumb/445.jpg', 0, 1, '2020-03-20 23:35:44', 282),
(446, 'Fargo.jpg', '../images/cover/446.jpg', 1, 0, '2020-03-20 23:37:05', 283),
(447, 'Fargo.jpg', '../images/thumb/447.jpg', 0, 1, '2020-03-20 23:37:05', 283),
(448, 'The Crown.jpg', '../images/cover/448.jpg', 1, 0, '2020-03-20 23:39:30', 284),
(449, 'The Crown.jpg', '../images/thumb/449.jpg', 0, 1, '2020-03-20 23:39:30', 284),
(450, 'Shameless.jpg', '../images/cover/450.jpg', 1, 0, '2020-03-20 23:44:37', 285),
(451, 'Shameless.jpg', '../images/thumb/451.jpg', 0, 1, '2020-03-20 23:44:37', 285),
(452, 'Vikings.jpg', '../images/cover/452.jpg', 1, 0, '2020-03-20 23:45:48', 286),
(453, 'Vikings.jpg', '../images/thumb/453.jpg', 0, 1, '2020-03-20 23:45:48', 286),
(454, 'Sharp Objects.jpg', '../images/cover/454.jpg', 1, 0, '2020-03-20 23:47:12', 287),
(455, 'Sharp Objects.jpg', '../images/thumb/455.jpg', 0, 1, '2020-03-20 23:47:12', 287),
(456, 'Watchmen.jpg', '../images/cover/456.jpg', 1, 0, '2020-03-20 23:49:29', 288),
(457, 'Watchmen.jpg', '../images/thumb/457.jpg', 0, 1, '2020-03-20 23:49:29', 288),
(458, 'Chernobyl.jpg', '../images/cover/458.jpg', 1, 0, '2020-03-21 09:51:51', 289),
(459, 'Chernobyl.jpg', '../images/thumb/459.jpg', 0, 1, '2020-03-21 09:51:51', 289),
(460, 'Veep.jpg', '../images/cover/460.jpg', 1, 0, '2020-03-21 09:52:40', 290),
(461, 'Veep.jpg', '../images/thumb/461.jpg', 0, 1, '2020-03-21 09:52:40', 290),
(462, 'Barry.jpg', '../images/cover/462.jpg', 1, 0, '2020-03-21 09:53:42', 291),
(463, 'Barry.jpg', '../images/thumb/463.jpg', 0, 1, '2020-03-21 09:53:42', 291),
(464, 'Atlanta.jpg', '../images/cover/464.jpg', 1, 0, '2020-03-21 09:58:53', 292),
(465, 'Atlanta.jpg', '../images/thumb/465.jpg', 0, 1, '2020-03-21 09:58:53', 292),
(466, 'BoJack Horseman.jpg', '../images/cover/466.jpg', 1, 0, '2020-03-21 10:00:06', 293),
(467, 'BoJack Horseman.jpg', '../images/thumb/467.jpg', 0, 1, '2020-03-21 10:00:06', 293),
(468, 'Big Little Lies.jpg', '../images/cover/468.jpg', 1, 0, '2020-03-21 10:01:15', 294),
(469, 'Big Little Lies.jpg', '../images/thumb/469.jpg', 0, 1, '2020-03-21 10:01:15', 294),
(470, 'Legion.jpg', '../images/cover/470.jpg', 1, 0, '2020-03-21 10:02:13', 295),
(471, 'Legion.jpg', '../images/thumb/471.jpg', 0, 1, '2020-03-21 10:02:13', 295),
(472, 'House of Cards.jpg', '../images/cover/472.jpg', 1, 0, '2020-03-21 10:03:25', 296),
(473, 'House of Cards.jpg', '../images/thumb/473.jpg', 0, 1, '2020-03-21 10:03:25', 296),
(474, 'The Young Pope.jpg', '../images/cover/474.jpg', 1, 0, '2020-03-21 10:04:12', 297),
(475, 'The Young Pope.jpg', '../images/thumb/475.jpg', 0, 1, '2020-03-21 10:04:12', 297),
(476, 'Daredevil.jpg', '../images/cover/476.jpg', 1, 0, '2020-03-21 10:05:08', 298),
(477, 'Daredevil.jpg', '../images/thumb/477.jpg', 0, 1, '2020-03-21 10:05:08', 298),
(478, 'Rick and Morty.jpg', '../images/cover/478.jpg', 1, 0, '2020-03-21 10:06:30', 299),
(479, 'Rick and Morty.jpg', '../images/thumb/479.jpg', 0, 1, '2020-03-21 10:06:30', 299),
(480, 'The Handmaid-s Tale.jpg', '../images/cover/480.jpg', 1, 0, '2020-03-21 10:07:56', 300),
(481, 'The Handmaid-s Tale.jpg', '../images/thumb/481.jpg', 0, 1, '2020-03-21 10:07:56', 300),
(482, 'Lucifer.jpg', '../images/cover/482.jpg', 1, 0, '2020-03-21 10:09:37', 301),
(483, 'Lucifer.jpg', '../images/thumb/483.jpg', 0, 1, '2020-03-21 10:09:37', 301);

-- --------------------------------------------------------

--
-- Table structure for table `content_resolutions`
--

CREATE TABLE `content_resolutions` (
  `content_id` int(11) NOT NULL,
  `resolution_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content_resolutions`
--

INSERT INTO `content_resolutions` (`content_id`, `resolution_id`) VALUES
(214, 1),
(216, 1),
(216, 2),
(218, 1),
(218, 2),
(219, 1),
(219, 2),
(220, 1),
(220, 2),
(221, 1),
(221, 2),
(222, 1),
(222, 2),
(222, 4),
(223, 1),
(223, 4),
(224, 1),
(224, 2),
(225, 1),
(226, 1),
(226, 2),
(227, 1),
(227, 3),
(227, 4),
(228, 1),
(228, 4),
(229, 1),
(229, 4),
(230, 1),
(230, 2),
(230, 3),
(230, 4),
(231, 1),
(231, 2),
(232, 1),
(232, 4),
(233, 1),
(233, 2),
(234, 1),
(234, 3),
(234, 4),
(235, 1),
(235, 2),
(236, 1),
(236, 4),
(237, 1),
(238, 1),
(238, 2),
(238, 3),
(238, 4),
(239, 1),
(239, 4),
(240, 1),
(241, 1),
(242, 1),
(242, 2),
(242, 3),
(243, 1),
(243, 2),
(243, 3),
(244, 1),
(244, 4),
(245, 1),
(246, 1),
(246, 2),
(247, 1),
(247, 2),
(247, 4),
(248, 1),
(248, 2),
(248, 3),
(248, 4),
(249, 1),
(249, 4),
(250, 1),
(251, 1),
(251, 4),
(252, 1),
(252, 2),
(253, 1),
(253, 4),
(254, 1),
(254, 2),
(255, 1),
(255, 2),
(255, 4),
(256, 1),
(256, 2),
(256, 3),
(256, 4),
(257, 1),
(257, 4),
(258, 1),
(258, 4),
(259, 1),
(259, 2),
(260, 1),
(260, 2),
(261, 1),
(261, 2),
(262, 1),
(263, 1),
(263, 2),
(263, 3),
(263, 4),
(264, 1),
(264, 2),
(264, 3),
(264, 4),
(265, 1),
(266, 1),
(266, 2),
(267, 1),
(267, 2),
(267, 4),
(268, 1),
(268, 2),
(269, 1),
(269, 2),
(269, 3),
(269, 4),
(270, 1),
(270, 4),
(271, 1),
(271, 4),
(272, 1),
(272, 2),
(272, 3),
(272, 4),
(273, 1),
(273, 2),
(274, 1),
(275, 1),
(275, 4),
(276, 1),
(276, 2),
(276, 3),
(276, 4),
(277, 1),
(277, 4),
(278, 1),
(278, 2),
(279, 1),
(280, 1),
(281, 1),
(281, 2),
(282, 1),
(282, 2),
(282, 3),
(282, 4),
(283, 1),
(284, 1),
(284, 4),
(285, 1),
(285, 4),
(286, 1),
(286, 2),
(286, 4),
(287, 1),
(288, 1),
(288, 2),
(288, 3),
(288, 4),
(289, 1),
(289, 2),
(290, 1),
(290, 4),
(291, 1),
(291, 4),
(292, 1),
(292, 4),
(293, 1),
(293, 4),
(294, 1),
(294, 4),
(295, 1),
(295, 4),
(296, 1),
(296, 4),
(297, 1),
(297, 4),
(298, 1),
(298, 4),
(299, 1),
(299, 4),
(300, 1),
(300, 4),
(301, 1),
(301, 2),
(301, 4);

-- --------------------------------------------------------

--
-- Table structure for table `content_types`
--

CREATE TABLE `content_types` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content_types`
--

INSERT INTO `content_types` (`id`, `name`) VALUES
(1, 'Movies'),
(2, 'TV Shows');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`) VALUES
(4, 'account_footer_menu'),
(5, 'authorized_acc_menu'),
(3, 'legal_menu'),
(1, 'nav_menu'),
(2, 'socials_menu');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `href` varchar(255) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `name`, `href`, `menu_id`, `role_id`) VALUES
(1, 'Movies', '/movies.php', 1, NULL),
(2, 'TV Shows', '/tvshows.php', 1, NULL),
(3, 'Contact', '/contact.php', 1, NULL),
(4, 'About', '/about.php', 1, NULL),
(8, 'Facebook', 'https://facebook.com', 2, NULL),
(9, 'Twitter', 'https://twitter.com', 2, NULL),
(10, 'Instagram', 'https://instagram.com', 2, NULL),
(11, 'Privacy', '#', 3, NULL),
(12, 'Terms of Use', '#', 3, NULL),
(13, 'Disclaimer', '#', 3, NULL),
(14, 'DMCA', '#', 3, NULL),
(15, 'Report a Problem', '#', 4, NULL),
(16, 'Login', '/login.php', 4, NULL),
(17, 'Register', '/register.php', 4, NULL),
(27, 'Bookmark List', '/auth/bookmarks.php', 5, 2),
(28, 'Manage content library', '/auth/manage_content_library.php', 5, 1),
(29, 'Account settings', '#', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `resolutions`
--

CREATE TABLE `resolutions` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `resolutions`
--

INSERT INTO `resolutions` (`id`, `name`) VALUES
(1, '1080p'),
(2, '4k'),
(3, '1080p 60fps'),
(4, '720p');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_types`
--

CREATE TABLE `subscription_types` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `period` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscription_types`
--

INSERT INTO `subscription_types` (`id`, `name`, `price`, `period`) VALUES
(1, 'Free trial', '0.00', 7),
(2, 'Monthly', '4.99', 30),
(3, 'Yearly', '39.99', 365);

-- --------------------------------------------------------

--
-- Table structure for table `surveys`
--

CREATE TABLE `surveys` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `surveys`
--

INSERT INTO `surveys` (`id`, `name`, `isActive`) VALUES
(3, 'User experience', 1),
(4, 'Content quality', 1);

-- --------------------------------------------------------

--
-- Table structure for table `survey_questions`
--

CREATE TABLE `survey_questions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `survey_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `survey_questions`
--

INSERT INTO `survey_questions` (`id`, `name`, `survey_id`) VALUES
(4, 'How responsive would you say is this website, in terms of loading time?', 3),
(5, 'From 1 to 5, rate how difficult was navigating through website? (1 - Very Easy, 5 - Very Hard)', 3),
(6, 'Did you have troubles signing in/registering?', 3),
(11, 'Do you find 720p quality as too low?', 4),
(10, 'Please rate video quality of 4k content.', 4);

-- --------------------------------------------------------

--
-- Table structure for table `survey_question_answers`
--

CREATE TABLE `survey_question_answers` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `survey_question_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `survey_question_answers`
--

INSERT INTO `survey_question_answers` (`id`, `name`, `survey_question_id`) VALUES
(6, 'Somewhat responsive', 4),
(5, 'Not responsive', 4),
(7, 'Averagely responsive', 4),
(8, 'Very responsive', 4),
(9, 'Extremely responsive', 4),
(10, '1', 5),
(11, '2', 5),
(12, '3', 5),
(13, '4', 5),
(14, '5', 5),
(15, 'Yes', 6),
(16, 'No', 6),
(17, 'Very bad', 10),
(18, 'Bad', 10),
(19, 'It\'s OK', 10),
(20, 'Very Good', 10),
(21, 'Excellent', 10),
(22, 'Yes', 11),
(23, 'No', 11);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `subscription_types_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role_id`, `subscription_types_id`) VALUES
(13, 'admin@gmail.com', '$2y$10$STjO8rjBZi4ihcNOpLizheHJH3vmKpGeVJXBTf32u4KRJ36BJd6pO', 1, NULL),
(12, 'zarke998@gmail.com', '$2y$10$uTW7y6vUuTmx4RXvSWzesOAoddVqwEG0hMF5jELjWkFeEQu9Yu1di', 2, 1),
(14, 'andrewthezar@gmail.com', '$2y$10$e8pXFpZnmo6DvNsHc6slhu9KxSVqcnkuhQbvJqjzuLRhaDMrdzYQW', 2, 1),
(15, 'pera@ict.edu.rs', '$2y$10$dclrypHRer/hemO3uC5NRO17/3NMyWIiWxiFw5mwEdxAy5K34FBBu', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_bookmarks`
--

CREATE TABLE `user_bookmarks` (
  `user_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_bookmarks`
--

INSERT INTO `user_bookmarks` (`user_id`, `content_id`, `status`) VALUES
(2, 220, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_survey_answers`
--

CREATE TABLE `user_survey_answers` (
  `survey_question_answer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_survey_answers`
--

INSERT INTO `user_survey_answers` (`survey_question_answer_id`, `user_id`) VALUES
(19, 13),
(23, 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_content_types` (`content_types_id`) USING BTREE;

--
-- Indexes for table `content_categories`
--
ALTER TABLE `content_categories`
  ADD PRIMARY KEY (`content_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `content_images`
--
ALTER TABLE `content_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_content_image` (`content_id`) USING BTREE;

--
-- Indexes for table `content_resolutions`
--
ALTER TABLE `content_resolutions`
  ADD PRIMARY KEY (`content_id`,`resolution_id`),
  ADD KEY `resolution_id` (`resolution_id`);

--
-- Indexes for table `content_types`
--
ALTER TABLE `content_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_menu_name` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_role_id` (`role_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `resolutions`
--
ALTER TABLE `resolutions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_types`
--
ALTER TABLE `subscription_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_questions`
--
ALTER TABLE `survey_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_surveyId` (`survey_id`);

--
-- Indexes for table `survey_question_answers`
--
ALTER TABLE `survey_question_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_survey_question_id` (`survey_question_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Role` (`role_id`) USING BTREE,
  ADD KEY `FK_subscription_types` (`subscription_types_id`) USING BTREE;

--
-- Indexes for table `user_bookmarks`
--
ALTER TABLE `user_bookmarks`
  ADD PRIMARY KEY (`user_id`,`content_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `content_id` (`content_id`);

--
-- Indexes for table `user_survey_answers`
--
ALTER TABLE `user_survey_answers`
  ADD PRIMARY KEY (`survey_question_answer_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT for table `content_images`
--
ALTER TABLE `content_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=484;

--
-- AUTO_INCREMENT for table `content_types`
--
ALTER TABLE `content_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `resolutions`
--
ALTER TABLE `resolutions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscription_types`
--
ALTER TABLE `subscription_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `survey_questions`
--
ALTER TABLE `survey_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `survey_question_answers`
--
ALTER TABLE `survey_question_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
