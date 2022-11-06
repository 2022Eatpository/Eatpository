-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: eatpositoryinstance.chldu2nftn04.us-west-1.rds.amazonaws.com    Database: eatdb
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `stores_stores`
--

DROP TABLE IF EXISTS `stores_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores_stores` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `store_name` varchar(100) NOT NULL,
  `main_menu` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `time` varchar(200) DEFAULT NULL,
  `category` varchar(10) NOT NULL,
  `admin_comment` varchar(200) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stores_stores_user_id_48a39402_fk_accounts_users_id` (`user_id`),
  CONSTRAINT `stores_stores_user_id_48a39402_fk_accounts_users_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores_stores`
--

LOCK TABLES `stores_stores` WRITE;
/*!40000 ALTER TABLE `stores_stores` DISABLE KEYS */;
INSERT INTO `stores_stores` VALUES (2,'카미야','돈까스 정식','서울 마포구 와우산로21길 28-6','',126.9223637900431,37.552582876796265,'11:00~22:30','일식','‘홍대생의 학식은 카미야에서 시작한다’로 종결되는 맛집.',4),(3,'타코몽','메뉴오코노미야끼','서울 서대문구 신촌로 49','',126.93209112639984,37.557064126925475,'수~일 16:00 ~ 22:00','일식','분위기 좋은 타코야끼 &오코노미야끼 맛집',4),(4,'무쇠김치삼겹','무쇠 삼겹살','서울 마포구 와우산로21길 20-5','01012341234',126.922669292142,37.5526353351489,'매일 15:00 ~ 22:00','한식','산업디자인 학과장님이 학생들을 데리고가는 맛집.',2),(5,'카츠오모이 홍대점','카츠','서울 마포구 와우산로 162-14','010-8311-7117',126.931064295456,37.5549615049644,'목~일 11:30 ~ 20:00','일식','실시간으로 오픈 키친에서 쉐프가 카츠를 만드는 과정을 볼 수 있어 미각과 시각 모두를 잡는 맛집.',4),(6,'금복식당','고등어구이','서울 마포구 독막로14길 24','02-336-4506',126.92217908089042,37.54737498522558,'월~금 11:30 ~21:00','한식','샐러드부터 메인 고등어 구이까지 든든하게 한끼를 채울 수 있는 한식 정식 맛집.',2),(7,'홍익닭한마리 홍대본점','닭한마리','서울 마포구 와우산로29라길 20','02-322-7523',126.926817973835,37.5550490491891,'매일 11:30 ~23:00','한식','기말 기간 야작 후 몸보신에 제격인, 서비스 좋은 닭한마리 맛집.',2),(8,'비스트로큐슈','카레','서울 마포구 와우산로30길 13','02-322-1913',126.929955953401,37.5541607667941,'매일 11:00 ~ 21:00','일식','일식에서 변형된 퓨전 카레로, 적당한 맵기와 양에다 토핑이 풍족한 맛집.',4),(9,'슈슈','라멘','서울 마포구 홍익로2길 23','',126.923857747432,37.5546831743202,'월~금,일 11:30 ~ 21:00','일식','상수에서 홍입까지, 오랜 시간 학교 앞에 자리한 퓨전 라멘 맛집.',4),(10,'플레이트946','라자냐','서울 마포구 독막로19길 20-6','010-5577-6432',126.925099693068,37.548582410034,'월~토 11:30 ~ 22:00','양식','교수님들의 모임이 끊이지 않고 소개팅을 하고 있는 학생들이 자주 찾는 분위기 좋은 맛집.',5),(11,'비스트로주라','파스타','서울 마포구 와우산로23길 18-7','02-6406-5640',126.924618957329,37.5539953005742,'화~일 11:30 ~22:00','양식','선배 혹은 후배와 밥약이 생겼다면, 수업끝나고 홍대 근처에서  데이트약속이 잡혔다면? 추천 ',5),(12,'발바리네','제육볶음','서울 마포구 와우산로 128','02-334-0619',126.92766168891764,37.55328000971781,'월~토 11:00 ~ 19:30','한식','오발찌: 오늘 발바리네 찌개 뭐냐는 뜻. 홍대의 학식. 혼모노들만 알았던 홍입 지하식당던전에 위치해있었지만, 순전히 주방아주머니의 제육볶음 웍질과 양, 그리고 요구루트 서비스, 홀 삼촌의 반전매력으로 지금의 반열에 오름. ',2),(13,'넙딱집 상수점','삼겹살','서울 마포구 독막로 104','02-6498-2225',126.92503853802233,37.54749937093555,'월~토 17:00 ~ 24:00','한식','c동에서 가장 가까우면서도 신선한 고기들과 수제햄 서비스로 1차로 시작하기 좋은 맛집',2),(14,'마코토','일식덮밥','서울 마포구 와우산로21길 12-3','',126.923126546744,37.5525851778508,'11:00~21:00','일식','깔끔하고, 든든한 한끼를 먹고싶다면 연어를 좋아하는 당신 마코토 당장 가',4),(15,'제순식당 홍대점','제육볶음','서울 마포구 와우산로15길 30','02-336-2008',126.921627123994,37.5492793310327,'11:00~22:00','한식','솔직히 제순 갈 바에 든든한 발발이네 가지만, 2인자 한식의 홍진호 자리를 유지하고 있음',2),(16,'옛맛서울불고기','불고기','서울 마포구 독막로 56','02-336-9371',126.919517181494,37.5477002634091,'화~일 11:30~21:00','한식','불고기 집이지만 필자는 이곳에서 불고기를 먹어본 적이 없음, 이 집의 하이라이트는 점심 메뉴인 갈비탕과 소고기무국의 퀄리티가 대단한 집임, 우선 양이 가격만큼 매우 많고 심지어 맛있음',2),(17,'야키토리 나루토','꼬치','서울 마포구 독막로9길 26','02-332-6835',126.920207967712,37.5493540644272,'16:00~23:00','일식','꼬치가 굉장히 크고 맛있는 집. 나올때 텅텅 빈 지갑을 발견할 수 있음',4),(18,'후계동','닭국밥','서울 마포구 독막로 76','',126.921710343496,37.547614341015,'11:30~21:00','한식','기본적으로 닭국밥, 닭칼국수 메뉴가 존재하지만, 그것보다 매일 바뀌는 오늘의메뉴를 먹기 위해 찾아가는 곳, 오늘의 메뉴는 전날 인스타그램을 통해 알 수 있고, 퀄리티가 매우 좋기 때문에 추천!',2),(19,'슬로우캘리 연남본점','포케','서울 마포구 동교로38길 35','02-336-0688',126.92580901460133,37.56135179473061,'매일 11:30 ~ 20:30','일식','건강하게 다이어트를 하는 자를 위한 든든한 한끼로 포케 추천.양많아서 2인이상에게 추천',4),(20,'뇽즈','오므라이스','서울 마포구 연희로 17-1','',126.926409752243,37.5604655900259,'11:30~21:00','양식','오므라이스가 상당히 부드럽고 맛있음 입에서 사르르 녹기 때문에 치아가 안 좋은 분들께 추천, 가격도 홍대인 것을 감안하면 괜찮은 가격이라고 생각합니다',5),(21,'원당감자탕 홍대점','감자탕','서울 마포구 와우산로21길 20-6','',126.922931866498,37.5526138828749,'24시간 영업','한식','감자탕 집이지만, 뼈짐이 국룰인 ‘원당 뼈짐’집임 뼈짐이 굉장히 부드럽고 담백함, 뼈찜을 꼭 시켜 먹어보는 것을 추천',2),(22,'대왕고추장불고기 홍대본점','고추장불고기','서울 마포구 잔다리로6길 34-6','',126.920985919556,37.5520828099529,'24시간','한식','오 여기가 맛집리스트에 들어간다? 그러면 미나리식당도 들어가야 한다 필자는 생각함',2),(24,'요코스카쓰나미 상수점','제철사시미','서울 마포구 와우산로 39-12','',126.922506376757,37.5482167331689,'화~일 17:00 ~ 01:00','일식','신선한 재료는 기본, 사장님의 서비스는 덤. 모든 메뉴에 진심이신 사장님.',4),(25,'교다이야','냉우동','서울 마포구 성지길 39','02-2654-2645',126.913219594114,37.5468479633888,'11:00~20:30','일식','여름이 되면 생각나는 냉우동 맛집. 웨이팅이 있을수도 있음.',4),(26,'비스트로오라','스파게티','서울 마포구 동교로 244','02-324-3323',126.92450722848,37.5615401788009,'수~월 12:00~23:00','양식','네이버 예약하면 식전 와인 제공. 연남동 파스타/ 피자 맛집. 와인도 따로 판매하고 있음.',5),(27,'지로우라멘','라멘','서울 마포구 와우산로29가길 79','',126.925171531217,37.5536965208231,'매일 11:00 ~ 21:30','일식','진한 국물의 돈코츠 라멘 맛집. 국물에 마늘 꼭 넣어 먹기.',4),(28,'라멘트럭 상수본점','라멘','서울 마포구 독막로14길 31','02-336-8456',126.92260220260614,37.54747257117926,'11:00~20:30','일식','돌돌라:돌고돌아라멘트럭. 홍대 라멘의 근본 맛집. 면 종류 선택 가능.',4),(29,'더피자보이즈','피자','서울 마포구 독막로9길 6','02-322-9896',126.919636174129,37.5485932339986,'월~토 12:00 ~ 22:00','양식','하프앤하프 피자+맥주=홍대피플. 파티 사이즈는 진짜X1000 크니 파티할때 포장해가기.',5),(30,'소코아 홍대점','카레, 냉우동','서울 마포구 와우산로15길 49','070-8867-2510',126.920962389879,37.5486445850724,'영업 시간매일 11:30 ~ 22:00','일식','점심 뭐 먹지… 소코아..? 고고..  홍대 카레 맛집. 혼밥도 가능. 여름엔 냉우동도 존맛.',4),(31,'식스티즈','버거','서울 마포구 와우산로23길 9','02-6448-1960',126.924351277419,37.5534653427281,'매일 10:30 ~21:00','양식','홍대 앞 가성비 최고 버거집. 양파는 꼭 그릴드.(강력 권장)',5),(32,'바다회사랑','방어회','서울 마포구 동교로27길 60','02-338-0872',126.921063142318,37.5604116806539,'매일 14:30 ~ 23:00','일식','겨울이 되면 기름이 꽉 찬 방어회 사랑. 웨이팅이 기니 가능하면 포장을 추천.',4),(33,'멕시칸식당베르데','멕시코음식','서울 마포구 동교로 262-6','',126.92542270430523,37.56284720542015,'12:00~22:00','양식','연남동의 작은 멕시코.  맛, 분위기 모두 멕시코에 온 기분.',5),(34,'별자리마라탕&훠궈','마라탕, 마라샹궈, 훠궈','서울 마포구 와우산로23길 50','',126.923721591937,37.5550254654997,'매일 11:30 ~22:30','중식','무게당 가격이 저렴하고 본인이 먹을 양으로 가져올 수 있는, 초심자 추천 가성비 마라탕 맛집.',3),(35,'맛이차이나','짜장면','서울 마포구 독막로 68','02-322-2653',126.920850347282,37.5475849357353,'11:30~22:00','중식','룸까지 준비되어있어 교수님과의 미팅자리에 적합한 중식집. ',3),(36,'카이화','어향가지새우, 유린기','서울 마포구 독막로 73','02-332-4410',126.92151422567083,37.54794667930554,'화~일 11:30~21:00','중식','융통성이라고는 눈꼽만큼도 없는 주방장님이 계신 곳임, 기본 중국집 메뉴 외에 다른 메뉴를 도전해 보고 싶으면 여기서 도전해 보는 것을 추천함',3),(37,'합정광안리','계절회','서울 마포구 독막로3길 38','02-332-7366',126.9175480552219,37.549858598072284,'17:00~1:00','일식',' 사장님이 매일 고기를 직접 공수해와서 장사하고 계심, 계절이 바뀔 때마다 제철 회가 바뀌어서 회가 정말 맛있고, 갠적으로 육반연반 시켜서 육회랑 같이 먹으면 입에서 사르르 녹음',4),(38,'긴자료코 본점','함박스테이크','서울 마포구 홍익로2길 43','02-325-3462',126.924549572234,37.555465684262,'11:00~21:00','일식','갠적으로는 함박 스테이크가 존맛이지만, 사케동이나 대표메뉴인 데미그라스 돈까스도 맛있음 그냥 다 맛있음, 매장이 좁다는 단점이 있지만, 단점을 상쇄시킬만큼 맛있는 맛',4),(39,'송탄영빈루 홍대직영점','짬뽕','서울 마포구 와우산로21길 19-16','02-322-8884',126.922584182109,37.5517667173745,'10:00~22:00','중식','지금 홍대에 있는 중국집 다른 거 다 제쳐두고, 맛만 본다면 최고의 중국집 가끔 교수님들와서 드시는 거 자주 봄 매장도 깔끔하고, 짬뽕과 탕수육 홍대 원탑임',3),(40,'환시앙','짜장면','서울 마포구 와우산로 51','02-322-8813',126.922856273689,37.5490963367892,'11:00~23:00','중식','지금 홍대에 있는 중국집 다른 거 다 제쳐두고, 맛만 본다면 최고의 중국집 가끔 교수님들와서 드시는 거 자주 봄 매장도 깔끔하고, 짬뽕과 탕수육 홍대 원탑임',3),(41,'국제식당 상수점','돼지고기구이','서울 마포구 와우산로 39-4','02-325-1777',126.922642331697,37.5480618505645,'11:30~23:30','한식',' 가격과 맛이 무난하지만, 날씨 좋은날 테라스에서 고기먹으면 분위기 가산점으로 인해 평점 급상승, 테라스에서 먹으면 하늘이 너무 예뻐서 호주산 돼지고기를 먹다가 마치 호주 초원에 가 있는 것 같은 연상을 시킴',2),(42,'홍익숯불갈비소금구이','삼겹살,소금구이','서울 마포구 어울마당로 146-1','02-332-8806',126.926314319718,37.5562344485558,'15:30~4:00','한식','튀르키예즈에서 신기루 누나가 혼밥하던그 집 맞음, 맛도 맛있어서 항상 사람이 바글바글하고 웨이팅도 어느 정도 있지만, 돼지갈비, 목살, 삼결살 상당히 모두 맛있음',2),(43,'수정옥돌생소금구이','소금구이','서울 마포구 어울마당로 146-1','02-323-6292',126.92624186320077,37.556259631240415,'14:00~2:00','한식','홍대 근본 고깃집 중에 하나로 이미 그 위상이 높음. 돌에 구워먹는 재미도 있고 소금구이, 삼겹살, 갈매기살이 매우 맛있음.',2),(44,'닭꼬얌','닭쌈밥','서울 마포구 와우산로18길 29','02-322-3331',126.92381238724376,37.55143775097124,'11:30~24:00','한식','옛부터 홍대 혼밥의 성지였음 가성비가 좋고 깻잎과 계란국이 나오기 때문에 영양가도 챙기면서 빠른 한끼를  해결할 수 있다',2),(45,'몬스터치즈떡볶이','떡볶이','서울 마포구 와우산로29길 57','',126.92698467908716,37.555859149107455,'화~일: 13:30~ 2:00','한식','홍대 자취생들이 포장해서 먹는 괜찮은 떡볶이, 튀김 맛집임. 매장분위기가 매우 트렌디해서 매장에서 먹는 것도 추천. 맛과 분위기를 모두 잡음',2),(46,'경주식당','고기구이','서울 마포구 와우산로13길 49-7','02-322-1674',126.921148208727,37.548424865676,'11:30~23:00','양식','매장 분위기가 매우 좋음 마치 ‘하트시그널 3화 남녀의 퇴근 후 첫 데이트장소’로 나오는 맛집 느낌의 분위기가 남. 맛과 양 모두 만족스럽고, 가격도 매우 합리적이어서 적극 추천!',5),(47,'육전국밥 합정점','국밥','서울 마포구 양화로 36','02-322-0632',126.9133897545952,37.54844105379457,'10:30~21:50','한식','프렌차이즈점이긴한데 매우 독특함, 국밥에 육전이 들어가는데 수많은 근본 국밥들(돼지국밥, 순대국밥, 뼈해장국 etc..)과 견주어봐도 굉징히 맛있음.',2),(50,'향미','가정식 밥상','서울 마포구 홍익로 3-24','02-3141-3195',126.92334917025866,37.55289706783668,'5:30~22:00','한식','편하게 집밥이 생각날 때 갈 수 있는 곳',2),(51,'윤씨밀방','함박스테이크','서울 마포구 와우산로15길 15','',126.92238268158,37.5496438334348,'수~일 11:30~21:00','양식','퓨전음식이어서 신선하다는 점에서 추천. 기본으로 나오는 떡볶이가 맛있음',5),(52,'이양권반상','볶음우동','서울 마포구 와우산로29다길 10','010-4733-4830',126.927659908791,37.555121647823,'11:00~21:00','일식','볶음류의 불맛이 느껴지는 대표메뉴가 맛있는 맛집임. 하이볼이랑 같이 시켜서 먹으면 더욱 맛있음.',4),(54,'무라 홍대2호점','덮밥류','서울 마포구 와우산로29길 4-38','02-333-9123',126.92942534806342,37.55518218209815,'11:20~20:50','일식','냉라멘과 명란우삼겹덮밥이 맛있는 곳',4),(55,'하카타분코','라멘','서울 마포구 독막로19길 43','',126.92379574116,37.5488915191848,'11:30~3:00','일식','표와 배가 추천하는 맛집. 하지만 낮보단 밤이 맛있는 곳',4),(56,'마녀주방 홍대점','퓨전양식','서울 마포구 와우산로21길 36-10','',126.922107756343,37.5528439975489,'12:00~21:30','양식','이색적인 분위기, 특이한 식당을 방문하고 싶다면 추천! 음식 데코가 특이해서 인스타에 올리기 좋음',5),(57,'그녀의밥상','한식','서울 마포구 와우산로21길 36-4','02-324-4074',126.922008475305,37.5525484047186,'11:00~21:00','한식','발발이네와 제순식당을 너무 자주 가서 질린다? 그들의 소중함을 느끼기 위해 한 번 가서 먹고 오는 것을 추천',2),(58,'물고기초밥','초밥','서울 마포구 독막로3길 24-6','',126.9172206545457,37.54915559031915,'11:30~22:00','일식','요즘 새로 뜨는 초밥계의 신성! 큼직한 회와 사장님의 칼질 솜씨와 정성이 들어가서 안 그래도 잘 안 보이는 홍대 초밥계의 한줄기의 빛',4),(59,'홍대씨부엉','떡볶이','서울 마포구 와우산로21길 28-6','02-336-5253',126.92236605342154,37.55258287828445,'11:00~24:00','양식','사장님이 본인의 레시피에 대한 열정과 자부심이 매우 크심! 해물 떡볶이가 가장 맛있고 매장에 아기자기한 소품이 많아서 귀여운 분위기가 좋음',5),(60,'육회예술 새우감성','육회새우','서울 마포구 독막로 95','02-336-7573',126.924083064216,37.5478861899152,'평일 11:30~24:00 주말 16:30~24:00','일식','이름 값을 제대로 살려 육회가 매우 맛있고 비쥬얼도 예뻐서 합격. 새우 감성도 첨가해서 먹으면 더욱 그 맛을 즐길 수 있음.',4),(61,'오늘타코','타코야키','서울 마포구 와우산로13길 19','',126.922233611504,37.5493482078961,'17:00~4:30','일식','가볍게 식사를 마친 후에 후식으로 시켜먹기 매우 맛있는 숨은 맛집. 타고 맛이 다양해서 골라먹는 재미 또한 굳!',4),(62,'홍대미나리식당','가정식백반','서울 마포구 연희로1길 59','',126.926444981618,37.5614711241934,'11:30~20:30','한식','과거에는 가성비와 맛을 함께 챙겨서 인기가 많았지만, 현재는 과거보다 인기가 적은 상태. 그래도 간장제육은 여전히 맛있고 밑반찬 역시 매우 만족스러움.',2),(63,'신미경홍대닭갈비','닭갈비','서울 마포구 와우산로21길 31-10','02-2245-5222',126.921834677029,37.552086978865,'11:00~22:50','한식','유가네 닭갈비 홍대점 진짜 개맛없음 ㄹㅇ 거기 외국인 넘쳐나는데 그럴바에 여기 감. 홍대 근처에 닭갈비 먹을 만한데가 없는데 여기가 그나마 괜찮음',2),(64,'홍대돈부리 순천점','닭칼국수','전남 순천시 연향중앙상가길 17','061-721-9291',127.519959819907,34.9521873190582,'10:00~20:00','한식','홍익대학교 앞에 위치 하고 있어서 빠르게 먹고 쉬기 편함, 닭칼국수가 매우 맛있음!',2);
/*!40000 ALTER TABLE `stores_stores` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-07  3:43:16
