# Host: localhost  (Version: 5.5.47)
# Date: 2016-06-15 11:46:29
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES gb2312 */;

#
# Structure for table "yyx_address_multiaddrs"
#

DROP TABLE IF EXISTS `yyx_address_multiaddrs`;
CREATE TABLE `yyx_address_multiaddrs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `category` varchar(10) NOT NULL DEFAULT ' ',
  `account` varchar(50) NOT NULL DEFAULT ' ',
  `wealth_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƹ����� 1Ϊ��� 2Ϊ����',
  `fee` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '������',
  `blockhash` varchar(200) NOT NULL DEFAULT ' ',
  `blockindex` int(11) NOT NULL,
  `m_time` int(10) NOT NULL DEFAULT '0' COMMENT '���ʱ��',
  `txid` varchar(200) NOT NULL COMMENT '���׺�',
  `blocktime` int(10) NOT NULL DEFAULT '0' COMMENT '���ʱ��',
  `amount` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '���',
  `confirmations` int(11) NOT NULL DEFAULT '0' COMMENT 'ȷ�ϴ���',
  `timereceived` bigint(20) NOT NULL,
  `address` varchar(150) NOT NULL DEFAULT ' ',
  `is_load` bit(1) NOT NULL,
  `is_exist` bit(1) NOT NULL,
  `info` varchar(100) DEFAULT '' COMMENT '�û�Ǯ����ַ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`),
  KEY `account` (`account`,`txid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "yyx_address_multiaddrs"
#

/*!40000 ALTER TABLE `yyx_address_multiaddrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `yyx_address_multiaddrs` ENABLE KEYS */;

#
# Structure for table "yyx_bind"
#

DROP TABLE IF EXISTS `yyx_bind`;
CREATE TABLE `yyx_bind` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '���û�',
  `weibo_id` int(11) NOT NULL DEFAULT '0' COMMENT '��΢��',
  `account` varchar(100) DEFAULT NULL COMMENT '���˺�',
  `password` varchar(100) DEFAULT NULL COMMENT '������',
  `datas` text COMMENT '������',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`weibo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "yyx_bind"
#

/*!40000 ALTER TABLE `yyx_bind` DISABLE KEYS */;
/*!40000 ALTER TABLE `yyx_bind` ENABLE KEYS */;

#
# Structure for table "yyx_city"
#

DROP TABLE IF EXISTS `yyx_city`;
CREATE TABLE `yyx_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_index` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=390 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_city"
#

/*!40000 ALTER TABLE `yyx_city` DISABLE KEYS */;
INSERT INTO `yyx_city` VALUES (5,1,5,'ʯ��ׯ��'),(6,2,5,'��ɽ��'),(7,3,5,'�ػʵ���'),(8,4,5,'������'),(9,5,5,'��̨��'),(10,6,5,'������'),(11,7,5,'�żҿ���'),(12,8,5,'�е���'),(13,9,5,'������'),(14,10,5,'�ȷ���'),(15,11,5,'��ˮ��'),(16,1,6,'̫ԭ��'),(17,2,6,'��ͬ��'),(18,3,6,'��Ȫ��'),(19,4,6,'������'),(20,5,6,'������'),(21,6,6,'˷����'),(22,7,6,'������'),(23,8,6,'�˳���'),(24,9,6,'������'),(25,10,6,'�ٷ���'),(26,11,6,'������'),(27,1,7,'̨����'),(28,2,7,'������'),(29,3,7,'��¡��'),(30,4,7,'̨����'),(31,5,7,'̨����'),(32,6,7,'������'),(33,7,7,'������'),(34,8,7,'̨����'),(35,9,7,'������'),(36,10,7,'��԰��'),(37,11,7,'������'),(38,12,7,'������'),(39,13,7,'̨����'),(40,14,7,'�û���'),(41,15,7,'��Ͷ��'),(42,16,7,'������'),(43,17,7,'������'),(44,18,7,'̨����'),(45,19,7,'������'),(46,20,7,'������'),(47,21,7,'�����'),(48,22,7,'̨����'),(49,23,7,'������'),(50,1,8,'������'),(51,2,8,'������'),(52,3,8,'��ɽ��'),(53,4,8,'��˳��'),(54,5,8,'��Ϫ��'),(55,6,8,'������'),(56,7,8,'������'),(57,8,8,'Ӫ����'),(58,9,8,'������'),(59,10,8,'������'),(60,11,8,'�̽���'),(61,12,8,'������'),(62,13,8,'������'),(63,14,8,'��«����'),(64,1,9,'������'),(65,2,9,'������'),(66,3,9,'��ƽ��'),(67,4,9,'��Դ��'),(68,5,9,'ͨ����'),(69,6,9,'��ɽ��'),(70,7,9,'��ԭ��'),(71,8,9,'�׳���'),(72,9,9,'�ӱ߳�����������'),(73,1,10,'��������'),(74,2,10,'���������'),(75,3,10,'�׸���'),(76,4,10,'˫Ѽɽ��'),(77,5,10,'������'),(78,6,10,'������'),(79,7,10,'������'),(80,8,10,'ĵ������'),(81,9,10,'��ľ˹��'),(82,10,10,'��̨����'),(83,11,10,'�ں���'),(84,12,10,'�绯��'),(85,13,10,'���˰������'),(86,1,11,'�Ͼ���'),(87,2,11,'������'),(88,3,11,'������'),(89,4,11,'������'),(90,5,11,'������'),(91,6,11,'��ͨ��'),(92,7,11,'���Ƹ���'),(93,8,11,'������'),(94,9,11,'�γ���'),(95,10,11,'������'),(96,11,11,'����'),(97,12,11,'̩����'),(98,13,11,'��Ǩ��'),(99,1,12,'������'),(100,2,12,'������'),(101,3,12,'������'),(102,4,12,'������'),(103,5,12,'������'),(104,6,12,'������'),(105,7,12,'����'),(106,8,12,'������'),(107,9,12,'��ɽ��'),(108,10,12,'̨����'),(109,11,12,'��ˮ��'),(110,1,13,'�Ϸ���'),(111,2,13,'�ߺ���'),(112,3,13,'������'),(113,4,13,'������'),(114,5,13,'��ɽ��'),(115,6,13,'������'),(116,7,13,'ͭ����'),(117,8,13,'������'),(118,9,13,'��ɽ��'),(119,10,13,'������'),(120,11,13,'������'),(121,12,13,'������'),(122,13,13,'������'),(123,14,13,'������'),(124,15,13,'������'),(125,16,13,'������'),(126,17,13,'������'),(127,1,14,'������'),(128,2,14,'������'),(129,3,14,'������'),(130,4,14,'������'),(131,5,14,'Ȫ����'),(132,6,14,'������'),(133,7,14,'��ƽ��'),(134,8,14,'������'),(135,9,14,'������'),(136,1,15,'�ϲ���'),(137,2,15,'��������'),(138,3,15,'Ƽ����'),(139,4,15,'�Ž���'),(140,5,15,'������'),(141,6,15,'ӥ̶��'),(142,7,15,'������'),(143,8,15,'������'),(144,9,15,'�˴���'),(145,10,15,'������'),(146,11,15,'������'),(147,1,16,'������'),(148,2,16,'�ൺ��'),(149,3,16,'�Ͳ���'),(150,4,16,'��ׯ��'),(151,5,16,'��Ӫ��'),(152,6,16,'��̨��'),(153,7,16,'Ϋ����'),(154,8,16,'������'),(155,9,16,'̩����'),(156,10,16,'������'),(157,11,16,'������'),(158,12,16,'������'),(159,13,16,'������'),(160,14,16,'������'),(161,15,16,'�ĳ���'),(162,16,16,'������'),(163,17,16,'������'),(164,1,17,'֣����'),(165,2,17,'������'),(166,3,17,'������'),(167,4,17,'ƽ��ɽ��'),(168,5,17,'������'),(169,6,17,'�ױ���'),(170,7,17,'������'),(171,8,17,'������'),(172,9,17,'�����'),(173,10,17,'�����'),(174,11,17,'�����'),(175,12,17,'����Ͽ��'),(176,13,17,'������'),(177,14,17,'������'),(178,15,17,'������'),(179,16,17,'�ܿ���'),(180,17,17,'פ�����'),(181,18,17,'��Դ��'),(182,1,18,'�人��'),(183,2,18,'��ʯ��'),(184,3,18,'ʮ����'),(185,4,18,'������'),(186,5,18,'�˲���'),(187,6,18,'�差��'),(188,7,18,'������'),(189,8,18,'������'),(190,9,18,'Т����'),(191,10,18,'�Ƹ���'),(192,11,18,'������'),(193,12,18,'������'),(194,13,18,'������'),(195,14,18,'������'),(196,15,18,'Ǳ����'),(197,16,18,'��ũ������'),(198,17,18,'��ʩ����������������'),(199,1,19,'��ɳ��'),(200,2,19,'������'),(201,3,19,'��̶��'),(202,4,19,'������'),(203,5,19,'������'),(204,6,19,'������'),(205,7,19,'������'),(206,8,19,'�żҽ���'),(207,9,19,'������'),(208,10,19,'������'),(209,11,19,'������'),(210,12,19,'������'),(211,13,19,'¦����'),(212,14,19,'��������������������'),(213,1,20,'������'),(214,2,20,'������'),(215,3,20,'�麣��'),(216,4,20,'��ͷ��'),(217,5,20,'�ع���'),(218,6,20,'��ɽ��'),(219,7,20,'������'),(220,8,20,'տ����'),(221,9,20,'ï����'),(222,10,20,'������'),(223,11,20,'������'),(224,12,20,'÷����'),(225,13,20,'��β��'),(226,14,20,'��Դ��'),(227,15,20,'������'),(228,16,20,'��Զ��'),(229,17,20,'��ݸ��'),(230,18,20,'��ɽ��'),(231,19,20,'������'),(232,20,20,'������'),(233,21,20,'�Ƹ���'),(234,1,21,'������'),(235,2,21,'�����'),(236,3,21,'������'),(237,4,21,'��ˮ��'),(238,5,21,'��������'),(239,6,21,'������'),(240,7,21,'��Ҵ��'),(241,8,21,'ƽ����'),(242,9,21,'��Ȫ��'),(243,10,21,'������'),(244,11,21,'������'),(245,12,21,'¤����'),(246,13,21,'���Ļ���������'),(247,14,21,'���ϲ���������'),(248,1,22,'�ɶ���'),(249,2,22,'�Թ���'),(250,3,22,'��֦����'),(251,4,22,'������'),(252,5,22,'������'),(253,6,22,'������'),(254,7,22,'��Ԫ��'),(255,8,22,'������'),(256,9,22,'�ڽ���'),(257,10,22,'��ɽ��'),(258,11,22,'�ϳ���'),(259,12,22,'üɽ��'),(260,13,22,'�˱���'),(261,14,22,'�㰲��'),(262,15,22,'������'),(263,16,22,'�Ű���'),(264,17,22,'������'),(265,18,22,'������'),(266,19,22,'���Ӳ���Ǽ��������'),(267,20,22,'���β���������'),(268,21,22,'��ɽ����������'),(269,1,23,'������'),(270,2,23,'����ˮ��'),(271,3,23,'������'),(272,4,23,'��˳��'),(273,5,23,'ͭ�ʵ���'),(274,6,23,'�Ͻڵ���'),(275,7,23,'ǭ���ϲ���������������'),(276,8,23,'ǭ�������嶱��������'),(277,9,23,'ǭ�ϲ���������������'),(278,1,24,'������'),(279,2,24,'������'),(280,3,24,'��ָɽ��'),(281,4,24,'����'),(282,5,24,'������'),(283,6,24,'�Ĳ���'),(284,7,24,'������'),(285,8,24,'������'),(286,9,24,'������'),(287,10,24,'������'),(288,11,24,'�Ͳ���'),(289,12,24,'�ٸ���'),(290,13,24,'��ɳ����������'),(291,14,24,'��������������'),(292,15,24,'�ֶ�����������'),(293,16,24,'��ˮ����������'),(294,17,24,'��ͤ��������������'),(295,18,24,'������������������'),(296,1,25,'������'),(297,2,25,'������'),(298,3,25,'��Ϫ��'),(299,4,25,'��ɽ��'),(300,5,25,'��ͨ��'),(301,6,25,'������'),(302,7,25,'˼é��'),(303,8,25,'�ٲ���'),(304,9,25,'��ɽ׳������������'),(305,10,25,'��ӹ���������������'),(306,11,25,'��˫���ɴ���������'),(307,12,25,'��������������'),(308,13,25,'�������������'),(309,14,25,'�º���徰����������'),(310,15,25,'ŭ��������������'),(311,16,25,'�������������'),(312,1,26,'������'),(313,2,26,'��������'),(314,3,26,'��������������'),(315,4,26,'���ϲ���������'),(316,5,26,'���ϲ���������'),(317,6,26,'�������������'),(318,7,26,'��������������'),(319,8,26,'�����ɹ������������'),(320,1,27,'������'),(321,2,27,'ͭ����'),(322,3,27,'������'),(323,4,27,'������'),(324,5,27,'μ����'),(325,6,27,'�Ӱ���'),(326,7,27,'������'),(327,8,27,'������'),(328,9,27,'������'),(329,10,27,'������'),(330,1,28,'������'),(331,2,28,'������'),(332,3,28,'������'),(333,4,28,'������'),(334,5,28,'������'),(335,6,28,'���Ǹ���'),(336,7,28,'������'),(337,8,28,'�����'),(338,9,28,'������'),(339,10,28,'��ɫ��'),(340,11,28,'������'),(341,12,28,'�ӳ���'),(342,13,28,'������'),(343,14,28,'������'),(344,1,29,'������'),(345,2,29,'��������'),(346,3,29,'��������'),(347,4,29,'ɽ�ϵ���'),(348,5,29,'�տ������'),(349,6,29,'�������'),(350,7,29,'��֥����'),(351,1,30,'������'),(352,2,30,'ʯ��ɽ��'),(353,3,30,'������'),(354,4,30,'��ԭ��'),(355,5,30,'������'),(356,1,31,'��³ľ����'),(357,2,31,'����������'),(358,3,31,'ʯ�����С�'),(359,4,31,'��������'),(360,5,31,'ͼľ�����'),(361,6,31,'�������'),(362,7,31,'��³����'),(363,8,31,'��������'),(364,9,31,'��ʲ��'),(365,10,31,'������'),(366,11,31,'������'),(367,12,31,'��ͼʲ��'),(368,13,31,'�������'),(369,14,31,'�����С�'),(370,15,31,'������'),(371,16,31,'��Ȫ��'),(372,17,31,'������'),(373,18,31,'������'),(374,19,31,'������'),(375,20,31,'������'),(376,21,31,'������'),(377,22,31,'����̩��'),(378,1,32,'���ͺ�����'),(379,2,32,'��ͷ��'),(380,3,32,'�ں���'),(381,4,32,'�����'),(382,5,32,'ͨ����'),(383,6,32,'������˹��'),(384,7,32,'���ױ�����'),(385,8,32,'�����׶���'),(386,9,32,'�����첼��'),(387,10,32,'���ֹ�����'),(388,11,32,'�˰���'),(389,12,32,'��������');
/*!40000 ALTER TABLE `yyx_city` ENABLE KEYS */;

#
# Structure for table "yyx_config"
#

DROP TABLE IF EXISTS `yyx_config`;
CREATE TABLE `yyx_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '��������',
  `tab` varchar(10) NOT NULL DEFAULT '' COMMENT '����ѡ�',
  `type` varchar(20) DEFAULT NULL COMMENT '�����õ����ͣ�text���ı������password�����������textarea���ı�����select��������ѡ��checkbox, ��ѡ�� ; radio , ��ѡ�� ;  file,�ļ��ϴ���hidden , ���ؿ�',
  `options` text COMMENT '��ѡֵ,ֻ��type�ֶ�Ϊselect,optionsʱ����ֵ, ��,�ŷָ���ֵ',
  `key` varchar(50) DEFAULT NULL COMMENT '���ü�',
  `value` text COMMENT '����ֵ',
  `sort_num` smallint(4) DEFAULT '0' COMMENT '����',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_config"
#

/*!40000 ALTER TABLE `yyx_config` DISABLE KEYS */;
INSERT INTO `yyx_config` VALUES (1,'','email','radio','mail,mail|smtp,smtp','email_service_type','',0),(2,'','email','text','','email_smtp','',0),(3,'','email','text','','email_server_port','',0),(4,'','email','text','','email_send_email','',0),(5,'','email','text','','email_send_email_password','',0),(6,'','email','text','','email_reply_email','',0),(7,'','email','radio','0,��|1,��','email_ssl','0',0),(8,'','basic','text','','site_name','��վ����',0),(9,'','basic','text','','beian','��ICP��11111111��',0),(10,'','basic','text','','copyright','Copyright ? 2012-2013 Yuyanxing ��Ȩ����',0),(11,'','money','text','','integral_invite','100',100),(12,'','money','text','','recharge_inviter_reward','0.1',100),(13,'','pay','text','','alipay_parter_id','',0),(14,'','pay','text','','alipay_parter_key','',0),(15,'','pay','text','','alipay_parter_account','',0),(16,'','money','text','','integral_share','50',100),(17,'','placard','textarea','','placard','����ϵͳ��ׯ�ҷֱȵ���Ϊ��ׯ��ȫ�������10%��ϵͳ�۳������λׯ��������ע�⡣ ',0),(18,'','money','text','','guess_tax','0.1',100),(19,'','money','radio','0,����|1,�ر�','guess_add_check','0',0),(20,'','money','radio','0,����|1,�ر�','guess_custom_add_check','0',0),(21,'','basic','radio','0,�ر�|1,����','invite_open','0',0),(26,'','money','text','','integral_register','50',100),(27,'','money','text','','integral_user_info','50',100),(28,'','ad','textarea',NULL,'ad','<img width=\"270\" height=\"129\" src=\"http://www.baidu.com/img/bdlogo.gif\">',0),(29,'','basic','text',NULL,'wx_account','',0),(30,'','basic','text',NULL,'admin_email','',0),(31,'','basic','text',NULL,'sina_weibo','',0),(32,'','basic','text',NULL,'qq_weibo','',0),(33,'','money','text','','wealth_register','50',100),(34,'','money','text','','wealth_btc_register','50',100),(35,'','money','text','','wealth_ltc_register','50',100),(36,'','money','text','','wealth_doge_register','50',100),(37,'','chongzhi','text','','chongzhi_url','http://150.129.41.71:8081',0),(38,'','chongzhi','text','','chongzhi_account','linkcoinuser',0),(39,'','chongzhi','text','','chongzhi_password','linkcoinpassword',0);
/*!40000 ALTER TABLE `yyx_config` ENABLE KEYS */;

#
# Structure for table "yyx_custom_type"
#

DROP TABLE IF EXISTS `yyx_custom_type`;
CREATE TABLE `yyx_custom_type` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '' COMMENT '����',
  `sort_num` int(11) NOT NULL DEFAULT '0' COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_custom_type"
#

/*!40000 ALTER TABLE `yyx_custom_type` DISABLE KEYS */;
INSERT INTO `yyx_custom_type` VALUES (1,'��ʳ',0),(2,'KTV',0),(3,'����',0),(4,'�Ⱦ�',0);
/*!40000 ALTER TABLE `yyx_custom_type` ENABLE KEYS */;

#
# Structure for table "yyx_email_template"
#

DROP TABLE IF EXISTS `yyx_email_template`;
CREATE TABLE `yyx_email_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '��������',
  `subject` varchar(200) NOT NULL DEFAULT '' COMMENT '�ʼ�����',
  `key` varchar(50) DEFAULT NULL COMMENT '��',
  `value` text COMMENT 'ֵ',
  `description` text COMMENT '����',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_email_template"
#

/*!40000 ALTER TABLE `yyx_email_template` DISABLE KEYS */;
INSERT INTO `yyx_email_template` VALUES (1,'�һ������ʼ�ģ��','�һ�����-Ԥ����','find_password_email','���ã�{account}��������������Ϊ��{url}��30��������Ч��','����˵�����˺���(account), ������������(url)');
/*!40000 ALTER TABLE `yyx_email_template` ENABLE KEYS */;

#
# Structure for table "yyx_exchange"
#

DROP TABLE IF EXISTS `yyx_exchange`;
CREATE TABLE `yyx_exchange` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) unsigned NOT NULL COMMENT '��Ʒ',
  `user_id` int(11) unsigned NOT NULL COMMENT '��Ʒ',
  `is_lottery` tinyint(1) DEFAULT '0' COMMENT '�Ƿ��ǳ齱��Ʒ',
  `is_exchange` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�һ��Ƕһ�',
  `money` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '�һ����',
  `wealth_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '�Ƹ����� 1Ϊ��� 2Ϊ����',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '�ջ�������',
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '�ջ����ֻ�',
  `zip` varchar(15) NOT NULL DEFAULT '' COMMENT '�ʱ�',
  `address` varchar(150) NOT NULL DEFAULT '' COMMENT '�ջ��˵�ַ',
  `send_status` tinyint(1) DEFAULT '0' COMMENT '����״̬��0��δ������1���ѷ�����Ĭ��Ϊ0',
  `receive_status` tinyint(1) DEFAULT '0' COMMENT '�ջ�״̬��0��δ�ջ���1�����ջ���Ĭ��Ϊ0',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "yyx_exchange"
#

/*!40000 ALTER TABLE `yyx_exchange` DISABLE KEYS */;
/*!40000 ALTER TABLE `yyx_exchange` ENABLE KEYS */;

#
# Structure for table "yyx_follow"
#

DROP TABLE IF EXISTS `yyx_follow`;
CREATE TABLE `yyx_follow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��ע��',
  `to_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ע��',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��עʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_uid_2` (`from_uid`,`to_uid`),
  KEY `from_uid` (`from_uid`),
  KEY `to_uid` (`to_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "yyx_follow"
#

/*!40000 ALTER TABLE `yyx_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `yyx_follow` ENABLE KEYS */;

#
# Structure for table "yyx_goods"
#

DROP TABLE IF EXISTS `yyx_goods`;
CREATE TABLE `yyx_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '����',
  `image` varchar(150) DEFAULT '' COMMENT '��ƷͼƬ',
  `detail` text COMMENT '��ϸ',
  `status` tinyint(1) DEFAULT '1' COMMENT '0���¼ܣ�1���ϼܣ�Ĭ��Ϊ1',
  `can_lottery` tinyint(1) DEFAULT '1' COMMENT '�Ƿ��ܳ齱 0:���ܣ� 1:�ܣ� Ĭ��Ϊ1',
  `lottery_count` smallint(4) unsigned NOT NULL DEFAULT '1' COMMENT 'ÿ���û��齱���� 0Ϊ����',
  `lottery_credit` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '�齱�������',
  `probability` double(8,8) NOT NULL DEFAULT '0.00000000' COMMENT '�н�����',
  `can_exchange` tinyint(1) NOT NULL DEFAULT '1' COMMENT '�Ƿ��ܶһ� 0:���ܣ� 1:�ܣ� Ĭ��Ϊ1',
  `money` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '�һ���� 0Ϊ���',
  `wealth_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '�Ƹ����� 1Ϊ��� 2Ϊ����',
  `money_limit` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '�û�������� 0Ϊ������',
  `count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '�����',
  `exchanges` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '��/�ҽ�����',
  `sort_num` smallint(4) DEFAULT '0' COMMENT '����',
  `summary` text NOT NULL,
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "yyx_goods"
#

/*!40000 ALTER TABLE `yyx_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `yyx_goods` ENABLE KEYS */;

#
# Structure for table "yyx_guess"
#

DROP TABLE IF EXISTS `yyx_guess`;
CREATE TABLE `yyx_guess` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL COMMENT '��ׯ�û�',
  `custom` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�������� 0:ϵͳ�淨 1:�Զ���',
  `guess_point_id` int(11) DEFAULT '0' COMMENT '���µ�ID',
  `cate_id` int(11) NOT NULL COMMENT '����Id',
  `tax` double(3,3) NOT NULL COMMENT 'ϵͳ˰�ձ���',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '����',
  `play_start_time` int(10) NOT NULL COMMENT '���뾹�¿�ʼʱ��',
  `play_deadline` int(10) NOT NULL COMMENT '���뾹�½�ֹʱ��',
  `odds_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�������� 0δ֪���� 1Ϊ�̶� 2Ϊ���� 3Ϊ���',
  `wealth_type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '���²Ƹ����� 1Ϊ��� 2Ϊ����, �Զ��徹�¼���ϸ',
  `custom_type` varchar(50) NOT NULL DEFAULT '' COMMENT '�Զ��徹������',
  `play_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '���뾹������',
  `play_wealth` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '���뾹�²Ƹ���',
  `keep_wealth` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '�йܽ��',
  `win_wealth` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '�йܽ��',
  `play_datas` text COMMENT '��������淨����������(�淨ID,�������ͣ�Ͷע������,������������,����)',
  `parameter` text COMMENT '�Զ��徹�µĲ���',
  `play_role` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�����ɫ 0�������ˣ�1������',
  `summary` text COMMENT '���¼��',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '����״̬ 0������ˣ�1�����ͨ�� 2:�ύ�ж� 3������ 4:�ر�',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_guess"
#

/*!40000 ALTER TABLE `yyx_guess` DISABLE KEYS */;
INSERT INTO `yyx_guess` VALUES (1,1,0,1,4,0.100,'ceshi',1444831560,1444843440,1,2,'',0,0.00000000,50.00000000,0.00000000,'a:1:{i:1;O:11:\"PlayWayData\":11:{s:15:\"\0PlayWayData\0id\";s:1:\"1\";s:17:\"\0PlayWayData\0name\";s:15:\"��ʤ���淨\";s:21:\"\0PlayWayData\0oddsType\";i:1;s:25:\"\0PlayWayData\0floatPercent\";i:0;s:30:\"\0PlayWayData\0bettingLowerLimit\";i:0;s:30:\"\0PlayWayData\0bettingUpperLimit\";i:5;s:27:\"\0PlayWayData\0playCountLimit\";i:10;s:22:\"\0PlayWayData\0parameter\";O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:2:\"vd\";s:23:\"\0PlayWayParameter\0label\";s:6:\"ʤ��\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:3:{s:1:\"c\";O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:6:\"oneʤ\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"c\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}s:5:\"equal\";O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:6:\"��ƽ\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:5:\"equal\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:1;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:6:\"twoʤ\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";i:1;s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}}s:23:\"\0PlayWayParameter\0value\";N;}s:17:\"\0PlayWayData\0odds\";a:3:{i:1;i:1;s:1:\"c\";i:1;s:5:\"equal\";i:1;}s:23:\"\0PlayWayData\0playCounts\";a:0:{}s:24:\"\0PlayWayData\0playWealths\";a:0:{}}}','',0,'ffghjk',3,1444831659),(2,1,0,2,4,0.100,'Ӣ��',1445039700,1445047680,2,2,'',4,10.00000000,0.00000000,2.11000000,'a:1:{i:1;O:11:\"PlayWayData\":11:{s:15:\"\0PlayWayData\0id\";s:1:\"1\";s:17:\"\0PlayWayData\0name\";s:15:\"��ʤ���淨\";s:21:\"\0PlayWayData\0oddsType\";i:2;s:25:\"\0PlayWayData\0floatPercent\";d:0.69999999999999996;s:30:\"\0PlayWayData\0bettingLowerLimit\";i:0;s:30:\"\0PlayWayData\0bettingUpperLimit\";i:0;s:27:\"\0PlayWayData\0playCountLimit\";i:0;s:22:\"\0PlayWayData\0parameter\";O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:2:\"vd\";s:23:\"\0PlayWayParameter\0label\";s:6:\"ʤ��\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:3:{s:1:\"c\";O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:12:\"Ӣ��ʤʤ\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"c\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}s:5:\"equal\";O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:6:\"��ƽ\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:5:\"equal\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:1;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:12:\"����ʤʤ\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";i:1;s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}}s:23:\"\0PlayWayParameter\0value\";N;}s:17:\"\0PlayWayData\0odds\";a:0:{}s:23:\"\0PlayWayData\0playCounts\";a:3:{s:1:\"c\";i:1;i:1;i:2;s:5:\"equal\";i:1;}s:24:\"\0PlayWayData\0playWealths\";a:3:{s:1:\"c\";i:1;i:1;i:6;s:5:\"equal\";i:3;}}}','',0,'����������������',3,1445039794),(3,3,0,3,5,0.100,'���׵÷�',1445040000,1445042280,1,2,'',4,11.00000000,13.00000000,3.80000000,'a:1:{i:2;O:11:\"PlayWayData\":11:{s:15:\"\0PlayWayData\0id\";s:1:\"2\";s:17:\"\0PlayWayData\0name\";s:15:\"���ܽ�����\";s:21:\"\0PlayWayData\0oddsType\";i:1;s:25:\"\0PlayWayData\0floatPercent\";i:0;s:30:\"\0PlayWayData\0bettingLowerLimit\";i:0;s:30:\"\0PlayWayData\0bettingUpperLimit\";i:3;s:27:\"\0PlayWayData\0playCountLimit\";i:3;s:22:\"\0PlayWayData\0parameter\";O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:4:\"goal\";s:23:\"\0PlayWayParameter\0label\";s:12:\"�ܽ�����\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:5:{i:0;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:4:\"0��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"0\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:1;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:4:\"1��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"1\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:2;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:4:\"2��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"2\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:3;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:4:\"3��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"3\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}s:2:\"4-\";O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:10:\"4������\";s:28:\"\0PlayWayParameterOption\0type\";s:5:\"range\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:2:\"4-\";s:32:\"\0PlayWayParameterOption\0minValue\";s:1:\"4\";s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}}s:23:\"\0PlayWayParameter\0value\";N;}s:17:\"\0PlayWayData\0odds\";a:5:{i:0;i:1;i:1;d:1.1000000000000001;i:2;d:1.2;i:3;d:1.3;s:2:\"4-\";d:1.3999999999999999;}s:23:\"\0PlayWayData\0playCounts\";a:3:{i:2;i:2;i:1;i:1;s:2:\"4-\";i:1;}s:24:\"\0PlayWayData\0playWealths\";a:3:{i:2;i:5;i:1;i:3;s:2:\"4-\";i:3;}}}','',0,'fasfdasfasfaf',3,1445040158),(4,3,0,4,5,0.100,'����Ӣ��',1445080140,1445080620,1,2,'',4,17.00000000,35.00000000,5.50000000,'a:1:{i:2;O:11:\"PlayWayData\":11:{s:15:\"\0PlayWayData\0id\";s:1:\"2\";s:17:\"\0PlayWayData\0name\";s:15:\"���ܽ�����\";s:21:\"\0PlayWayData\0oddsType\";i:1;s:25:\"\0PlayWayData\0floatPercent\";i:0;s:30:\"\0PlayWayData\0bettingLowerLimit\";i:0;s:30:\"\0PlayWayData\0bettingUpperLimit\";i:5;s:27:\"\0PlayWayData\0playCountLimit\";i:5;s:22:\"\0PlayWayData\0parameter\";O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:4:\"goal\";s:23:\"\0PlayWayParameter\0label\";s:12:\"�ܽ�����\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:5:{i:0;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:4:\"0��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"0\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:1;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:4:\"1��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"1\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:2;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:4:\"2��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"2\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:3;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:4:\"3��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"3\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}s:2:\"4-\";O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:10:\"4������\";s:28:\"\0PlayWayParameterOption\0type\";s:5:\"range\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:2:\"4-\";s:32:\"\0PlayWayParameterOption\0minValue\";s:1:\"4\";s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}}s:23:\"\0PlayWayParameter\0value\";N;}s:17:\"\0PlayWayData\0odds\";a:5:{i:0;i:1;i:1;d:1.1000000000000001;i:2;d:1.2;i:3;d:1.3;s:2:\"4-\";d:1.3999999999999999;}s:23:\"\0PlayWayData\0playCounts\";a:4:{s:2:\"4-\";i:1;i:2;i:1;i:1;i:1;i:3;i:1;}s:24:\"\0PlayWayData\0playWealths\";a:4:{s:2:\"4-\";i:3;i:2;i:4;i:1;i:5;i:3;i:5;}}}','',0,'����˵���Ƿ���',3,1445080270),(5,1,0,5,7,0.100,'������ָ֤��',1445651460,1446254400,2,2,'',1,1.00000000,0.00000000,0.00000000,'a:1:{i:5;O:11:\"PlayWayData\":11:{s:15:\"\0PlayWayData\0id\";s:1:\"5\";s:17:\"\0PlayWayData\0name\";s:12:\"ĩλ����\";s:21:\"\0PlayWayData\0oddsType\";i:2;s:25:\"\0PlayWayData\0floatPercent\";d:0.90000000000000002;s:30:\"\0PlayWayData\0bettingLowerLimit\";i:0;s:30:\"\0PlayWayData\0bettingUpperLimit\";i:0;s:27:\"\0PlayWayData\0playCountLimit\";i:0;s:22:\"\0PlayWayData\0parameter\";O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:2:\"sd\";s:23:\"\0PlayWayParameter\0label\";s:12:\"ĩλ����\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:10:{i:0;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"0\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"0\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:1;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"1\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"1\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:2;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"2\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"2\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:3;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"3\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"3\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:4;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"4\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"4\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:5;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"5\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"5\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:6;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"6\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"6\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:7;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"7\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"7\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:8;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"8\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"8\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:9;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"9\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"9\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}}s:23:\"\0PlayWayParameter\0value\";N;}s:17:\"\0PlayWayData\0odds\";a:0:{}s:23:\"\0PlayWayData\0playCounts\";a:1:{i:0;i:1;}s:24:\"\0PlayWayData\0playWealths\";a:1:{i:0;i:1;}}}','',0,'����˵��',1,1445651604),(6,1,0,5,7,0.100,'������ָ֤��',1445651820,1446254400,2,2,'',1,10.00000000,0.00000000,0.00000000,'a:1:{i:7;O:11:\"PlayWayData\":11:{s:15:\"\0PlayWayData\0id\";s:1:\"7\";s:17:\"\0PlayWayData\0name\";s:18:\"��λ�����淨\";s:21:\"\0PlayWayData\0oddsType\";i:2;s:25:\"\0PlayWayData\0floatPercent\";d:0.80000000000000004;s:30:\"\0PlayWayData\0bettingLowerLimit\";i:10;s:30:\"\0PlayWayData\0bettingUpperLimit\";i:10;s:27:\"\0PlayWayData\0playCountLimit\";i:0;s:22:\"\0PlayWayData\0parameter\";O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:2:\"sd\";s:23:\"\0PlayWayParameter\0label\";s:12:\"��λ����\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:10:{i:0;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"0\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"0\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:1;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"1\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"1\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:2;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"2\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"2\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:3;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"3\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"3\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:4;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"4\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"4\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:5;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"5\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"5\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:6;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"6\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"6\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:7;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"7\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"7\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:8;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"8\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"8\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:9;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"9\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"9\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}}s:23:\"\0PlayWayParameter\0value\";N;}s:17:\"\0PlayWayData\0odds\";a:0:{}s:23:\"\0PlayWayData\0playCounts\";a:1:{i:4;i:1;}s:24:\"\0PlayWayData\0playWealths\";a:1:{i:4;i:10;}}}','',0,'�淨:��λ�����淨/����:��������/��������:80%/Ͷע����:10/Ͷע����:10',1,1445651918),(7,1,0,6,11,0.100,'˫ɫ��',1445652240,1448847060,1,2,'',1,1.00000000,13.00000000,0.00000000,'a:1:{i:4;O:11:\"PlayWayData\":11:{s:15:\"\0PlayWayData\0id\";s:1:\"4\";s:17:\"\0PlayWayData\0name\";s:12:\"ĩλ��˫\";s:21:\"\0PlayWayData\0oddsType\";i:1;s:25:\"\0PlayWayData\0floatPercent\";i:0;s:30:\"\0PlayWayData\0bettingLowerLimit\";i:0;s:30:\"\0PlayWayData\0bettingUpperLimit\";i:2;s:27:\"\0PlayWayData\0playCountLimit\";i:5;s:22:\"\0PlayWayData\0parameter\";O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:2:\"sd\";s:23:\"\0PlayWayParameter\0label\";s:12:\"ĩλ��˫\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:2:{i:1;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:6:\"����\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"1\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:2;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:6:\"˫��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"2\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}}s:23:\"\0PlayWayParameter\0value\";N;}s:17:\"\0PlayWayData\0odds\";a:2:{i:1;d:1.1200000000000001;i:2;d:1.3400000000000001;}s:23:\"\0PlayWayData\0playCounts\";a:1:{i:2;i:1;}s:24:\"\0PlayWayData\0playWealths\";a:1:{i:2;i:1;}}}','',0,'�淨:ĩλ��˫/����:�̶�����/Ͷע����:2/������������:5 �༭ ɾ��',1,1445652344),(8,6,0,6,11,0.100,'˫ɫ��',1445732220,1448847060,1,1,'',3,6.00000000,41.52013800,0.00000000,'a:1:{i:4;O:11:\"PlayWayData\":11:{s:15:\"\0PlayWayData\0id\";s:1:\"4\";s:17:\"\0PlayWayData\0name\";s:12:\"ĩλ��˫\";s:21:\"\0PlayWayData\0oddsType\";i:1;s:25:\"\0PlayWayData\0floatPercent\";i:0;s:30:\"\0PlayWayData\0bettingLowerLimit\";i:0;s:30:\"\0PlayWayData\0bettingUpperLimit\";i:3;s:27:\"\0PlayWayData\0playCountLimit\";i:5;s:22:\"\0PlayWayData\0parameter\";O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:2:\"sd\";s:23:\"\0PlayWayParameter\0label\";s:12:\"ĩλ��˫\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:2:{i:1;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:6:\"����\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"1\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:2;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:6:\"˫��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"2\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}}s:23:\"\0PlayWayParameter\0value\";N;}s:17:\"\0PlayWayData\0odds\";a:2:{i:1;d:1.0000897;i:2;d:2.7680091999999998;}s:23:\"\0PlayWayData\0playCounts\";a:2:{i:2;i:1;i:1;i:2;}s:24:\"\0PlayWayData\0playWealths\";a:2:{i:2;i:2;i:1;i:4;}}}','',0,'�淨:ĩλ��˫/����:�̶�����/Ͷע����:3/������������:5 �༭ ɾ��',1,1445732296),(9,8,0,6,11,0.100,'˫ɫ��',1445739480,1448847060,1,1,'',4,5.83855411,10.10830680,0.00000000,'a:1:{i:4;O:11:\"PlayWayData\":11:{s:15:\"\0PlayWayData\0id\";s:1:\"4\";s:17:\"\0PlayWayData\0name\";s:12:\"ĩλ��˫\";s:21:\"\0PlayWayData\0oddsType\";i:1;s:25:\"\0PlayWayData\0floatPercent\";i:0;s:30:\"\0PlayWayData\0bettingLowerLimit\";i:0;s:30:\"\0PlayWayData\0bettingUpperLimit\";i:3;s:27:\"\0PlayWayData\0playCountLimit\";i:3;s:22:\"\0PlayWayData\0parameter\";O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:2:\"sd\";s:23:\"\0PlayWayParameter\0label\";s:12:\"ĩλ��˫\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:2:{i:1;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:6:\"����\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"1\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:2;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:6:\"˫��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"2\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}}s:23:\"\0PlayWayParameter\0value\";N;}s:17:\"\0PlayWayData\0odds\";a:2:{i:1;d:1.0987654;i:2;d:1.1231452;}s:23:\"\0PlayWayData\0playCounts\";a:2:{i:1;i:3;i:2;i:1;}s:24:\"\0PlayWayData\0playWealths\";a:2:{i:1;d:4.3234001099999997;i:2;d:1.5151539999999999;}}}','',0,'�淨:ĩλ��˫/����:�̶�����/Ͷע����:3/������������:3 �༭ ɾ��',1,1445739575),(10,14,0,5,7,0.100,'������ָ֤��',1445781060,1446254400,2,5,'',0,0.00000000,0.00000000,0.00000000,'a:1:{i:4;O:11:\"PlayWayData\":11:{s:15:\"\0PlayWayData\0id\";s:1:\"4\";s:17:\"\0PlayWayData\0name\";s:12:\"ĩλ��˫\";s:21:\"\0PlayWayData\0oddsType\";i:2;s:25:\"\0PlayWayData\0floatPercent\";d:0.90000000000000002;s:30:\"\0PlayWayData\0bettingLowerLimit\";d:0.111111;s:30:\"\0PlayWayData\0bettingUpperLimit\";d:2.6666660000000002;s:27:\"\0PlayWayData\0playCountLimit\";i:0;s:22:\"\0PlayWayData\0parameter\";O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:2:\"sd\";s:23:\"\0PlayWayParameter\0label\";s:12:\"ĩλ��˫\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:2:{i:1;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:6:\"����\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"1\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:2;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:6:\"˫��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"2\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}}s:23:\"\0PlayWayParameter\0value\";N;}s:17:\"\0PlayWayData\0odds\";a:0:{}s:23:\"\0PlayWayData\0playCounts\";a:0:{}s:24:\"\0PlayWayData\0playWealths\";a:0:{}}}','',0,'���Ͷע   BTCͶע   LTCͶע   DOGEͶע   ����Ͷע\r\n�淨��\r\n  ����淨\r\n�淨:ĩλ��˫/����:��������/��������:90%/Ͷע����:0.111111/Ͷע����:2.666666 �༭ ɾ��',1,1445781146);
/*!40000 ALTER TABLE `yyx_guess` ENABLE KEYS */;

#
# Structure for table "yyx_guess_category"
#

DROP TABLE IF EXISTS `yyx_guess_category`;
CREATE TABLE `yyx_guess_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '����',
  `parent_id` int(11) DEFAULT '0' COMMENT '������',
  `play_ways` text COMMENT '�����淨ID, �����,�ָ�',
  `parameter_count` smallint(2) NOT NULL DEFAULT '1' COMMENT '���µ��������',
  `fixed_odds` tinyint(1) DEFAULT '1' COMMENT '�̶�����״̬ 0�����ã�1��ʹ�ã�Ĭ��Ϊ1',
  `float_odds` tinyint(1) DEFAULT '1' COMMENT '��������״̬ 0�����ã�1��ʹ�ã�Ĭ��Ϊ1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '����ʹ��״̬ 0�����ã�1��ʹ�ã�Ĭ��Ϊ1',
  `sort_num` smallint(4) DEFAULT '0' COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_guess_category"
#

/*!40000 ALTER TABLE `yyx_guess_category` DISABLE KEYS */;
INSERT INTO `yyx_guess_category` VALUES (1,'����',0,'1,2,3',3,1,1,1,0),(2,'�ƾ�',0,'4,5,6,7',1,1,1,1,0),(3,'��Ʊ',0,'4,5,6,7',1,1,1,1,0),(4,'Ӣ��',1,NULL,2,1,1,1,0),(5,'����',1,NULL,2,1,1,1,0),(6,'�г�',1,NULL,2,1,1,1,0),(7,'��֤',2,NULL,1,1,1,1,0),(8,'���',2,NULL,1,1,1,1,0),(9,'����',2,NULL,1,1,1,1,0),(10,'22ѡ5',3,NULL,1,1,1,1,0),(11,'˫ɫ��',3,NULL,1,1,1,1,0),(12,'����3D',3,NULL,1,1,1,1,3),(13,'ŷ��',1,NULL,2,1,1,1,0);
/*!40000 ALTER TABLE `yyx_guess_category` ENABLE KEYS */;

#
# Structure for table "yyx_guess_point"
#

DROP TABLE IF EXISTS `yyx_guess_point`;
CREATE TABLE `yyx_guess_point` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) DEFAULT '0' COMMENT '����Id',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '���µ����',
  `guess_count` int(11) NOT NULL DEFAULT '0' COMMENT '���¸���',
  `play_deadline` int(10) NOT NULL COMMENT '���뾹�½�ֹʱ��',
  `params` text COMMENT '��������',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '���µ�״̬ 0�����ã�1��ʹ�ã�Ĭ��Ϊ1',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_guess_point"
#

/*!40000 ALTER TABLE `yyx_guess_point` DISABLE KEYS */;
INSERT INTO `yyx_guess_point` VALUES (1,4,'ceshi',1,1444845240,'a:3:{i:0;O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:1:\"c\";s:23:\"\0PlayWayParameter\0label\";s:3:\"one\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:0:{}s:23:\"\0PlayWayParameter\0value\";s:1:\"2\";}i:1;O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";i:1;s:23:\"\0PlayWayParameter\0label\";s:3:\"two\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:0:{}s:23:\"\0PlayWayParameter\0value\";s:1:\"3\";}i:2;O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";i:2;s:23:\"\0PlayWayParameter\0label\";s:5:\"three\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:0:{}s:23:\"\0PlayWayParameter\0value\";s:1:\"0\";}}',2,1444830936),(2,4,'Ӣ��',1,1445047680,'a:2:{i:0;O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:1:\"c\";s:23:\"\0PlayWayParameter\0label\";s:9:\"Ӣ��ʤ\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:0:{}s:23:\"\0PlayWayParameter\0value\";s:1:\"1\";}i:1;O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";i:1;s:23:\"\0PlayWayParameter\0label\";s:9:\"����ʤ\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:0:{}s:23:\"\0PlayWayParameter\0value\";s:1:\"1\";}}',2,1445039335),(3,5,'���׵÷�',1,1445042280,'a:2:{i:0;O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:1:\"c\";s:23:\"\0PlayWayParameter\0label\";s:9:\"�¹�Ӯ\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:0:{}s:23:\"\0PlayWayParameter\0value\";s:1:\"3\";}i:1;O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";i:1;s:23:\"\0PlayWayParameter\0label\";s:9:\"����Ӯ\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:0:{}s:23:\"\0PlayWayParameter\0value\";s:1:\"2\";}}',2,1445039522),(4,5,'����Ӣ��',1,1445080620,'a:2:{i:0;O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:1:\"c\";s:23:\"\0PlayWayParameter\0label\";s:6:\"Ӣ��\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:0:{}s:23:\"\0PlayWayParameter\0value\";s:1:\"1\";}i:1;O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";i:1;s:23:\"\0PlayWayParameter\0label\";s:6:\"�¹�\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:0:{}s:23:\"\0PlayWayParameter\0value\";s:1:\"2\";}}',2,1445080077),(5,7,'������ָ֤��',3,1446256200,'a:1:{i:0;O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";i:0;s:23:\"\0PlayWayParameter\0label\";s:9:\"����ֵ\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:0:{}s:23:\"\0PlayWayParameter\0value\";N;}}',1,1445651450),(6,11,'˫ɫ��',3,1448848860,'a:1:{i:0;O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";i:0;s:23:\"\0PlayWayParameter\0label\";s:9:\"123456789\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:0:{}s:23:\"\0PlayWayParameter\0value\";N;}}',1,1445652177);
/*!40000 ALTER TABLE `yyx_guess_point` ENABLE KEYS */;

#
# Structure for table "yyx_invite"
#

DROP TABLE IF EXISTS `yyx_invite`;
CREATE TABLE `yyx_invite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `inviter_id` int(11) unsigned NOT NULL COMMENT '������ID',
  `invitee_id` int(11) unsigned NOT NULL COMMENT '��������ID',
  `recharge_percent` decimal(8,8) NOT NULL DEFAULT '0.00000000' COMMENT '�����ֵ��ɱ���',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�����û�ע�����ͻ���',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inviter_id` (`inviter_id`,`invitee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "yyx_invite"
#

/*!40000 ALTER TABLE `yyx_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `yyx_invite` ENABLE KEYS */;

#
# Structure for table "yyx_io"
#

DROP TABLE IF EXISTS `yyx_io`;
CREATE TABLE `yyx_io` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '֧����ID, 0Ϊϵͳ',
  `to_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '������ID, 0Ϊϵͳ',
  `from_title` varchar(255) NOT NULL DEFAULT '' COMMENT '֧������',
  `to_title` varchar(255) NOT NULL DEFAULT '' COMMENT '�������',
  `type` smallint(3) DEFAULT '0' COMMENT '��֧����,���ֵ��Ͷ��',
  `source_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '��֧ԴID',
  `wealth_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '�Ƹ����� 1Ϊ��� 2Ϊ����',
  `wealth` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '�Ƹ���',
  `tax` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '˰',
  `from_balance` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '֧�������',
  `to_balance` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '���������',
  `summary` text COMMENT '˵��',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_io"
#

/*!40000 ALTER TABLE `yyx_io` DISABLE KEYS */;
INSERT INTO `yyx_io` VALUES (1,0,1,'','ע������',0,0,2,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1444830684),(2,1,0,'����-��������<a class=\'notice_link\' href=\'/guess/view/?id=1\' target=\'_blank\'>ceshi</a>','',0,0,2,50.00000000,0.00000000,0.00000000,0.00000000,NULL,1444831659),(3,0,1,'','��Ӯ0,˰0,�ⶳ50����ׯ����<a class=\'notice_link\' href=\'/guess/view/?id=1\' target=\'_blank\'>ceshi</a>�������',0,0,2,50.00000000,0.00000000,0.00000000,50.00000000,NULL,1444919346),(4,1,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=2\' target=\'_blank\'>Ӣ��</a>','',0,0,2,1.00000000,0.00000000,49.00000000,0.00000000,NULL,1445039867),(5,0,2,'','ע������',0,0,2,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445039924),(6,2,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=2\' target=\'_blank\'>Ӣ��</a>','',0,0,2,2.00000000,0.00000000,48.00000000,0.00000000,NULL,1445039958),(7,0,3,'','ע������',0,0,2,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445040023),(8,3,0,'����-��������<a class=\'notice_link\' href=\'/guess/view/?id=3\' target=\'_blank\'>���׵÷�</a>','',0,0,2,12.60000000,0.00000000,37.40000000,0.00000000,NULL,1445040158),(9,3,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=2\' target=\'_blank\'>Ӣ��</a>','',0,0,2,3.00000000,0.00000000,34.40000000,0.00000000,NULL,1445040212),(10,3,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=3\' target=\'_blank\'>���׵÷�</a>','',0,0,2,2.00000000,0.00000000,32.40000000,0.00000000,NULL,1445040272),(11,2,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=3\' target=\'_blank\'>���׵÷�</a>','',0,0,2,3.00000000,0.00000000,45.00000000,0.00000000,NULL,1445040358),(12,1,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=3\' target=\'_blank\'>���׵÷�</a>','',0,0,2,3.00000000,0.00000000,46.00000000,0.00000000,NULL,1445040423),(13,0,4,'','ע������',0,0,2,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445040609),(14,4,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=3\' target=\'_blank\'>���׵÷�</a>','',0,0,2,3.00000000,0.00000000,47.00000000,0.00000000,NULL,1445040631),(15,4,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=2\' target=\'_blank\'>Ӣ��</a>','',0,0,2,4.00000000,0.00000000,43.00000000,0.00000000,NULL,1445040671),(16,0,3,'','����2,�ⶳ2������<a class=\'notice_link\' href=\'/guess/view/?id=3\' target=\'_blank\'>���׵÷�</a>�������',0,0,2,0.00000000,0.00000000,0.00000000,32.40000000,NULL,1445056277),(17,0,2,'','����3,�ⶳ3������<a class=\'notice_link\' href=\'/guess/view/?id=3\' target=\'_blank\'>���׵÷�</a>�������',0,0,2,0.00000000,0.00000000,0.00000000,45.00000000,NULL,1445056277),(18,0,1,'','����3,�ⶳ3������<a class=\'notice_link\' href=\'/guess/view/?id=3\' target=\'_blank\'>���׵÷�</a>�������',0,0,2,0.00000000,0.00000000,0.00000000,46.00000000,NULL,1445056277),(19,0,4,'','��Ӯ4.2,�ⶳ3������<a class=\'notice_link\' href=\'/guess/view/?id=3\' target=\'_blank\'>���׵÷�</a>�������',0,0,2,7.20000000,0.00000000,0.00000000,50.20000000,NULL,1445056277),(20,0,3,'','��Ӯ3.8,˰0.38,�ⶳ13����ׯ����<a class=\'notice_link\' href=\'/guess/view/?id=3\' target=\'_blank\'>���׵÷�</a>�������',0,0,2,16.42000000,0.00000000,0.00000000,48.82000000,NULL,1445056278),(21,0,1,'','����1,�ⶳ1������<a class=\'notice_link\' href=\'/guess/view/?id=2\' target=\'_blank\'>Ӣ��</a>�������',0,0,2,0.00000000,0.00000000,0.00000000,46.00000000,NULL,1445056294),(22,0,2,'','����2,�ⶳ2������<a class=\'notice_link\' href=\'/guess/view/?id=2\' target=\'_blank\'>Ӣ��</a>�������',0,0,2,0.00000000,0.00000000,0.00000000,45.00000000,NULL,1445056294),(23,0,3,'','��Ӯ4.89,�ⶳ3������<a class=\'notice_link\' href=\'/guess/view/?id=2\' target=\'_blank\'>Ӣ��</a>�������',0,0,2,7.89000000,0.00000000,0.00000000,56.71000000,NULL,1445056294),(24,0,4,'','����4,�ⶳ4������<a class=\'notice_link\' href=\'/guess/view/?id=2\' target=\'_blank\'>Ӣ��</a>�������',0,0,2,0.00000000,0.00000000,0.00000000,50.20000000,NULL,1445056294),(25,0,1,'','��Ӯ2.11,˰0.211,�ⶳ0����ׯ����<a class=\'notice_link\' href=\'/guess/view/?id=2\' target=\'_blank\'>Ӣ��</a>�������',0,0,2,1.90000000,0.00000000,0.00000000,47.90000000,NULL,1445056294),(26,3,0,'����-��������<a class=\'notice_link\' href=\'/guess/view/?id=4\' target=\'_blank\'>����Ӣ��</a>','',0,0,2,35.00000000,0.00000000,21.71000000,0.00000000,NULL,1445080270),(27,3,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=4\' target=\'_blank\'>����Ӣ��</a>','',0,0,2,3.00000000,0.00000000,18.71000000,0.00000000,NULL,1445080448),(28,1,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=4\' target=\'_blank\'>����Ӣ��</a>','',0,0,2,4.00000000,0.00000000,43.90000000,0.00000000,NULL,1445080495),(29,4,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=4\' target=\'_blank\'>����Ӣ��</a>','',0,0,2,5.00000000,0.00000000,45.20000000,0.00000000,NULL,1445080523),(30,2,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=4\' target=\'_blank\'>����Ӣ��</a>','',0,0,2,5.00000000,0.00000000,40.00000000,0.00000000,NULL,1445080558),(31,0,3,'','����3,�ⶳ3������<a class=\'notice_link\' href=\'/guess/view/?id=4\' target=\'_blank\'>����Ӣ��</a>�������',0,0,2,0.00000000,0.00000000,0.00000000,18.71000000,NULL,1445080706),(32,0,1,'','����4,�ⶳ4������<a class=\'notice_link\' href=\'/guess/view/?id=4\' target=\'_blank\'>����Ӣ��</a>�������',0,0,2,0.00000000,0.00000000,0.00000000,43.90000000,NULL,1445080706),(33,0,4,'','����5,�ⶳ5������<a class=\'notice_link\' href=\'/guess/view/?id=4\' target=\'_blank\'>����Ӣ��</a>�������',0,0,2,0.00000000,0.00000000,0.00000000,45.20000000,NULL,1445080706),(34,0,2,'','��Ӯ6.5,�ⶳ5������<a class=\'notice_link\' href=\'/guess/view/?id=4\' target=\'_blank\'>����Ӣ��</a>�������',0,0,2,11.50000000,0.00000000,0.00000000,51.50000000,NULL,1445080706),(35,0,3,'','��Ӯ5.5,˰0.55,�ⶳ35����ׯ����<a class=\'notice_link\' href=\'/guess/view/?id=4\' target=\'_blank\'>����Ӣ��</a>�������',0,0,2,39.95000000,0.00000000,0.00000000,58.66000000,NULL,1445080706),(36,1,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=5\' target=\'_blank\'>������ָ֤��</a>','',0,0,2,1.00000000,0.00000000,42.90000000,0.00000000,NULL,1445651772),(37,1,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=6\' target=\'_blank\'>������ָ֤��</a>','',0,0,2,10.00000000,0.00000000,32.90000000,0.00000000,NULL,1445652014),(38,1,0,'����-��������<a class=\'notice_link\' href=\'/guess/view/?id=7\' target=\'_blank\'>˫ɫ��</a>','',0,0,2,13.40000000,0.00000000,19.50000000,0.00000000,NULL,1445652344),(39,1,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=7\' target=\'_blank\'>˫ɫ��</a>','',0,0,2,1.00000000,0.00000000,18.50000000,0.00000000,NULL,1445652398),(40,0,5,'','ע������',0,0,2,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445730801),(41,0,6,'','ע������',0,0,2,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445731140),(42,0,6,'','ע������',0,0,1,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445731140),(43,6,0,'����-��������<a class=\'notice_link\' href=\'/guess/view/?id=8\' target=\'_blank\'>˫ɫ��</a>','',0,0,1,41.52013800,0.00000000,8.47986200,0.00000000,NULL,1445732297),(44,6,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=8\' target=\'_blank\'>˫ɫ��</a>','',0,0,1,2.00000000,0.00000000,6.47986200,0.00000000,NULL,1445732364),(45,0,7,'','ע������',0,0,2,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445732466),(46,0,7,'','ע������',0,0,1,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445732466),(47,7,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=8\' target=\'_blank\'>˫ɫ��</a>','',0,0,1,2.00000000,0.00000000,48.00000000,0.00000000,NULL,1445739153),(48,0,8,'','ע������',0,0,2,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445739439),(49,0,8,'','ע������',0,0,1,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445739439),(50,8,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=8\' target=\'_blank\'>˫ɫ��</a>','',0,0,1,2.00000000,0.00000000,48.00000000,0.00000000,NULL,1445739465),(51,8,0,'����-��������<a class=\'notice_link\' href=\'/guess/view/?id=9\' target=\'_blank\'>˫ɫ��</a>','',0,0,1,10.10830680,0.00000000,37.89169320,0.00000000,NULL,1445739575),(52,8,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=9\' target=\'_blank\'>˫ɫ��</a>','',0,0,1,2.19999999,0.00000000,35.69169321,0.00000000,NULL,1445741882),(53,6,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=9\' target=\'_blank\'>˫ɫ��</a>','',0,0,1,1.12340000,0.00000000,5.35646200,0.00000000,NULL,1445742224),(54,7,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=9\' target=\'_blank\'>˫ɫ��</a>','',0,0,1,1.00000012,0.00000000,46.99999988,0.00000000,NULL,1445742311),(55,0,9,'','ע������',0,0,2,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445766943),(56,0,9,'','ע������',0,0,1,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445766943),(57,0,10,'','ע������',0,0,2,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445773114),(58,0,10,'','ע������',0,0,1,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445773114),(59,0,10,'','ע������',0,0,1,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445773114),(60,0,10,'','ע������',0,0,1,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445773114),(61,0,10,'','ע������',0,0,1,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445773114),(62,0,11,'','ע������',0,0,2,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445773488),(63,0,11,'','ע������',0,0,1,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445773488),(64,0,11,'','ע������',0,0,4,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445773488),(65,0,11,'','ע������',0,0,3,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445773488),(66,0,11,'','ע������',0,0,5,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445773488),(67,0,12,'','ע������',0,0,2,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445779454),(68,0,12,'','ע������',0,0,1,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445779454),(69,0,12,'','ע������',0,0,4,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445779454),(70,0,12,'','ע������',0,0,3,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445779454),(71,0,12,'','ע������',0,0,5,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445779454),(72,0,13,'','ע������',0,0,2,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445779654),(73,0,13,'','ע������',0,0,1,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445779654),(74,0,13,'','ע������',0,0,4,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445779654),(75,0,13,'','ע������',0,0,3,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445779654),(76,0,13,'','ע������',0,0,5,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445779654),(77,0,14,'','ע������',0,0,2,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445780037),(78,0,14,'','ע������',0,0,1,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445780037),(79,0,14,'','ע������',0,0,4,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445780037),(80,0,14,'','ע������',0,0,3,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445780037),(81,0,14,'','ע������',0,0,5,50.00000000,0.00000000,50.00000000,0.00000000,NULL,1445780037),(82,9,0,'���뾺��<a class=\'notice_link\' href=\'/guess/view/?id=9\' target=\'_blank\'>˫ɫ��</a>','',0,0,1,1.51515400,0.00000000,48.48484600,0.00000000,NULL,1445831080);
/*!40000 ALTER TABLE `yyx_io` ENABLE KEYS */;

#
# Structure for table "yyx_lottery_record"
#

DROP TABLE IF EXISTS `yyx_lottery_record`;
CREATE TABLE `yyx_lottery_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) unsigned NOT NULL COMMENT '��Ʒ',
  `user_id` int(11) unsigned NOT NULL COMMENT '�û�',
  `count` smallint(4) DEFAULT '0' COMMENT '�齱����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "yyx_lottery_record"
#

/*!40000 ALTER TABLE `yyx_lottery_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `yyx_lottery_record` ENABLE KEYS */;

#
# Structure for table "yyx_makers_auth"
#

DROP TABLE IF EXISTS `yyx_makers_auth`;
CREATE TABLE `yyx_makers_auth` (
  `id` int(11) unsigned NOT NULL COMMENT '�û�ID',
  `title` varchar(150) NOT NULL COMMENT '��֤����',
  `summary` text COMMENT '��֤˵��',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '��֤״̬��0δ���� -1�ܾ� 1ͨ��',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "yyx_makers_auth"
#

/*!40000 ALTER TABLE `yyx_makers_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `yyx_makers_auth` ENABLE KEYS */;

#
# Structure for table "yyx_manage_group"
#

DROP TABLE IF EXISTS `yyx_manage_group`;
CREATE TABLE `yyx_manage_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '����',
  `permissions` text COMMENT 'Ȩ�� Array���л�,���ö�����ʶ��Ϊ�±�,Ȩ��ֵ��Ϊֵ;����Ȩ��ֵ����(0ûȨ�� 1���� 2��д 3����д)',
  `summary` text COMMENT '���',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_manage_group"
#

/*!40000 ALTER TABLE `yyx_manage_group` DISABLE KEYS */;
INSERT INTO `yyx_manage_group` VALUES (1,'��������Ա','a:4:{s:18:\"admin@config@index\";s:2:\"on\";s:19:\"admin@config@update\";s:2:\"on\";s:25:\"admin@emailTemplate@index\";s:2:\"on\";s:24:\"admin@emailTemplate@edit\";s:2:\"on\";}','��������Աӵ�����в�����Ȩ��',0);
/*!40000 ALTER TABLE `yyx_manage_group` ENABLE KEYS */;

#
# Structure for table "yyx_manager"
#

DROP TABLE IF EXISTS `yyx_manager`;
CREATE TABLE `yyx_manager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '����',
  `password` varchar(32) DEFAULT NULL COMMENT '����',
  `mobile` varchar(15) DEFAULT NULL COMMENT '�ֻ�',
  `group_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '������ID',
  `allow_login` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ������½ 0�������� 1������',
  `last_login_time` int(10) NOT NULL DEFAULT '0' COMMENT '�ϴε�½ʱ��',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_manager"
#

/*!40000 ALTER TABLE `yyx_manager` DISABLE KEYS */;
INSERT INTO `yyx_manager` VALUES (1,'admin','14e1b600b1fd579f47433b88e8d85291','',1,1,1465790991,1444830231);
/*!40000 ALTER TABLE `yyx_manager` ENABLE KEYS */;

#
# Structure for table "yyx_menu"
#

DROP TABLE IF EXISTS `yyx_menu`;
CREATE TABLE `yyx_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '����',
  `url` varchar(150) NOT NULL DEFAULT '' COMMENT '���ӵ�ַ',
  `parent_id` int(11) DEFAULT '0' COMMENT '���˵�',
  `status` tinyint(1) DEFAULT '1' COMMENT '0������ʾ��1����ʾ��Ĭ��Ϊ1',
  `is_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƿ�Ϊϵͳ���ã�0��1��',
  `sort_num` smallint(4) DEFAULT '0' COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_menu"
#

/*!40000 ALTER TABLE `yyx_menu` DISABLE KEYS */;
INSERT INTO `yyx_menu` VALUES (1,'ϵͳ����','/admin/config/',0,1,0,0),(2,'ϵͳ����','/admin/config/',1,1,0,0),(3,'�˵�����','/admin/menu/',1,1,0,0),(4,'�ʼ�ģ��','/admin/emailTemplate/',1,1,0,0),(5,'����Ա����','/admin/manager/',0,1,0,0),(6,'�޸�����','/admin/password/',5,1,0,0),(7,'����Ա','/admin/manager/',5,1,0,0),(8,'������','/admin/manageGroup/',5,1,0,0),(9,'�̳ǹ���','/admin/exchange/',0,1,0,0),(10,'�һ��齱','/admin/exchange/',9,1,0,0),(11,'��Ʒ����','/admin/goods/',9,1,0,0),(12,'�û�����','/admin/user/',0,1,0,0),(13,'�û�','/admin/user/',12,1,0,0),(14,'��ֵ','/admin/recharge/',12,1,0,0),(15,'���¹���','/admin/guess/',0,1,0,0),(16,'������ׯ','/admin/guess/',15,1,0,0),(17,'���·���','/admin/guessCategory/',15,1,0,0),(18,'���µ�','/admin/guessPoint/',15,1,0,0),(19,'�����淨','/admin/playWay/',15,1,0,0),(20,'���¹���','/admin/news/',0,1,0,0),(21,'���¹���','/admin/news/',20,1,0,0),(22,'�������','/admin/newsCategory/',20,1,0,0),(23,'ׯ����֤','/admin/makersAuth',12,1,0,0),(24,'΢������','/admin/weibo/',1,1,0,0),(25,'�Զ�������','/admin/customType/',15,1,0,0),(26,'���ֹ���','/admin/withdraw/history',12,1,0,0);
/*!40000 ALTER TABLE `yyx_menu` ENABLE KEYS */;

#
# Structure for table "yyx_message"
#

DROP TABLE IF EXISTS `yyx_message`;
CREATE TABLE `yyx_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '�����ˣ�0Ϊϵͳ',
  `to_uid` int(11) unsigned NOT NULL COMMENT '������',
  `reply_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '�ظ���ϢID',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '����',
  `content` text COMMENT '��Ϣ����',
  `new` tinyint(1) NOT NULL DEFAULT '1' COMMENT '�Ƿ�������Ϣ',
  `from_status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '��������Ϣ״̬  2������ 1��ɾ�� 0������ɾ��',
  `to_status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '��������Ϣ״̬  2������ 1��ɾ�� 0������ɾ��',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "yyx_message"
#

/*!40000 ALTER TABLE `yyx_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `yyx_message` ENABLE KEYS */;

#
# Structure for table "yyx_news"
#

DROP TABLE IF EXISTS `yyx_news`;
CREATE TABLE `yyx_news` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '����',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '��Ѷ����',
  `cate_id` int(4) unsigned NOT NULL COMMENT '����ID',
  `content` text COMMENT '����',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '�����',
  `sort_num` int(11) NOT NULL DEFAULT '0' COMMENT '����',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "yyx_news"
#

/*!40000 ALTER TABLE `yyx_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `yyx_news` ENABLE KEYS */;

#
# Structure for table "yyx_news_category"
#

DROP TABLE IF EXISTS `yyx_news_category`;
CREATE TABLE `yyx_news_category` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '' COMMENT '����',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '��������',
  `sort_num` int(11) NOT NULL DEFAULT '0' COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_news_category"
#

/*!40000 ALTER TABLE `yyx_news_category` DISABLE KEYS */;
INSERT INTO `yyx_news_category` VALUES (1,'˵���ĵ�',0,0),(2,'��������',0,0);
/*!40000 ALTER TABLE `yyx_news_category` ENABLE KEYS */;

#
# Structure for table "yyx_notice"
#

DROP TABLE IF EXISTS `yyx_notice`;
CREATE TABLE `yyx_notice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '���������� 0Ϊϵͳ',
  `to_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '֪ͨ������',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '֪ͨ����',
  `new` tinyint(1) NOT NULL DEFAULT '1' COMMENT '�Ƿ�����֪ͨ',
  `notice` text NOT NULL COMMENT '֪ͨ',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '֪ͨʱ��',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0��Ч/1δ��Ӧ/2ͨ��/3�ܾ�',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_notice"
#

/*!40000 ALTER TABLE `yyx_notice` DISABLE KEYS */;
INSERT INTO `yyx_notice` VALUES (1,0,1,'',0,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50����',1444830684,0),(2,0,2,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50����',1445039924,0),(3,0,3,'',0,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50����',1445040023,0),(4,0,4,'',0,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50����',1445040609,0),(5,0,1,'',0,'�㷢���ľ���<a class=\'notice_link\' href=\'/guess/view/?id=5\' target=\'_blank\'>������ָ֤��</a>���ͨ���ѷ���',1445651630,0),(6,0,1,'',0,'�㷢���ľ���<a class=\'notice_link\' href=\'/guess/view/?id=6\' target=\'_blank\'>������ָ֤��</a>���ͨ���ѷ���',1445651931,0),(7,0,1,'',0,'�㷢���ľ���<a class=\'notice_link\' href=\'/guess/view/?id=7\' target=\'_blank\'>˫ɫ��</a>���ͨ���ѷ���',1445652365,0),(8,0,5,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50����',1445730801,0),(9,0,6,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50����',1445731140,0),(10,0,6,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50���',1445731140,0),(11,0,7,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50����',1445732466,0),(12,0,7,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50���',1445732466,0),(13,0,8,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50����',1445739439,0),(14,0,8,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50���',1445739439,0),(15,0,9,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50����',1445766943,0),(16,0,9,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50���',1445766943,0),(17,0,10,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50����',1445773114,0),(18,0,10,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50���',1445773114,0),(19,0,10,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50BTC',1445773114,0),(20,0,10,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50LTC',1445773114,0),(21,0,10,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50DOGE',1445773114,0),(22,0,11,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50����',1445773488,0),(23,0,11,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50���',1445773488,0),(24,0,11,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50BTC',1445773488,0),(25,0,11,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50LTC',1445773488,0),(26,0,11,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50DOGE',1445773488,0),(27,0,12,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50����',1445779454,0),(28,0,12,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50���',1445779454,0),(29,0,12,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50BTC',1445779454,0),(30,0,12,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50LTC',1445779454,0),(31,0,12,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50DOGE',1445779454,0),(32,0,13,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50����',1445779654,0),(33,0,13,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50���',1445779654,0),(34,0,13,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50BTC',1445779654,0),(35,0,13,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50LTC',1445779654,0),(36,0,13,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50DOGE',1445779654,0),(37,0,14,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50����',1445780037,0),(38,0,14,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50���',1445780037,0),(39,0,14,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50BTC',1445780037,0),(40,0,14,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50LTC',1445780037,0),(41,0,14,'',1,'��ӭ��ע���Ϊ��վ���ƻ�Ա��ϵͳ������50DOGE',1445780037,0);
/*!40000 ALTER TABLE `yyx_notice` ENABLE KEYS */;

#
# Structure for table "yyx_password_find"
#

DROP TABLE IF EXISTS `yyx_password_find`;
CREATE TABLE `yyx_password_find` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL COMMENT '�û�ID',
  `code` varchar(32) NOT NULL COMMENT '������',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "yyx_password_find"
#

/*!40000 ALTER TABLE `yyx_password_find` DISABLE KEYS */;
/*!40000 ALTER TABLE `yyx_password_find` ENABLE KEYS */;

#
# Structure for table "yyx_play"
#

DROP TABLE IF EXISTS `yyx_play`;
CREATE TABLE `yyx_play` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL COMMENT '�����û�',
  `custom` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�������� 0:ϵͳ�淨 1:�Զ���',
  `guess_id` int(11) unsigned NOT NULL COMMENT '����ľ���',
  `wealth_type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '���²Ƹ����� 1Ϊ��� 2Ϊ����, �Զ��徹�¼���ϸ',
  `wealth` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '��Ͷע',
  `win_wealth` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '��Ӯ�Ƹ�',
  `play_datas` text COMMENT '�������� PlayData��������',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '�����Ƿ����ж� 1:���ж� 0:δ�ж�',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_play"
#

/*!40000 ALTER TABLE `yyx_play` DISABLE KEYS */;
INSERT INTO `yyx_play` VALUES (1,1,0,2,2,1,-1.00000000,'a:1:{i:1;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"1\";s:21:\"\0PlayData\0playWayName\";s:15:\"��ʤ���淨\";s:18:\"\0PlayData\0oddsType\";i:2;s:16:\"\0PlayData\0wealth\";i:1;s:16:\"\0PlayData\0choose\";s:1:\"c\";s:19:\"\0PlayData\0winWealth\";i:-1;s:14:\"\0PlayData\0play\";N;}}',1,1445039867),(2,2,0,2,2,2,-2.00000000,'a:1:{i:1;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"1\";s:21:\"\0PlayData\0playWayName\";s:15:\"��ʤ���淨\";s:18:\"\0PlayData\0oddsType\";i:2;s:16:\"\0PlayData\0wealth\";i:2;s:16:\"\0PlayData\0choose\";s:1:\"1\";s:19:\"\0PlayData\0winWealth\";i:-2;s:14:\"\0PlayData\0play\";N;}}',1,1445039958),(3,3,0,2,2,3,4.89000000,'a:1:{i:1;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"1\";s:21:\"\0PlayData\0playWayName\";s:15:\"��ʤ���淨\";s:18:\"\0PlayData\0oddsType\";i:2;s:16:\"\0PlayData\0wealth\";i:3;s:16:\"\0PlayData\0choose\";s:5:\"equal\";s:19:\"\0PlayData\0winWealth\";d:4.8899999999999997;s:14:\"\0PlayData\0play\";N;}}',1,1445040212),(4,3,0,3,2,2,-2.00000000,'a:1:{i:2;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"2\";s:21:\"\0PlayData\0playWayName\";s:15:\"���ܽ�����\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";i:2;s:16:\"\0PlayData\0choose\";s:1:\"2\";s:19:\"\0PlayData\0winWealth\";i:-2;s:14:\"\0PlayData\0play\";N;}}',1,1445040272),(5,2,0,3,2,3,-3.00000000,'a:1:{i:2;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"2\";s:21:\"\0PlayData\0playWayName\";s:15:\"���ܽ�����\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";i:3;s:16:\"\0PlayData\0choose\";s:1:\"1\";s:19:\"\0PlayData\0winWealth\";i:-3;s:14:\"\0PlayData\0play\";N;}}',1,1445040358),(6,1,0,3,2,3,-3.00000000,'a:1:{i:2;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"2\";s:21:\"\0PlayData\0playWayName\";s:15:\"���ܽ�����\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";i:3;s:16:\"\0PlayData\0choose\";s:1:\"2\";s:19:\"\0PlayData\0winWealth\";i:-3;s:14:\"\0PlayData\0play\";N;}}',1,1445040423),(7,4,0,3,2,3,4.20000000,'a:1:{i:2;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"2\";s:21:\"\0PlayData\0playWayName\";s:15:\"���ܽ�����\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";i:3;s:16:\"\0PlayData\0choose\";s:2:\"4-\";s:19:\"\0PlayData\0winWealth\";d:4.1999999999999993;s:14:\"\0PlayData\0play\";N;}}',1,1445040631),(8,4,0,2,2,4,-4.00000000,'a:1:{i:1;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"1\";s:21:\"\0PlayData\0playWayName\";s:15:\"��ʤ���淨\";s:18:\"\0PlayData\0oddsType\";i:2;s:16:\"\0PlayData\0wealth\";i:4;s:16:\"\0PlayData\0choose\";s:1:\"1\";s:19:\"\0PlayData\0winWealth\";i:-4;s:14:\"\0PlayData\0play\";N;}}',1,1445040671),(9,3,0,4,2,3,-3.00000000,'a:1:{i:2;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"2\";s:21:\"\0PlayData\0playWayName\";s:15:\"���ܽ�����\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";i:3;s:16:\"\0PlayData\0choose\";s:2:\"4-\";s:19:\"\0PlayData\0winWealth\";i:-3;s:14:\"\0PlayData\0play\";N;}}',1,1445080448),(10,1,0,4,2,4,-4.00000000,'a:1:{i:2;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"2\";s:21:\"\0PlayData\0playWayName\";s:15:\"���ܽ�����\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";i:4;s:16:\"\0PlayData\0choose\";s:1:\"2\";s:19:\"\0PlayData\0winWealth\";i:-4;s:14:\"\0PlayData\0play\";N;}}',1,1445080495),(11,4,0,4,2,5,-5.00000000,'a:1:{i:2;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"2\";s:21:\"\0PlayData\0playWayName\";s:15:\"���ܽ�����\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";i:5;s:16:\"\0PlayData\0choose\";s:1:\"1\";s:19:\"\0PlayData\0winWealth\";i:-5;s:14:\"\0PlayData\0play\";N;}}',1,1445080523),(12,2,0,4,2,5,6.50000000,'a:1:{i:2;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"2\";s:21:\"\0PlayData\0playWayName\";s:15:\"���ܽ�����\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";i:5;s:16:\"\0PlayData\0choose\";s:1:\"3\";s:19:\"\0PlayData\0winWealth\";d:6.5;s:14:\"\0PlayData\0play\";N;}}',1,1445080558),(13,1,0,5,2,1,0.00000000,'a:1:{i:5;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"5\";s:21:\"\0PlayData\0playWayName\";s:12:\"ĩλ����\";s:18:\"\0PlayData\0oddsType\";i:2;s:16:\"\0PlayData\0wealth\";i:1;s:16:\"\0PlayData\0choose\";s:1:\"0\";s:19:\"\0PlayData\0winWealth\";N;s:14:\"\0PlayData\0play\";N;}}',0,1445651772),(14,1,0,6,2,10,0.00000000,'a:1:{i:7;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"7\";s:21:\"\0PlayData\0playWayName\";s:18:\"��λ�����淨\";s:18:\"\0PlayData\0oddsType\";i:2;s:16:\"\0PlayData\0wealth\";i:10;s:16:\"\0PlayData\0choose\";s:1:\"4\";s:19:\"\0PlayData\0winWealth\";N;s:14:\"\0PlayData\0play\";N;}}',0,1445652014),(15,1,0,7,2,1,0.00000000,'a:1:{i:4;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"4\";s:21:\"\0PlayData\0playWayName\";s:12:\"ĩλ��˫\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";i:1;s:16:\"\0PlayData\0choose\";s:1:\"2\";s:19:\"\0PlayData\0winWealth\";N;s:14:\"\0PlayData\0play\";N;}}',0,1445652398),(16,6,0,8,1,2,0.00000000,'a:1:{i:4;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"4\";s:21:\"\0PlayData\0playWayName\";s:12:\"ĩλ��˫\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";i:2;s:16:\"\0PlayData\0choose\";s:1:\"2\";s:19:\"\0PlayData\0winWealth\";N;s:14:\"\0PlayData\0play\";N;}}',0,1445732364),(17,7,0,8,1,2,0.00000000,'a:1:{i:4;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"4\";s:21:\"\0PlayData\0playWayName\";s:12:\"ĩλ��˫\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";i:2;s:16:\"\0PlayData\0choose\";s:1:\"1\";s:19:\"\0PlayData\0winWealth\";N;s:14:\"\0PlayData\0play\";N;}}',0,1445739152),(18,8,0,8,1,2,0.00000000,'a:1:{i:4;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"4\";s:21:\"\0PlayData\0playWayName\";s:12:\"ĩλ��˫\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";i:2;s:16:\"\0PlayData\0choose\";s:1:\"1\";s:19:\"\0PlayData\0winWealth\";N;s:14:\"\0PlayData\0play\";N;}}',0,1445739465),(19,8,0,9,1,2,0.00000000,'a:1:{i:4;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"4\";s:21:\"\0PlayData\0playWayName\";s:12:\"ĩλ��˫\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";d:2.1999999899999998;s:16:\"\0PlayData\0choose\";s:1:\"1\";s:19:\"\0PlayData\0winWealth\";N;s:14:\"\0PlayData\0play\";N;}}',0,1445741882),(20,6,0,9,1,1,0.00000000,'a:1:{i:4;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"4\";s:21:\"\0PlayData\0playWayName\";s:12:\"ĩλ��˫\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";d:1.1234;s:16:\"\0PlayData\0choose\";s:1:\"1\";s:19:\"\0PlayData\0winWealth\";N;s:14:\"\0PlayData\0play\";N;}}',0,1445742224),(21,7,0,9,1,1,0.00000000,'a:1:{i:4;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"4\";s:21:\"\0PlayData\0playWayName\";s:12:\"ĩλ��˫\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";d:1.0000001199999999;s:16:\"\0PlayData\0choose\";s:1:\"1\";s:19:\"\0PlayData\0winWealth\";N;s:14:\"\0PlayData\0play\";N;}}',0,1445742311),(22,9,0,9,1,2,0.00000000,'a:1:{i:4;O:8:\"PlayData\":7:{s:19:\"\0PlayData\0playWayId\";s:1:\"4\";s:21:\"\0PlayData\0playWayName\";s:12:\"ĩλ��˫\";s:18:\"\0PlayData\0oddsType\";i:1;s:16:\"\0PlayData\0wealth\";d:1.5151539999999999;s:16:\"\0PlayData\0choose\";s:1:\"2\";s:19:\"\0PlayData\0winWealth\";N;s:14:\"\0PlayData\0play\";N;}}',0,1445831080);
/*!40000 ALTER TABLE `yyx_play` ENABLE KEYS */;

#
# Structure for table "yyx_play_way"
#

DROP TABLE IF EXISTS `yyx_play_way`;
CREATE TABLE `yyx_play_way` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '' COMMENT '����',
  `class` varchar(30) NOT NULL COMMENT '�淨�������������������淨,���ڼ����淨������',
  `parameter` text COMMENT '�淨����,���л�������',
  `summary` text COMMENT '�淨���',
  `news_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '�淨˵����ѶID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�淨ʹ��״̬ 0�����ã�1��ʹ�ã�Ĭ��Ϊ0��һ���������޷��޸ġ�ɾ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_play_way"
#

/*!40000 ALTER TABLE `yyx_play_way` DISABLE KEYS */;
INSERT INTO `yyx_play_way` VALUES (1,'��ʤ���淨','WinOrLost','O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:2:\"vd\";s:23:\"\0PlayWayParameter\0label\";s:6:\"ʤ��\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:0:{}s:23:\"\0PlayWayParameter\0value\";N;}','��ʤ���淨,�����ڱ�����(������)',1,1),(2,'���ܽ�����','TotalGoal','O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:4:\"goal\";s:23:\"\0PlayWayParameter\0label\";s:12:\"�ܽ�����\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:5:{i:0;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:4:\"0��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"0\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}i:1;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:4:\"1��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"1\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}i:2;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:4:\"2��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"2\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}i:3;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:4:\"3��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"3\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}s:2:\"4-\";O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:10:\"4������\";s:28:\"\0PlayWayParameterOption\0type\";s:5:\"range\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:2:\"4-\";s:32:\"\0PlayWayParameterOption\0minValue\";s:1:\"4\";s:32:\"\0PlayWayParameterOption\0maxValue\";N;}}s:23:\"\0PlayWayParameter\0value\";N;}','���ܽ������淨,�����ڱ�����(������)',0,1),(3,'�±ȷ�','Score','O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:4:\"goal\";s:23:\"\0PlayWayParameter\0label\";s:12:\"�ܽ�����\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:0:{}s:23:\"\0PlayWayParameter\0value\";N;}','�±ȷ�,�����ڱ�����(������)',0,1),(4,'ĩλ��˫','LastSingleOrDouble','O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:2:\"sd\";s:23:\"\0PlayWayParameter\0label\";s:12:\"ĩλ��˫\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:2:{i:1;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:6:\"����\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"1\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}i:2;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:6:\"˫��\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"2\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}}s:23:\"\0PlayWayParameter\0value\";N;}','ĩλ��˫�淨,�����ڲƾ����Ʊ',0,1),(5,'ĩλ����','LastNumber','O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:2:\"sd\";s:23:\"\0PlayWayParameter\0label\";s:12:\"ĩλ����\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:10:{i:0;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"0\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"0\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}i:1;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"1\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"1\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}i:2;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"2\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"2\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}i:3;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"3\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"3\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}i:4;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"4\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"4\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}i:5;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"5\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"5\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}i:6;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"6\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"6\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}i:7;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"7\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"7\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}i:8;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"8\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"8\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}i:9;O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"9\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"9\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;}}s:23:\"\0PlayWayParameter\0value\";N;}','ĩλ�����淨,�����ڲƾ����Ʊ',0,1),(6,'ĩλ��Χ','LastRange','O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:2:\"sd\";s:23:\"\0PlayWayParameter\0label\";s:12:\"ĩλ��Χ\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:2:{s:3:\"0-4\";O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:3:\"0-4\";s:28:\"\0PlayWayParameterOption\0type\";s:5:\"range\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:3:\"0-4\";s:32:\"\0PlayWayParameterOption\0minValue\";s:1:\"0\";s:32:\"\0PlayWayParameterOption\0maxValue\";s:1:\"4\";}s:3:\"5-9\";O:22:\"PlayWayParameterOption\":6:{s:29:\"\0PlayWayParameterOption\0label\";s:3:\"5-9\";s:28:\"\0PlayWayParameterOption\0type\";s:5:\"range\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:3:\"5-9\";s:32:\"\0PlayWayParameterOption\0minValue\";s:1:\"5\";s:32:\"\0PlayWayParameterOption\0maxValue\";s:1:\"9\";}}s:23:\"\0PlayWayParameter\0value\";N;}','ĩλ��Χ�淨,�����ڲƾ����Ʊ',0,1),(7,'��λ�����淨','FirstNumber','O:16:\"PlayWayParameter\":5:{s:22:\"\0PlayWayParameter\0name\";s:2:\"sd\";s:23:\"\0PlayWayParameter\0label\";s:12:\"��λ����\";s:29:\"\0PlayWayParameter\0description\";N;s:25:\"\0PlayWayParameter\0options\";a:10:{i:0;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"0\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"0\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:1;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"1\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"1\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:2;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"2\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"2\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:3;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"3\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"3\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:4;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"4\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"4\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:5;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"5\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"5\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:6;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"6\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"6\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:7;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"7\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"7\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:8;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"8\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"8\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}i:9;O:22:\"PlayWayParameterOption\":7:{s:29:\"\0PlayWayParameterOption\0label\";s:1:\"9\";s:28:\"\0PlayWayParameterOption\0type\";s:4:\"text\";s:35:\"\0PlayWayParameterOption\0description\";N;s:29:\"\0PlayWayParameterOption\0value\";s:1:\"9\";s:32:\"\0PlayWayParameterOption\0minValue\";N;s:32:\"\0PlayWayParameterOption\0maxValue\";N;s:33:\"\0PlayWayParameterOption\0playCount\";i:0;}}s:23:\"\0PlayWayParameter\0value\";N;}','��λ�����淨,�����ڲƾ����Ʊ',0,1);
/*!40000 ALTER TABLE `yyx_play_way` ENABLE KEYS */;

#
# Structure for table "yyx_province"
#

DROP TABLE IF EXISTS `yyx_province`;
CREATE TABLE `yyx_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_province"
#

/*!40000 ALTER TABLE `yyx_province` DISABLE KEYS */;
INSERT INTO `yyx_province` VALUES (1,'������'),(2,'�����'),(3,'�Ϻ���'),(4,'������'),(5,'�ӱ�ʡ'),(6,'ɽ��ʡ'),(7,'̨��ʡ'),(8,'����ʡ'),(9,'����ʡ'),(10,'������ʡ'),(11,'����ʡ'),(12,'�㽭ʡ'),(13,'����ʡ'),(14,'����ʡ'),(15,'����ʡ'),(16,'ɽ��ʡ'),(17,'����ʡ'),(18,'����ʡ'),(19,'����ʡ'),(20,'�㶫ʡ'),(21,'����ʡ'),(22,'�Ĵ�ʡ'),(23,'����ʡ'),(24,'����ʡ'),(25,'����ʡ'),(26,'�ຣʡ'),(27,'����ʡ'),(28,'����׳��������'),(29,'����������'),(30,'���Ļ���������'),(31,'�½�ά���������'),(32,'���ɹ�������'),(33,'�����ر�������'),(34,'����ر�������');
/*!40000 ALTER TABLE `yyx_province` ENABLE KEYS */;

#
# Structure for table "yyx_recharge"
#

DROP TABLE IF EXISTS `yyx_recharge`;
CREATE TABLE `yyx_recharge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(20) NOT NULL COMMENT '��ֵ���',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `money` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '��ֵ�Ľ��',
  `wealth_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '�Ƹ����� 1Ϊ��� 2Ϊ����',
  `pay_type` varchar(20) NOT NULL COMMENT '֧������, alipay:֧������bank:���� offline:����',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '��ֵ״̬ 0:δ֧�� 1���ɹ�',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT 'ע��ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_recharge"
#

/*!40000 ALTER TABLE `yyx_recharge` DISABLE KEYS */;
INSERT INTO `yyx_recharge` VALUES (1,'RC20151017190512',3,30.00000000,1,'alipay',0,1445079912),(2,'RC20151021081547',1,30.00000000,1,'alipay',0,1445386547);
/*!40000 ALTER TABLE `yyx_recharge` ENABLE KEYS */;

#
# Structure for table "yyx_share"
#

DROP TABLE IF EXISTS `yyx_share`;
CREATE TABLE `yyx_share` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(4) NOT NULL COMMENT '�������� 1:΢��',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '�û�',
  `share_id` int(11) NOT NULL DEFAULT '0' COMMENT '��������ID',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`user_id`,`share_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "yyx_share"
#

/*!40000 ALTER TABLE `yyx_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `yyx_share` ENABLE KEYS */;

#
# Structure for table "yyx_user"
#

DROP TABLE IF EXISTS `yyx_user`;
CREATE TABLE `yyx_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '����',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '����',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '�ǳ�',
  `avatar` varchar(150) NOT NULL DEFAULT '' COMMENT 'ͷ��',
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '�Ա� 0:δ֪ 1:�� 2:Ů',
  `birthday_year` smallint(4) NOT NULL COMMENT '����:��',
  `birthday_month` tinyint(2) NOT NULL DEFAULT '0' COMMENT '����:��',
  `birthday_day` tinyint(2) NOT NULL DEFAULT '0' COMMENT '����:��',
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '�ֻ�����',
  `qq` varchar(15) NOT NULL DEFAULT '' COMMENT 'QQ����',
  `province` varchar(50) DEFAULT NULL COMMENT 'ʡ��',
  `city` varchar(50) DEFAULT NULL COMMENT '����',
  `area` varchar(50) DEFAULT NULL COMMENT '����',
  `address` varchar(150) NOT NULL DEFAULT '' COMMENT '�־�ס��',
  `sign` text NOT NULL COMMENT '����ǩ��',
  `website` varchar(150) NOT NULL DEFAULT '' COMMENT '������ַ',
  `sina_weibo` varchar(150) NOT NULL DEFAULT '' COMMENT '����weibo',
  `qq_weibo` varchar(150) NOT NULL DEFAULT '' COMMENT '��Ѷweibo',
  `available_money` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '���ý��',
  `freeze_money` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '����Ľ��',
  `available_btc` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '���ñ��ر�',
  `freeze_btc` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '����ı��ر�',
  `available_ltc` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '�������ر�',
  `freeze_ltc` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '��������ر�',
  `available_doge` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '���ù���',
  `freeze_doge` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '����Ĺ���',
  `available_integral` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '���û���',
  `freeze_integral` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '����Ļ���',
  `views` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '���鿴����',
  `makers_level` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT 'ׯ�Ҽ���',
  `guess_add_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��ׯ����',
  `guess_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '���´���',
  `accuracy` tinyint(2) unsigned NOT NULL DEFAULT '100' COMMENT '����׼ȷ��',
  `fan_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '��˿����',
  `follow_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '��ע����',
  `allow_login` tinyint(1) NOT NULL DEFAULT '1' COMMENT '�Ƿ������½ 0�������� 1������',
  `last_login_time` int(10) NOT NULL DEFAULT '0' COMMENT '�ϴε�½ʱ��',
  `configs` text NOT NULL COMMENT '��������,���л�',
  `register_time` int(10) NOT NULL DEFAULT '0' COMMENT 'ע��ʱ��',
  `friend` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_user"
#

/*!40000 ALTER TABLE `yyx_user` DISABLE KEYS */;
INSERT INTO `yyx_user` VALUES (1,'yangjian_666','14e1b600b1fd579f47433b88e8d85291','yangjian_666@qq.com','','',0,0,0,0,'','','','','','','','','','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,18.50,25.40,0,0,5,6,0,0,0,1,1445777299,'a:7:{s:10:\"follow_add\";s:1:\"1\";s:11:\"guess_check\";s:1:\"1\";s:12:\"guess_result\";s:1:\"1\";s:16:\"guess_custom_end\";s:1:\"1\";s:17:\"guess_play_invite\";s:1:\"1\";s:15:\"trend_condition\";s:1:\"0\";s:10:\"trend_time\";s:1:\"7\";}',1444830684,''),(2,'123456','14e1b600b1fd579f47433b88e8d85291','123456@qq.com','','',0,0,0,0,'','','','','','','','','','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,51.50,0.00,2,0,0,3,33,0,0,1,1445080535,'Array',1445039924,''),(3,'1234562','14e1b600b1fd579f47433b88e8d85291','1234562@QQ.COM','','',0,0,0,0,'','','','','','','','','','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,58.66,-0.40,1,0,2,3,33,0,0,1,1445079487,'Array',1445040023,''),(4,'1234563','14e1b600b1fd579f47433b88e8d85291','1234563@qq.com','','',0,0,0,0,'','','','','','','','','','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,45.20,0.00,0,0,0,3,33,0,0,1,1445080509,'Array',1445040609,''),(5,'1234564','14e1b600b1fd579f47433b88e8d85291','1234564@qq.com','','',0,0,0,0,'','','','','','','','','','',0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,50.00,0.00,0,0,0,0,0,0,0,1,1445730801,'Array',1445730801,''),(6,'1234565','14e1b600b1fd579f47433b88e8d85291','1234565@qq.com','','',0,0,0,0,'','','','','','','','','','',5.35646200,44.64353800,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,50.00,0.00,1,0,1,2,0,0,0,1,1445742193,'Array',1445731140,''),(7,'1234566','14e1b600b1fd579f47433b88e8d85291','1234566@123.com','','',0,0,0,0,'','','','','','','','','','',46.99999988,3.00000012,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,50.00,0.00,0,0,0,2,0,0,0,1,1445742265,'Array',1445732466,''),(8,'1234567','14e1b600b1fd579f47433b88e8d85291','1234567@qq.com','','',0,0,0,0,'','','','','','','','','','',35.69169321,14.30830679,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,50.00,0.00,0,0,1,2,0,0,0,1,1445739439,'Array',1445739439,''),(9,'qwe123456','14e1b600b1fd579f47433b88e8d85291','11111@qq.com','','',0,0,0,0,'','','','','','','','','','',48.48484600,1.51515400,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,50.00,0.00,1,0,0,1,0,0,0,1,1445830731,'Array',1445766943,''),(10,'1234568','14e1b600b1fd579f47433b88e8d85291','1234568@qq.com','','',0,0,0,0,'','','','','','','','','','',200.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,50.00,0.00,0,0,0,0,0,0,0,1,1445773114,'Array',1445773114,''),(11,'1234569','14e1b600b1fd579f47433b88e8d85291','1234569@qq.com','','',0,0,0,0,'','','','','','','','','','',200.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,50.00,0.00,0,0,0,0,0,0,0,1,1445773488,'Array',1445773488,''),(12,'12345610','14e1b600b1fd579f47433b88e8d85291','12345610@qq.com','','',0,0,0,0,'','','','','','','','','','',50.00000000,0.00000000,50.00000000,0.00000000,50.00000000,0.00000000,50.00000000,0.00000000,50.00,0.00,0,0,0,0,0,0,0,1,1445779454,'Array',1445779454,''),(13,'12345611','14e1b600b1fd579f47433b88e8d85291','12345611@qq.com','','',0,0,0,0,'','','','','','','','','','',50.00000000,0.00000000,50.00000000,0.00000000,50.00000000,0.00000000,50.00000000,0.00000000,50.00,0.00,0,0,0,0,0,0,0,1,1445779654,'Array',1445779654,''),(14,'12345612','14e1b600b1fd579f47433b88e8d85291','12345612@QQ.COM','','',0,0,0,0,'','','','','','','','','','',50.00000000,0.00000000,50.00000000,0.00000000,50.00000000,0.00000000,50.00000000,0.00000000,50.00,0.00,0,0,1,0,0,0,0,1,1445780037,'Array',1445780037,''),(15,'qwe2525033','14e1b600b1fd579f47433b88e8d85291','123@qq.com','','',0,0,0,0,'','','','','','','','','','',999999.99999999,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00,0.00,0,0,0,0,0,0,0,1,1465786447,'Array',1465785838,'');
/*!40000 ALTER TABLE `yyx_user` ENABLE KEYS */;

#
# Structure for table "yyx_user_deposit"
#

DROP TABLE IF EXISTS `yyx_user_deposit`;
CREATE TABLE `yyx_user_deposit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `wallet_address` varchar(50) NOT NULL COMMENT 'Ǯ����ַ',
  `confirmations` int(11) NOT NULL DEFAULT '0' COMMENT 'ȷ�ϴ���',
  `amount` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '���',
  `wealth_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƹ����� 1Ϊ��� 2Ϊ���� 3LTC 4BTC 5DOGE',
  `txid` varchar(200) NOT NULL COMMENT '���׺�',
  `tx_is_ok` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '����ok? 0: δ��ɣ�1�����',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '���ʱ��',
  `admin_user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ϵͳ�˺�',
  `admin_info` varchar(200) NOT NULL DEFAULT '',
  `admin_ipv4` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `txid` (`txid`),
  KEY `user_id` (`user_id`,`wallet_address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "yyx_user_deposit"
#

/*!40000 ALTER TABLE `yyx_user_deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `yyx_user_deposit` ENABLE KEYS */;

#
# Structure for table "yyx_user_guess"
#

DROP TABLE IF EXISTS `yyx_user_guess`;
CREATE TABLE `yyx_user_guess` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_uid` int(11) unsigned NOT NULL COMMENT '�����û�',
  `to_uid` int(11) unsigned NOT NULL COMMENT '�����û�',
  `guess_id` int(11) unsigned NOT NULL COMMENT '����ľ���',
  `type` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '��ϵ���� 1:�ҹ�ע�ľ��� 2:�����Ҳ���ľ���',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `to_uid` (`to_uid`,`guess_id`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_user_guess"
#

/*!40000 ALTER TABLE `yyx_user_guess` DISABLE KEYS */;
INSERT INTO `yyx_user_guess` VALUES (1,3,3,3,1,1445056687);
/*!40000 ALTER TABLE `yyx_user_guess` ENABLE KEYS */;

#
# Structure for table "yyx_user_withdraw"
#

DROP TABLE IF EXISTS `yyx_user_withdraw`;
CREATE TABLE `yyx_user_withdraw` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '���ʱ��',
  `amount` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '���',
  `wealth_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƹ����� 1Ϊ��� 2Ϊ����',
  `wallet_address` varchar(50) NOT NULL COMMENT 'Ǯ����ַ',
  `tx_address` varchar(50) NOT NULL COMMENT 'Ǯ����ַ',
  `txid` varchar(200) NOT NULL COMMENT '���׺�',
  `tx_confirmations` int(11) NOT NULL DEFAULT '0' COMMENT 'ȷ�ϴ���',
  `info` varchar(100) DEFAULT '',
  `withdraw_state` int(11) NOT NULL DEFAULT '0' COMMENT '����״̬,0: �����У�1���ɹ���2��ʧ��',
  `fee` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '������',
  `fee_pay` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT 'ʵ��֧��������',
  `admin_user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ϵͳ�˺�',
  `admin_info` varchar(200) NOT NULL DEFAULT '',
  `admin_ipv4` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `txid` (`txid`),
  KEY `user_id` (`user_id`,`wallet_address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "yyx_user_withdraw"
#

/*!40000 ALTER TABLE `yyx_user_withdraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `yyx_user_withdraw` ENABLE KEYS */;

#
# Structure for table "yyx_weibo"
#

DROP TABLE IF EXISTS `yyx_weibo`;
CREATE TABLE `yyx_weibo` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '����',
  `logo` varchar(200) NOT NULL DEFAULT '' COMMENT 'logoͼƬ',
  `type` varchar(50) DEFAULT NULL COMMENT '���ʹ���',
  `app_key` varchar(100) DEFAULT NULL COMMENT 'Ӧ��KEY',
  `app_secret` varchar(100) DEFAULT NULL COMMENT 'Ӧ��KEY',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '���ӵ�ַ',
  `sort_num` smallint(4) DEFAULT '0' COMMENT '����',
  `status` tinyint(1) DEFAULT '1' COMMENT '0������ʾ��1����ʾ��Ĭ��Ϊ1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_weibo"
#

/*!40000 ALTER TABLE `yyx_weibo` DISABLE KEYS */;
INSERT INTO `yyx_weibo` VALUES (1,'����΢��','','sina','','','http://www.weibo.com',1,1),(2,'��Ѷ΢��','','qq','','','t.qq.com',0,0);
/*!40000 ALTER TABLE `yyx_weibo` ENABLE KEYS */;

#
# Structure for table "yyx_withdraw"
#

DROP TABLE IF EXISTS `yyx_withdraw`;
CREATE TABLE `yyx_withdraw` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(20) NOT NULL COMMENT '���ֱ��',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  `money` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '���ֵĽ��',
  `tax` decimal(14,8) NOT NULL DEFAULT '0.00000000' COMMENT '����������',
  `address` varchar(150) NOT NULL COMMENT '���ֵĵ�ַ',
  `wealth_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '�Ƹ����� 1Ϊ��� 2Ϊ����',
  `pay_type` varchar(20) NOT NULL COMMENT '֧������, alipay:֧������bank:���� offline:����',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '��ֵ״̬ 0:δ֧�� 1���ɹ�',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT 'ע��ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "yyx_withdraw"
#

/*!40000 ALTER TABLE `yyx_withdraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `yyx_withdraw` ENABLE KEYS */;
