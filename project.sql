/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.5.56 : Database - ocarinamanage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ocarinamanage` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ocarinamanage`;

/*Table structure for table `t_collection_post` */

DROP TABLE IF EXISTS `t_collection_post`;

CREATE TABLE `t_collection_post` (
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_collection_post` */

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `content` varchar(255) NOT NULL,
  `postId` int(11) NOT NULL,
  `replyUsername` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_comment` */

insert  into `t_comment`(`ID`,`userName`,`date`,`content`,`postId`,`replyUsername`) values (1,'admin','2019-04-07 19:02:03','故乡的原风景真好听',3,'clearlove'),(2,'clearlove','2019-04-24 19:02:36','确实很好听',3,'admin'),(3,'admin','2019-04-23 09:28:39','21232',3,'clearlove'),(4,'clearlove','2019-04-01 09:29:26','132456',3,'admin'),(5,'clearlove','2019-04-29 19:00:05','初学者都买AC',2,'clearlove'),(6,'clearlove','2019-04-29 19:02:44','好的，谢谢。',2,'clearlove'),(7,'pengchao','2019-04-29 20:13:33','说的真好',3,'admin'),(8,'pengchao','2019-04-29 20:28:07','真好',3,'张润华'),(9,'clearlove','2019-04-29 20:28:45','你好',3,'张润华'),(10,'admin','2019-05-07 13:31:07','谢谢',4,'admin');

/*Table structure for table `t_myvidieo` */

DROP TABLE IF EXISTS `t_myvidieo`;

CREATE TABLE `t_myvidieo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `vidieoName` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `t_myvidieo` */

insert  into `t_myvidieo`(`ID`,`vidieoName`,`path`,`img`) values (14,'宗次郎 「天空のオリオン」_高清.mp4','/clearlove/宗次郎 「天空のオリオン」_高清.mp4','/myvideoimg.jpg'),(15,'里之秋.mp4','/admin/里之秋.mp4','/myvideoimg.jpg'),(16,'陶笛帮《似夜流月》高清.mp4','/admin/陶笛帮《似夜流月》高清.mp4','/myvideoimg.jpg'),(17,'回归森林.mp4','/admin/回归森林.mp4','/myvideoimg.jpg');

/*Table structure for table `t_ocarinamusic` */

DROP TABLE IF EXISTS `t_ocarinamusic`;

CREATE TABLE `t_ocarinamusic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `musicName` varchar(400) NOT NULL,
  `musicianName` varchar(255) NOT NULL DEFAULT '无名',
  `musicPath` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `t_ocarinamusic` */

insert  into `t_ocarinamusic`(`id`,`musicName`,`musicianName`,`musicPath`) values (1,'春待草','黑野宏通','/其他/春待草.mp3'),(2,'风轻扬','彭超','/其他/风轻扬.mp3'),(3,'那夜的星空','无名','/其他/那夜的星空.mp3'),(4,'秋葉小道','无名','/其他/秋葉小道.mp3'),(5,'去到明天的天空','黑野宏通','/其他/去到明天的天空.mp3'),(6,'陶笛波爾卡','无名','/其他/陶笛波爾卡.mp3'),(7,'櫻色天空','无名','/其他/櫻色天空.mp3'),(8,'倒影-花木蘭','游学志','/游学志/倒影-花木蘭.mp3'),(9,'風之彩-風中奇緣','游学志','/游学志/風之彩-風中奇緣.mp3'),(10,'歡樂海世界-小美人魚','游学志','/游学志/歡樂海世界-小美人魚.mp3'),(11,'堅持到底-大力士','游学志','/游学志/堅持到底-大力士.mp3'),(12,'今晚你能感覺到愛嗎-獅子王','游学志','/游学志/今晚你能感覺到愛嗎-獅子王.mp3'),(13,'美女與野獸','游学志','/游学志/美女與野獸.mp3'),(14,'你想堆個雪人嗎-冰雪奇緣','游学志','/游学志/你想堆個雪人嗎-冰雪奇緣.mp3'),(15,'前所未有的感覺-冰雪奇緣','游学志','/游学志/前所未有的感覺-冰雪奇緣.mp3'),(16,'向星星許願-木偶奇遇記','游学志','/游学志/向星星許願-木偶奇遇記.mp3'),(17,'小小世界','游学志','/游学志/小小世界.mp3'),(18,'嶄新的世界-阿拉丁','游学志','/游学志/嶄新的世界-阿拉丁.mp3'),(19,'Let it go','游学志','/游学志/Let it go.mp3'),(20,'Gracias','宗次郎','/宗次郎/Gracias.mp3'),(21,'Ocarina Dance','宗次郎','/宗次郎/Ocarina Dance.mp3'),(22,'Ocarina Wind Family','宗次郎','/宗次郎/Ocarina Wind Family.mp3'),(23,'Serai','宗次郎','/宗次郎/Serai.mp3'),(24,'感谢人生的Indian Flai','宗次郎','/宗次郎/感谢人生的Indian Flai .mp3'),(25,'回忆中的天空','宗次郎','/宗次郎/回忆中的天空.mp3'),(26,'树叶的舞动','宗次郎','/宗次郎/树叶的舞动.mp3'),(27,'遥远日子的记忆','宗次郎','/宗次郎/遥远日子的记忆.mp3'),(28,'幼日','宗次郎','/宗次郎/幼日.mp3'),(29,'众神之乡','宗次郎','/宗次郎/众神之乡.mp3'),(30,'微笑的容顏','无名','/其他/微笑的容顏.mp3');

/*Table structure for table `t_ocarinaskills` */

DROP TABLE IF EXISTS `t_ocarinaskills`;

CREATE TABLE `t_ocarinaskills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_ocarinaskills` */

insert  into `t_ocarinaskills`(`id`,`title`,`content`) values (1,'基本技法篇-气','&nbsp;&nbsp;&nbsp;&nbsp;气息是吹管乐的第一要素，气息是能量的动力，没有气息乐器不会响。因此，如何运用好气息使陶笛音量适中、音准达标、音色优美，就成了我们学习吹陶笛的重要课题。\r\n&nbsp;&nbsp;&nbsp;&nbsp;一起要平稳，呼吸是很重要的一步。陶笛的呼吸法和唱歌法差不多，采用腹腔联合呼吸，以及急吸慢呼等方法。什么是胸腹联合式呼吸呢？即吸气时口鼻同时进气，胸腹齐鼓胀，呼气时口中有控制的呼出，同时用意念守住小腹丹田位。使之始终鼓胀不泄。\r\n气的呼出要想水龙头往外流，不能像水盆一样一泼而尽。总之，一定要吸得自然、吸得迅速，呼得均匀、呼得连贯。呼和吸浑然一体、协调、自然、通畅。这样才算真正掌握好了“胸腹联合呼吸法”。'),(2,'进阶——颤音的吹奏','&nbsp;&nbsp;&nbsp;&nbsp;1、颤音是依靠腹肌和横隔肌的自然控制，使气流呈一种均匀而规则的波动所取得的音乐效果。初学者很难理解这种感觉和发音方法，但是陶笛演奏时并不需要一开始就学习这种技巧，而是随着一定的熟练度以后逐渐掌握的。简单的说就是：吹到后面自然会懂。\r\n\r\n2、颤音又称腹震音或气颤音。它是依靠腹肌和横隔肌的自然控制，使气流呈一种均匀而规则的波动所取得的音乐效果。这种音往往在一个较长的音中使用，能使这个音显得悠长。\r\n\r\n3、颤音是使发音产生美感的重要手段。它与弦乐器的揉弦效果和声乐演员歌唱时所产生的颤吟效果（指极微细的音高波动）具有同样的作用。是吹箫者必不可少的气息技术。\r\n\r\n4、颤音经常在一些较缓慢舒展的节奏和悠长抒情的旋律中使用，它可使音乐得到一种自然、松弛、及悠扬的歌唱性。它不仅和情感的抒发有紧密的联系，而且使乐器的音质产生一种圆润、丰满的美感。练习颤音时，应首先避免故意地大幅度地去颤动气流，更忌讳用胸式呼吸或用喉头结去抖动气流，使音乐产生一种非哭非笑的效果。正确的方法是用腹式呼吸、使气流自然平和地呼出，取得舒展的美声效果。\r\n\r\n5、颤音的方法是。在奏本音的时候，上方的手指上下均与快速运动（颤动），练习时在手指放松的前提下，尽量抬高些（上下距离大一些），由慢渐快的练习。'),(3,'揉音','&nbsp;&nbsp;&nbsp;&nbsp;陶笛的揉音不是用手来揉，但为什麼要叫\"揉\"音呢？原因是来自二胡乐器的揉弦动作，所制造出来如波浪般有幅度的声音，管乐器所吹奏出来如波浪般，声乐唱出来的\"颤音\"，英文单词是Vibrato，管乐器也用\"揉音\"，声乐是\"颤音\"，那么Vibrato到底有几种呢？大致说来有三种：一是颚震，二是腹震，三是喉震。这里所谓的震并不是震音，而是Vibrato的一种方式。\r\n 陶笛应该用的是第二种——腹震，颚震通常是萨克斯风这类竹簧片发声乐器在用的，而喉震则是声乐在用的，正确的腹震的吹奏方式要如下图般隐定的波浪型振幅，而不是脉冲的方式。\r\n　　练习方法：首先拿起你的陶笛吹一个音（开始时最好吹E音），练习时，一开始先练习脉冲式的吹法，对著陶笛吐…呼…呼…呼…呼…呼…呼…呼吹气，这时你会感觉到腹部会随著呼呼呼的音而震动，再来的练习需要比较长时间的持续练习，  吹的时候把原本断开的呼、呼、呼音连接起来，尽你所能的把吹进去的音降低，然后升高回来，像是对著陶笛吹吐..呜...呼...呜...呼...呜...呼...呜...呼...呜，中间要连起来，不能断掉吹出来的音要像上图的波浪型，这时候腹部是会随著音而运动，吹奏的时候，要放轻松，任何紧张的，手部的、口部的多余动作都是错误的，不该出现的动作。先练习频率慢的，这个练习，像是篮球原练运球基本动作一样，要持续不继的练习，才能熟练它，等到吹奏练了之后，开始慢慢加快频率，这时候会感觉到腹部前后震动，横隔膜上下震动。最后的练习是要能够控制它的频率快慢，可以先练习由慢到快，再由快到慢。坚持不懈多加练习，陶笛一定能吹出令人陶醉的乐章。'),(4,'滑音','&nbsp;&nbsp;&nbsp;&nbsp;滑音能使陶笛的声音更加华丽，流畅并富有色彩，滑音一般分为上滑音和上滑音两种。\r\n\r\n上滑音用反抛物线标识上滑音由低音滑向高音，其演奏方法是手指由低音向高音抹动抬起，上滑音的演奏我们只要一句话，手指由直接抬起变为抹动抬起，上滑音的的效果自然出现。\r\n\r\n下滑音和上滑音相反从标识符号来看它用正抛物线来标识，从演奏上来看它是由高音滑向低音，其演奏方法是，手指由高音孔向低音孔逐渐关闭，也就是由直接关闭变为逐渐关闭，下滑音就自然出现。\r\n\r\n陶笛的演奏中有了上、下滑音的点缀，使音乐的表现更具魅力和特色。从微观上来看在慢板的演奏中，几乎每个音都采用了滑音这一技巧，区别在于所占时间的长短，手指接触音孔时的感觉。');

/*Table structure for table `t_ocarinavideo` */

DROP TABLE IF EXISTS `t_ocarinavideo`;

CREATE TABLE `t_ocarinavideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `videoName` varchar(400) NOT NULL,
  `authorName` varchar(255) NOT NULL DEFAULT '无名',
  `videoPath` varchar(255) NOT NULL,
  `videoImg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `t_ocarinavideo` */

insert  into `t_ocarinavideo`(`id`,`videoName`,`authorName`,`videoPath`,`videoImg`) values (1,'回归森林','宗次郎','/宗次郎/回归森林.mp4','/宗次郎/img/回归森林.png'),(2,'日本陶笛大师宗次郎 国家大剧院 中国之行 《天空的猎户座》_高清','宗次郎','/宗次郎/日本陶笛大师宗次郎 国家大剧院 中国之行 《天空的猎户座》_高清.mp4','/宗次郎/img/国家大剧院天空的猎户座.png'),(3,'陶笛帮《似夜流月》高清','张越','/其他/陶笛帮《似夜流月》高清.mp4','/其他/img/陶笛帮似夜流月.png'),(4,'笛子欣赏：童年回忆 - 宗次郎陶笛_高清','宗次郎','/宗次郎/笛子欣赏：童年回忆 - 宗次郎陶笛_高清.mp4','/宗次郎/img/童年的回忆.png'),(5,'宗次郎、賈鵬芳 睡莲高清','宗次郎','/宗次郎/宗次郎、賈鵬芳 睡莲高清.mp4','/宗次郎/img/睡莲.png'),(6,'宗次郎 故乡的原风景 2014 国家大剧院_高清','宗次郎','/宗次郎/宗次郎 故乡的原风景 2014 国家大剧院_高清.mp4','/宗次郎/img/国家大剧院故乡的原风景.png'),(7,'宗次郎故乡的原风景','宗次郎','/宗次郎/宗次郎故乡的原风景.mp4','/宗次郎/img/故乡的原风景.png'),(8,'宗次郎森林漫步_高清','宗次郎','/宗次郎/宗次郎森林漫步_高清.mp4','/宗次郎/img/森林漫步.png'),(9,'悲伤的尽头','宗次郎','/宗次郎/悲伤的尽头.mp4','/宗次郎/img/悲伤的尽头.png'),(10,'谁为青史流把泪','宗次郎','/宗次郎/谁为青史流把泪.mp4','/宗次郎/img/谁为青史把泪流.png'),(11,'飞走了','宗次郎','/宗次郎/飞走了.mp4','/宗次郎/img/飞走了.png'),(12,'宗次郎天空的猎户座','宗次郎','/宗次郎/宗次郎天空的猎户座.mp4','/宗次郎/img/宗次郎天空的猎户座.png'),(13,'里之秋','宗次郎','/宗次郎/里之秋.mp4','/宗次郎/img/里之秋.png');

/*Table structure for table `t_permission` */

DROP TABLE IF EXISTS `t_permission`;

CREATE TABLE `t_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `t_permission` */

insert  into `t_permission`(`ID`,`pname`,`url`) values (1,'anon','/login'),(2,'logout','/logout'),(3,'p:main','/admin/main'),(4,'p:usergive','/userGive'),(5,'p:userdelete','/userDelete'),(6,'p:userstartforbidden','/userStartFor'),(7,'p:getallpagerusers','/getAllPagerUsers'),(8,'p:updateuserrole','/updateUserRole'),(9,'p:userforbidden','/userForbidden'),(10,'p:userstart','/userStart'),(11,'p:dorepotmess','/doReportMess'),(12,'p:userdelete','/userDelete'),(13,'p:dealpost','/dealPost'),(14,'p:repostdetails','/reportdetails'),(15,'p:repostdetails','/postdetails');

/*Table structure for table `t_post` */

DROP TABLE IF EXISTS `t_post`;

CREATE TABLE `t_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `postName` varchar(255) NOT NULL,
  `postContent` text NOT NULL,
  `publishUserName` varchar(255) NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_post` */

insert  into `t_post`(`ID`,`type`,`postName`,`postContent`,`publishUserName`,`time`) values (1,1,'指颤技巧','指颤是一种陶笛演奏技巧','admin','2019-04-03 10:44:28'),(2,2,'初学者应该买什么样的陶笛','请问各位大佬初学者应该买什么样的陶笛','clearlove','2019-04-01 10:44:31'),(3,3,'故乡的原风景赏析','故乡的原风景是日本陶笛大师宗次郎先生的作品，曲子空灵幽静，非常优美动听。多次被TVB影视剧用作背景曲。','pengchao','2019-03-29 10:44:39'),(4,2,'请问怎么学陶笛','常听常练','admin',NULL);

/*Table structure for table `t_reportmessage` */

DROP TABLE IF EXISTS `t_reportmessage`;

CREATE TABLE `t_reportmessage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `reporterName` varchar(255) DEFAULT NULL,
  `dealName` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `isDeal` int(11) DEFAULT NULL,
  `reportPostName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `t_reportmessage` */

insert  into `t_reportmessage`(`ID`,`reporterName`,`dealName`,`title`,`content`,`isDeal`,`reportPostName`) values (8,'pengchao','admin','故乡的原风景有违规','故乡的原风景帖子有违规内容',1,'故乡的原风景赏析'),(13,'admin','admin','该帖子违规','该帖子违规',1,'指颤技巧');

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`ID`,`rname`,`code`) values (1,'超级管理员','admin'),(2,'授权管理员','adminuser'),(3,'普通用户','user');

/*Table structure for table `t_role_permission` */

DROP TABLE IF EXISTS `t_role_permission`;

CREATE TABLE `t_role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `FKjobmrl6dorhlfite4u34hciik` (`permission_id`),
  CONSTRAINT `FK90j038mnbnthgkc17mqnoilu9` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`ID`),
  CONSTRAINT `FKjobmrl6dorhlfite4u34hciik` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_role_permission` */

insert  into `t_role_permission`(`role_id`,`permission_id`) values (1,1),(2,1),(1,2),(2,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(2,11),(1,12),(1,13),(2,13),(1,14),(2,14),(1,15),(2,15);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `personalsign` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `regeDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`ID`,`userName`,`password`,`sex`,`state`,`img`,`personalsign`,`phoneNumber`,`regeDate`) values (1,'admin','aae8b2a0a29791e207798d5dcf977c05','男',1,'avtar.jpg','窗前明月光，疑是地上霜。举头望明月，低头思故乡。','13628035352','2019-03-29 16:14:20'),(5,'彭超','aae8b2a0a29791e207798d5dcf977c05','男',1,'avtar.jpg','既然选择了远方，便只顾风雨兼程。','13628035352','2019-03-30 17:43:34'),(6,'clearlove','aae8b2a0a29791e207798d5dcf977c05','女',1,'avtar.jpg','既然选择了远方，便只顾风雨兼程','13628035352','2019-03-22 17:43:39'),(7,'tuling','aae8b2a0a29791e207798d5dcf977c05','男',1,'avtar.jpg',NULL,'13628035352','2019-04-28 18:33:43'),(8,'李传兵','aae8b2a0a29791e207798d5dcf977c05','男',1,'avtar.jpg',NULL,'13628035352','2019-04-29 20:17:02'),(9,'吴进武','aae8b2a0a29791e207798d5dcf977c05','男',1,NULL,NULL,'13628035352','2019-04-29 20:21:43'),(10,'张润华','aae8b2a0a29791e207798d5dcf977c05','男',1,'avtar.jpg',NULL,'13628035352','2019-04-29 20:24:35'),(11,'123','2de30adc9c0024ce3fbc29a0a9895f95','男',1,'avtar.jpg',NULL,'13628035352','2019-05-27 22:03:42');

