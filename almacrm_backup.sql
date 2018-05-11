-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 11 2018 г., 22:11
-- Версия сервера: 5.7.14
-- Версия PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `almacrm`
--

-- --------------------------------------------------------

--
-- Структура таблицы `agent`
--

CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `company` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `agent`
--

INSERT INTO `agent` (`id`, `company`, `description`, `userId`) VALUES
(1, 'SoftServe', 'SoftServe, Inc.\nSoftServe logo new.png\nType\nPrivate Corporation\nIndustry	Consulting services; Software development; Product and application development\nFounded	1993; 25 years ago in Lviv, Ukraine\nHeadquarters	Europe — Lviv, Ukraine\nUS — Austin, Texas\nArea served\nWorldwide\nKey people\nChristopher Baker (CEO)\nAndriy Stytsyuk (CFO)\nBrian Borack (COO)\nServices	\nCloud\nSaaS\nMobile[specify]\nBig Data/Analytics\nSecurity[specify]\nWebsite	www.softserveinc.com\nFootnotes / references\n[1][2]\nSoftServe, Inc., founded in 1993 in Lviv, Ukraine, is a technology company specializing in consultancy services and software development. SoftServe provides services in the fields of Big data, Internet of Things, cloud computing, DevOps, e-commerce, security, and experience design.', 7),
(2, 'EPAM Systems', 'EPAM Systems, Inc., also known as EPAM, is a global provider of software engineering and IT consulting services headquartered in Newtown, Pennsylvania, United States. The company has software development centers and branch offices in North America, Europe, Asia and Australia. ', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `applicantsapplication`
--

CREATE TABLE `applicantsapplication` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `text` text NOT NULL,
  `authorName` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `facultyId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `applicantsapplication`
--

INSERT INTO `applicantsapplication` (`id`, `title`, `text`, `authorName`, `email`, `facultyId`) VALUES
(1, 'Courses', 'Хочу до вас на курси підготовки до ЗНО!', 'Павло', 'mag88@ma.co', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `disciplineId` int(11) NOT NULL,
  `classTypeId` int(11) NOT NULL,
  `info` text,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `class`
--

INSERT INTO `class` (`id`, `disciplineId`, `classTypeId`, `info`, `date`) VALUES
(1, 4, 3, 'Екзамен буде прийматися в усній формі!', '2018-05-10'),
(2, 2, 1, ' ', '2018-04-21');

-- --------------------------------------------------------

--
-- Структура таблицы `classtype`
--

CREATE TABLE `classtype` (
  `id` int(11) NOT NULL,
  `type` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `classtype`
--

INSERT INTO `classtype` (`id`, `type`) VALUES
(3, 'Exam'),
(1, 'Lection'),
(2, 'Practise'),
(4, 'Test');

-- --------------------------------------------------------

--
-- Структура таблицы `discipline`
--

CREATE TABLE `discipline` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `specialtyId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `discipline`
--

INSERT INTO `discipline` (`id`, `name`, `specialtyId`) VALUES
(1, 'Нереляційні Бази Даних', 1),
(2, 'Машинне Начвання', 1),
(3, 'Методологічні Аспекти Програмної Інженерії', 1),
(4, 'Introduction to Big Data', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `disciplineskill`
--

CREATE TABLE `disciplineskill` (
  `id` int(11) NOT NULL,
  `disciplineId` int(11) NOT NULL,
  `skillId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `disciplineskill`
--

INSERT INTO `disciplineskill` (`id`, `disciplineId`, `skillId`) VALUES
(6, 1, 5),
(1, 2, 4),
(7, 2, 5),
(5, 4, 4),
(8, 4, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `errorreport`
--

CREATE TABLE `errorreport` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `authorName` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `errorreport`
--

INSERT INTO `errorreport` (`id`, `text`, `authorName`, `email`) VALUES
(1, 'Я не розумію як це все працює!', 'Костянтин', 'kostik777@mail.com'),
(2, 'Жодних проблем, система чудова!', 'Ганна', 'gh67@gail.com'),
(3, 'Зареєструйте мене! \nФІ - 4, Інформатика. \n0954587458', 'Катерина Майорова', 'katy@nomail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `faculty`
--

CREATE TABLE `faculty` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `faculty`
--

INSERT INTO `faculty` (`id`, `name`) VALUES
(1, 'Факультет Інформатики'),
(3, 'Факультет Гуманитарних Наук'),
(2, 'Факультет Природничих Наук');

-- --------------------------------------------------------

--
-- Структура таблицы `grade`
--

CREATE TABLE `grade` (
  `id` int(11) NOT NULL,
  `presence` tinyint(1) DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  `studentId` int(11) NOT NULL,
  `classId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `grade`
--

INSERT INTO `grade` (`id`, `presence`, `mark`, `studentId`, `classId`) VALUES
(1, 0, 100, 1, 1),
(2, 1, 96, 2, 1),
(3, 1, 61, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `hostel`
--

CREATE TABLE `hostel` (
  `id` int(11) NOT NULL,
  `address` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `hostel`
--

INSERT INTO `hostel` (`id`, `address`) VALUES
(3, 'Ворзель'),
(1, 'Марини Цвєтаєвої, 14-Б.'),
(2, 'Харківське шосе, 17.');

-- --------------------------------------------------------

--
-- Структура таблицы `housingworker`
--

CREATE TABLE `housingworker` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `housingworker`
--

INSERT INTO `housingworker` (`id`, `userId`) VALUES
(1, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `text` text NOT NULL,
  `date` date NOT NULL,
  `forRole` int(11) DEFAULT NULL,
  `forFaculty` int(11) DEFAULT NULL,
  `postedBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `text`, `date`, `forRole`, `forFaculty`, `postedBy`) VALUES
(1, 'AlmaCRM - найкраща CRM для ВНЗ', '	Організація навчального процесу в університеті є досить складною задачею. При правильному підході варто враховувати кілька визначних факторів. По-перше, це сучасні навчальні програми, що відповідають не лише вимогам Міністерства освіти і науки України, а й реальним вимогам ринку праці. Не менш важливою в сучасному світі є і можливість доступу до усієї необхідної інформації в єдиному джерелі. Іншим фактором вдало побудованого навчального процесу є високий рівень зацікавленості студентів. ', '2018-05-06', NULL, NULL, 1),
(2, 'Новина для викладачів ФІ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2018-05-06', 3, 1, 1),
(3, 'Новина для студентів ФІ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2018-05-06', 2, 1, 1),
(4, 'Новина для агентів ФІ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2018-05-06', 4, NULL, 1),
(5, 'Новина для робітників ЖФ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2018-05-06', 5, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `qualificationprogram`
--

CREATE TABLE `qualificationprogram` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `agentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `qualificationprogram`
--

INSERT INTO `qualificationprogram` (`id`, `name`, `description`, `agentId`) VALUES
(1, 'Java Developer', 'Java розробник з знанням NoSQL', 1),
(2, 'PHP Dev', 'PHP Developer for highload projects', 1),
(3, 'Експерт з машинного навчання', 'Машинне Навчання, Big Data.', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `qualificationprogramskill`
--

CREATE TABLE `qualificationprogramskill` (
  `id` int(11) NOT NULL,
  `qualificationProgramId` int(11) NOT NULL,
  `skillId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `qualificationprogramskill`
--

INSERT INTO `qualificationprogramskill` (`id`, `qualificationProgramId`, `skillId`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 5),
(7, 2, 2),
(5, 2, 5),
(9, 2, 6),
(11, 3, 4),
(15, 3, 5),
(13, 3, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `questionfromstudent`
--

CREATE TABLE `questionfromstudent` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `studentId` int(11) NOT NULL,
  `statusId` int(11) NOT NULL,
  `agentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `questionfromstudent`
--

INSERT INTO `questionfromstudent` (`id`, `text`, `studentId`, `statusId`, `agentId`) VALUES
(1, 'Будь ласка, скажіть, яким є мінімальний робочий графік?', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `strnghts` text NOT NULL,
  `weaknesses` text NOT NULL,
  `score` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `disciplineId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'ADMIN'),
(2, 'STUDENT'),
(3, 'TEACHER'),
(4, 'AGENT'),
(5, 'WORKER');

-- --------------------------------------------------------

--
-- Структура таблицы `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `hostelId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `room`
--

INSERT INTO `room` (`id`, `number`, `size`, `sex`, `hostelId`) VALUES
(1, 101, 1, 1, 1),
(2, 102, 2, 0, 1),
(3, 103, 3, 1, 1),
(4, 104, 4, 0, 1),
(5, 101, 1, 1, 3),
(6, 101, 1, 1, 2),
(7, 102, 2, 0, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `roomchangeapp`
--

CREATE TABLE `roomchangeapp` (
  `id` int(11) NOT NULL,
  `info` text NOT NULL,
  `studentId` int(11) NOT NULL,
  `wanted` varchar(256) NOT NULL,
  `statusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roomchangeapp`
--

INSERT INTO `roomchangeapp` (`id`, `info`, `studentId`, `wanted`, `statusId`) VALUES
(1, 'Primary settlement', 1, 'Size: 1, Male, Hostel: Марини Цвєтаєвої, 14-Б.', 1),
(2, 'Old block', 3, 'Size: 2, Female, Hostel: Марини Цвєтаєвої, 14-Б.', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `skill`
--

CREATE TABLE `skill` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `skill`
--

INSERT INTO `skill` (`id`, `name`, `description`) VALUES
(1, 'Java SE', 'Java Core,\nJava Collections,\nJava FX - фреймворк для побудови графічного інтерфейсу,\nБазові знання з алгоритмів та структур даних.'),
(2, 'PHP', 'Базові знання скриптової мови для веб-розробки PHP.'),
(3, 'ООП', 'Принципи Об\'єктно-орієнтованого програмування'),
(4, 'Машинне навчання', 'Побудова лінійних класифікаторів, Кластеризація, Нейронні мережі.'),
(5, 'NoSQL', 'MongoDB, neo4j, db4o, ORM.'),
(6, 'BI', 'Аналіз і робота з великими данними'),
(8, 'WEB programming', 'PHP JS HTML CSS');

-- --------------------------------------------------------

--
-- Структура таблицы `specialty`
--

CREATE TABLE `specialty` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `facultyId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `specialty`
--

INSERT INTO `specialty` (`id`, `name`, `facultyId`) VALUES
(1, 'Комп\'ютерні науки - МП', 1),
(2, 'Інженерія Програмного Забезпечення - МП', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id`, `status`) VALUES
(1, 'NEW'),
(2, 'archived');

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `entryDate` date NOT NULL,
  `course` int(11) NOT NULL,
  `facultyId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`id`, `dateOfBirth`, `sex`, `entryDate`, `course`, `facultyId`, `userId`) VALUES
(1, '1996-07-12', 1, '2017-09-01', 5, 1, 2),
(2, '1996-05-09', 1, '2017-09-01', 5, 1, 3),
(3, '1995-11-26', 0, '2017-09-01', 5, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `studentroom`
--

CREATE TABLE `studentroom` (
  `id` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `roomId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `studentsapplied`
--

CREATE TABLE `studentsapplied` (
  `id` int(11) NOT NULL,
  `resume` varchar(256) NOT NULL,
  `studentId` int(11) NOT NULL,
  `vacancyId` int(11) NOT NULL,
  `statusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `studentsapplied`
--

INSERT INTO `studentsapplied` (`id`, `resume`, `studentId`, `vacancyId`, `statusId`) VALUES
(1, 'Java SE, Collections Framework, ООП.', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `hoursForConsultations` varchar(256) NOT NULL,
  `facultyId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `teacher`
--

INSERT INTO `teacher` (`id`, `hoursForConsultations`, `facultyId`, `userId`) VALUES
(1, 'Пн, третя пара, 1-108.', 1, 5),
(2, 'Пт, четверта пара, кафедра інформатики.', 1, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `teacherclass`
--

CREATE TABLE `teacherclass` (
  `id` int(11) NOT NULL,
  `teacherId` int(11) NOT NULL,
  `classId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `teacherclass`
--

INSERT INTO `teacherclass` (`id`, `teacherId`, `classId`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `teacherdiscipline`
--

CREATE TABLE `teacherdiscipline` (
  `id` int(11) NOT NULL,
  `teacherId` int(11) NOT NULL,
  `disciplineId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `teacherdiscipline`
--

INSERT INTO `teacherdiscipline` (`id`, `teacherId`, `disciplineId`) VALUES
(6, 1, 1),
(1, 1, 2),
(2, 1, 4),
(3, 2, 1),
(4, 2, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `firstname` varchar(256) NOT NULL,
  `patronymic` varchar(256) DEFAULT NULL,
  `lastname` varchar(256) NOT NULL,
  `phone` varchar(256) NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `firstname`, `patronymic`, `lastname`, `phone`, `roleId`) VALUES
(1, 'ADMIN', '202cb962ac59075b964b07152d234b70', 'Адміністратор', NULL, 'системи', '88005553535', 1),
(2, 's@s', '202cb962ac59075b964b07152d234b70', 'Сергій', 'Олександрович', 'Савченко', '0952062382', 2),
(3, 'ss@ss', '202cb962ac59075b964b07152d234b70', 'Кирило', 'Володимирович', 'Салата', '0956525684', 2),
(4, 'sss@sss', '202cb962ac59075b964b07152d234b70', 'Лідія', 'Анатоліївна', 'Пінчук', '0964875215', 2),
(5, 't@t', '202cb962ac59075b964b07152d234b70', 'Андрій', NULL, 'Глибовець', '0960000000', 3),
(6, 'tt@tt', '202cb962ac59075b964b07152d234b70', 'Семен', NULL, 'Гороховський', '0964578541', 3),
(7, 'a@a', '202cb962ac59075b964b07152d234b70', 'Іван', 'Іванович', 'Іванов', '0956587458', 4),
(8, 'aa@aa', '202cb962ac59075b964b07152d234b70', 'Петро', 'Петрович', 'Петренко', '0457845856', 4),
(9, 'h@h', '202cb962ac59075b964b07152d234b70', 'Оксана', 'Петрівна', 'Шевченко', '0964872154', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `vacancy`
--

CREATE TABLE `vacancy` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `endDate` date NOT NULL,
  `agentId` int(11) NOT NULL,
  `facultyId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `vacancy`
--

INSERT INTO `vacancy` (`id`, `title`, `description`, `endDate`, `agentId`, `facultyId`) VALUES
(1, 'Junior Java Developer', 'We offer a part-time Junior Java Dev position for a student. ', '2018-05-31', 1, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Индексы таблицы `applicantsapplication`
--
ALTER TABLE `applicantsapplication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facultyId` (`facultyId`);

--
-- Индексы таблицы `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disciplineId` (`disciplineId`),
  ADD KEY `classTypeId` (`classTypeId`);

--
-- Индексы таблицы `classtype`
--
ALTER TABLE `classtype`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Индексы таблицы `discipline`
--
ALTER TABLE `discipline`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `specialtyId` (`specialtyId`);

--
-- Индексы таблицы `disciplineskill`
--
ALTER TABLE `disciplineskill`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `disciplineskillCon` (`disciplineId`,`skillId`),
  ADD KEY `skillId` (`skillId`);

--
-- Индексы таблицы `errorreport`
--
ALTER TABLE `errorreport`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentId` (`studentId`),
  ADD KEY `classId` (`classId`);

--
-- Индексы таблицы `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address` (`address`);

--
-- Индексы таблицы `housingworker`
--
ALTER TABLE `housingworker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forRole` (`forRole`),
  ADD KEY `forFaculty` (`forFaculty`),
  ADD KEY `postedBy` (`postedBy`);

--
-- Индексы таблицы `qualificationprogram`
--
ALTER TABLE `qualificationprogram`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agentId` (`agentId`);

--
-- Индексы таблицы `qualificationprogramskill`
--
ALTER TABLE `qualificationprogramskill`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `qualificationprogramskillCon` (`qualificationProgramId`,`skillId`),
  ADD KEY `skillId` (`skillId`);

--
-- Индексы таблицы `questionfromstudent`
--
ALTER TABLE `questionfromstudent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentId` (`studentId`),
  ADD KEY `statusId` (`statusId`),
  ADD KEY `agentId` (`agentId`);

--
-- Индексы таблицы `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentId` (`studentId`),
  ADD KEY `disciplineId` (`disciplineId`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hostelId` (`hostelId`);

--
-- Индексы таблицы `roomchangeapp`
--
ALTER TABLE `roomchangeapp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentId` (`studentId`),
  ADD KEY `statusId` (`statusId`);

--
-- Индексы таблицы `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `specialty`
--
ALTER TABLE `specialty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `facultyId` (`facultyId`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `facultyId` (`facultyId`);

--
-- Индексы таблицы `studentroom`
--
ALTER TABLE `studentroom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `studentroomCon` (`studentId`,`roomId`),
  ADD KEY `roomId` (`roomId`);

--
-- Индексы таблицы `studentsapplied`
--
ALTER TABLE `studentsapplied`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentId` (`studentId`),
  ADD KEY `vacancyId` (`vacancyId`),
  ADD KEY `statusId` (`statusId`);

--
-- Индексы таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `facultyId` (`facultyId`);

--
-- Индексы таблицы `teacherclass`
--
ALTER TABLE `teacherclass`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacherId` (`teacherId`),
  ADD KEY `classId` (`classId`);

--
-- Индексы таблицы `teacherdiscipline`
--
ALTER TABLE `teacherdiscipline`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teacherdisciplineCon` (`teacherId`,`disciplineId`),
  ADD KEY `disciplineId` (`disciplineId`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `roleId` (`roleId`);

--
-- Индексы таблицы `vacancy`
--
ALTER TABLE `vacancy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agentId` (`agentId`),
  ADD KEY `facultyId` (`facultyId`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `agent`
--
ALTER TABLE `agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `applicantsapplication`
--
ALTER TABLE `applicantsapplication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `classtype`
--
ALTER TABLE `classtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `discipline`
--
ALTER TABLE `discipline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `disciplineskill`
--
ALTER TABLE `disciplineskill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `errorreport`
--
ALTER TABLE `errorreport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `grade`
--
ALTER TABLE `grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `hostel`
--
ALTER TABLE `hostel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `housingworker`
--
ALTER TABLE `housingworker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `qualificationprogram`
--
ALTER TABLE `qualificationprogram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `qualificationprogramskill`
--
ALTER TABLE `qualificationprogramskill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `questionfromstudent`
--
ALTER TABLE `questionfromstudent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `roomchangeapp`
--
ALTER TABLE `roomchangeapp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `skill`
--
ALTER TABLE `skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `specialty`
--
ALTER TABLE `specialty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `studentroom`
--
ALTER TABLE `studentroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `studentsapplied`
--
ALTER TABLE `studentsapplied`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `teacherclass`
--
ALTER TABLE `teacherclass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `teacherdiscipline`
--
ALTER TABLE `teacherdiscipline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `vacancy`
--
ALTER TABLE `vacancy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `agent`
--
ALTER TABLE `agent`
  ADD CONSTRAINT `agent_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `applicantsapplication`
--
ALTER TABLE `applicantsapplication`
  ADD CONSTRAINT `applicantsapplication_ibfk_1` FOREIGN KEY (`facultyId`) REFERENCES `faculty` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`disciplineId`) REFERENCES `discipline` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`classTypeId`) REFERENCES `classtype` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `discipline`
--
ALTER TABLE `discipline`
  ADD CONSTRAINT `discipline_ibfk_1` FOREIGN KEY (`specialtyId`) REFERENCES `specialty` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `disciplineskill`
--
ALTER TABLE `disciplineskill`
  ADD CONSTRAINT `disciplineskill_ibfk_1` FOREIGN KEY (`disciplineId`) REFERENCES `discipline` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `disciplineskill_ibfk_2` FOREIGN KEY (`skillId`) REFERENCES `skill` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `housingworker`
--
ALTER TABLE `housingworker`
  ADD CONSTRAINT `housingworker_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`forRole`) REFERENCES `role` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`forFaculty`) REFERENCES `faculty` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `news_ibfk_3` FOREIGN KEY (`postedBy`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `qualificationprogram`
--
ALTER TABLE `qualificationprogram`
  ADD CONSTRAINT `qualificationprogram_ibfk_1` FOREIGN KEY (`agentId`) REFERENCES `agent` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `qualificationprogramskill`
--
ALTER TABLE `qualificationprogramskill`
  ADD CONSTRAINT `qualificationprogramskill_ibfk_1` FOREIGN KEY (`qualificationProgramId`) REFERENCES `qualificationprogram` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `qualificationprogramskill_ibfk_2` FOREIGN KEY (`skillId`) REFERENCES `skill` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `questionfromstudent`
--
ALTER TABLE `questionfromstudent`
  ADD CONSTRAINT `questionfromstudent_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `questionfromstudent_ibfk_2` FOREIGN KEY (`statusId`) REFERENCES `status` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `questionfromstudent_ibfk_3` FOREIGN KEY (`agentId`) REFERENCES `agent` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`disciplineId`) REFERENCES `discipline` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hostelId`) REFERENCES `hostel` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `roomchangeapp`
--
ALTER TABLE `roomchangeapp`
  ADD CONSTRAINT `roomchangeapp_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `roomchangeapp_ibfk_2` FOREIGN KEY (`statusId`) REFERENCES `status` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `specialty`
--
ALTER TABLE `specialty`
  ADD CONSTRAINT `specialty_ibfk_1` FOREIGN KEY (`facultyId`) REFERENCES `faculty` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`facultyId`) REFERENCES `faculty` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `studentroom`
--
ALTER TABLE `studentroom`
  ADD CONSTRAINT `studentroom_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `studentroom_ibfk_2` FOREIGN KEY (`roomId`) REFERENCES `room` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `studentsapplied`
--
ALTER TABLE `studentsapplied`
  ADD CONSTRAINT `studentsapplied_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `studentsapplied_ibfk_2` FOREIGN KEY (`vacancyId`) REFERENCES `vacancy` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `studentsapplied_ibfk_3` FOREIGN KEY (`statusId`) REFERENCES `status` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`facultyId`) REFERENCES `faculty` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `teacherclass`
--
ALTER TABLE `teacherclass`
  ADD CONSTRAINT `teacherclass_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `teacherclass_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `teacherdiscipline`
--
ALTER TABLE `teacherdiscipline`
  ADD CONSTRAINT `teacherdiscipline_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `teacherdiscipline_ibfk_2` FOREIGN KEY (`disciplineId`) REFERENCES `discipline` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `vacancy`
--
ALTER TABLE `vacancy`
  ADD CONSTRAINT `vacancy_ibfk_1` FOREIGN KEY (`agentId`) REFERENCES `agent` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `vacancy_ibfk_2` FOREIGN KEY (`facultyId`) REFERENCES `faculty` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
