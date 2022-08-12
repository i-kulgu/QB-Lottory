CREATE TABLE IF NOT EXISTS `LotteryTickets` (
`id` int(255) NOT NULL AUTO_INCREMENT,
`citizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `LotteryServer` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `HasDrawn` varchar(10) DEFAULT NULL,
  `Payout` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `HasDrawn` (`HasDrawn`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