/*Table structure for table `t_user_myvidieo` */

DROP TABLE IF EXISTS `t_user_myvidieo`;

CREATE TABLE `t_user_myvidieo` (
  `user_id` int(11) DEFAULT NULL,
  `vidieo_id` int(11) NOT NULL,
  KEY `FKgwj3viu2plnjmb1g9ovh0i3v0` (`vidieo_id`),
  KEY `FK1eea3w9nosjkq02tfoyiscjav` (`user_id`),
  CONSTRAINT `FK1eea3w9nosjkq02tfoyiscjav` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`ID`),
  CONSTRAINT `FKgwj3viu2plnjmb1g9ovh0i3v0` FOREIGN KEY (`vidieo_id`) REFERENCES `t_myvidieo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user_myvidieo` */

insert  into `t_user_myvidieo`(`user_id`,`vidieo_id`) values (6,14),(1,15),(1,16),(1,17);

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa9c8iiy6ut0gnx491fqx4pxam` (`role_id`),
  CONSTRAINT `FKa9c8iiy6ut0gnx491fqx4pxam` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`ID`),
  CONSTRAINT `FKq5un6x7ecoef5w1n39cop66kl` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user_role` */

insert  into `t_user_role`(`user_id`,`role_id`) values (1,1),(5,2),(6,2),(7,3),(8,3),(9,3),(10,3),(11,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
