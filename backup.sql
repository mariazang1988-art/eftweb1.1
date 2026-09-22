-- ========================================================
-- E.F.T. (HE Efficient and Industry Limited) MySQL Dump
-- Target Server: Ubuntu VPS (Apache + PHP + MySQL 8.0+)
-- Database: efficientsh
-- Zero-Build / Ready to import without npm install
-- ========================================================

CREATE DATABASE IF NOT EXISTS `efficientsh` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `efficientsh`;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cat_id` int NOT NULL DEFAULT '1',
  `cat_name` varchar(100) NOT NULL DEFAULT '工业设备',
  `name` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT '',
  `model_no` varchar(100) DEFAULT '',
  `price` varchar(100) DEFAULT '面议 / Negotiable',
  `specs` text,
  `img_url` text NOT NULL,
  `video_url` varchar(255) DEFAULT '',
  `is_hot` tinyint(1) DEFAULT '0',
  `stock` int DEFAULT '100',
  `ecommerce_price` decimal(10,2) DEFAULT '0.00',
  `seo_keywords` text,
  `seo_description` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` VALUES (15, 7, '电子电气', 'B111一拖二家用办公室无线遥控门铃', 'B111 1-to-2 Wireless Doorbell with Remote Control for Home and Office Use', 'EFT-B111-WIRELESS', '面议 / Negotiable', 'Model: B111; Type: 1-to-2 (1 Receiver, 2 Transmitters); Power Source: AC Plug-in; Frequency: High-frequency wireless transmission; Application: Residential and Commercial; Certifications: CE/RoHS', '/prophoto/sourced_1789893923162_0_1789893923657_309874659c.jpg, /prophoto/sourced_1789893923691_1_1789893923739_7fc1ca3e0c.jpg, /prophoto/sourced_1789893923765_2_1789893923781_1a99218e14.jpg, /prophoto/sourced_1789893923788_3_1789893923806_e81ceb7a30.jpg', 'https://img.alicdn.com/imgextra/i4/6000000001921/O1CN01Fe8so01Q3rPf6I8Ox_!!6000000001921-0-tbvideo.jpg', 1, 500, 45, 'wireless doorbell, office doorbell, remote control doorbell, AC powered doorbell, intercom system, B2B wholesale doorbell', 'High-quality B111 wireless doorbell featuring 1-to-2 configuration, suitable for homes and offices. Easy installation, stable signal, and durable design for B2B export.', '2026-09-20 08:45:37');
INSERT INTO `products` VALUES (14, 7, '电子电气', 'F536无线家用门铃交流数码一拖一呼叫器按键可设不同铃声门铃', 'F536 Wireless AC Digital Doorbell with One-to-One Paging and Adjustable Ringtone Settings', 'EFT-F536', '面议 / Negotiable', 'Power Supply: AC; Connection Type: Wireless; Paging: One-to-One; Features: Adjustable Ringtones, Digital Signal Processing; Mounting: Wall-mount; Certifications: CE/RoHS', '/prophoto/sourced_1789893885923_0_1789893886194_b6e1ac2f1c.jpg, /prophoto/sourced_1789893886227_1_1789893886277_518bc407b3.jpg, /prophoto/sourced_1789893886312_2_1789893886330_02c735a8e2.jpg, /prophoto/sourced_1789893886349_3_1789893886369_17ad44923d.jpg, /prophoto/sourced_1789893886373_4_1789893886390_5b18c12b23.jpg', 'https://img.alicdn.com/imgextra/i4/6000000000583/O1CN01Z5wVUm1GB3wtv1PN9_!!6000000000583-0-tbvideo.jpg', 1, 500, 25.5, 'wireless doorbell, digital paging system, AC door chime, home security bell, smart doorbell F536, B2B wholesale electronics', 'Professional F536 wireless digital doorbell featuring one-to-one paging and selectable ringtones. Ideal for residential and commercial entry notification systems.', '2026-09-20 08:45:06');
INSERT INTO `products` VALUES (11, 1, '工业设备', '自动化工作流测试产品 EFT-WORKFLOW-01', '', 'EFT-WF-01', '¥28,000', '自动化工作流一键导入测试规格', '/prophoto/1368357932.jpg', '', 0, 100, 0, '', '', '2026-09-17 06:03:58');
INSERT INTO `products` VALUES (10, 7, '超市学校', '精密工业级部件总成 Precision Industrial Unit EFT-4903', 'High Precision OEM Engineered Assembly - China Direct Export Quality', 'EFT-IND-4903', '面议 / Negotiable', 'Standard: ISO9001 / CE; Material: High-Grade Alloy Steel / Aluminum; Precision: ±0.01mm; Surface Treatment: Anti-rust Anodized / Shot Peened; Quality Control: 100% CMM Inspected.', '/prophoto/1368359523.jpg', '', 1, 200, 350, 'industrial equipment China, OEM precision machining supplier Shanghai, precision mechanical components export, Baidu Google SEO top rank', 'HE Efficient and Industry Limited provides precision industrial components and assembly solutions for global markets with high durability and strict quality control.', '2026-09-17 01:15:52');
INSERT INTO `products` VALUES (9, 2, '工业设备', '精密工业级部件总成 Precision Industrial Unit EFT-2015', 'High Precision OEM Engineered Assembly - China Direct Export Quality', 'EFT-IND-2015', '面议 / Negotiable', 'Standard: ISO9001 / CE; Material: High-Grade Alloy Steel / Aluminum; Precision: ±0.01mm; Surface Treatment: Anti-rust Anodized / Shot Peened; Quality Control: 100% CMM Inspected.', '/prophoto/1368357356.jpg', '', 1, 200, 350, 'industrial equipment China, OEM precision machining supplier Shanghai, precision mechanical components export, Baidu Google SEO top rank', 'HE Efficient and Industry Limited provides precision industrial components and assembly solutions for global markets with high durability and strict quality control.', '2026-09-17 01:15:09');
INSERT INTO `products` VALUES (1, 5, '汽摩配件', '凸轮轴 cam shaft', 'High Precision Automotive Engine Camshaft Assemblies', 'EFT-CS-2026', '面议 / Negotiable', 'Material: Chilled Cast Iron / Forged Alloy Steel; Tolerance: ±0.005mm; Surface Hardness: HRC 58-62; Applicable engines: Cummins, Weichai, Yuchai, Deutz.', '/images/products/1368349295.jpg', '', 1, 260, 320, 'cam shaft, 凸轮轴, automotive camshaft, engine components, OEM auto parts China', 'E.F.T. supplies high-precision automotive and industrial engine camshafts with CNC hardening and ISO9001 certification.', '2026-03-10 09:20:00');
INSERT INTO `products` VALUES (2, 5, '汽摩配件', '油底壳 Engine Oil Pan', 'Heavy Duty Die-Cast Aluminum & Stamped Steel Oil Pan', 'EFT-OP-8800', '面议 / Negotiable', 'Material: High-strength die-cast aluminum alloy A380; Volume: 15L-35L; Anti-corrosion electro-deposition coating; Leak testing: 100% pneumatic inspection.', '/images/products/1368349483.jpg', '', 1, 180, 195, 'oil pan, 油底壳, engine oil sump, cast aluminum pan, truck parts supplier', 'Professional die-cast engine oil pans engineered for commercial trucks, heavy machinery, and marine diesel engines.', '2026-03-11 11:15:00');
INSERT INTO `products` VALUES (3, 4, '发电机组', '天然气发电机组 Natural Gas Genset', 'High-Efficiency Low-Emission Cogeneration Gas Generator', 'EFT-NG-1200KW', '面议 / Inquire', 'Rated Power: 200kW - 1200kW; Frequency: 50/60Hz; Gas Consumption: <=0.28m3/kW.h; Grid parallel capability; CHP thermal recovery efficiency up to 88%.', '/images/products/1368357356.jpg', '', 1, 25, 48500, 'natural gas genset, 天然气发电机组, gas generator set, clean power generation, cogeneration unit', 'Continuous power solutions with EFT Natural Gas Generator Sets designed for industrial plants, oilfields, and commercial microgrids.', '2026-03-12 14:00:00');
INSERT INTO `products` VALUES (4, 3, '生产装备', '全自动无菌牛奶生产线 Aseptic Milk Line', 'Turnkey Dairy UHT Sterilization & Packaging Production Line', 'EFT-DAIRY-5000L', '面议 / Project Quote', 'Capacity: 1,000L - 10,000L/hour; CIP automatic cleaning system; Siemens PLC central SCADA control; SUS316L food grade stainless steel sanitary standard.', '/images/products/1368357932.jpg', '', 1, 8, 128000, 'milk production line, 无菌牛奶生产线, dairy processing equipment, aseptic filling line, beverage machinery turnkey', 'Complete automated turnkey dairy and juice processing lines from milk receiving, standardization, UHT, to aseptic carton packaging.', '2026-03-13 10:30:00');
INSERT INTO `products` VALUES (5, 2, '工业设备', '房车生产线 RV Assembly Line', 'Automated Motorhome & Caravan Production Assembly Line', 'EFT-RV-PRO', '面议 / Custom Engineered', 'Modular conveyor stations: chassis integration, composite wall lamination, interior furnishing, electronics testing; Cycle time: 45 min/vehicle.', '/images/products/1368358603.jpg', '', 1, 5, 360000, 'RV production line, 房车生产线, motorhome manufacturing line, automotive assembly conveyor, turnkey factory line', 'State-of-the-art flexible RV and camper manufacturing production line system with robotic lifting and automatic guided vehicle transfer.', '2026-03-13 15:45:00');
INSERT INTO `products` VALUES (6, 2, '工业设备', '工业超纯水处理设备 Industrial Ultrapure Water System', 'RO + EDI Two-Stage Electronic Grade Ultrapure Water System', 'EFT-UPW-20T', '面议 / Quote', 'Flow Rate: 5T/h - 100T/h; Output Resistivity: 18.2 MOhm·cm @25℃; TOC < 5ppb; Dow Filmtec reverse osmosis membranes; EDI continuous deionization.', '/images/products/1368359371.jpg', '', 1, 15, 68000, 'ultrapure water system, 工业超纯水处理设备, industrial RO EDI water treatment, electronic grade pure water, semiconductor water plant', 'Advanced industrial ultrapure water purification equipment for electronics, pharmaceuticals, power stations, and chemical industries.', '2026-03-14 09:10:00');
INSERT INTO `products` VALUES (7, 2, '工业设备', '废气处理成套设备 VOCs Exhaust Gas Treatment System', 'Regenerative Thermal Oxidizer (RTO) & Catalytic Combustion VOCs Unit', 'EFT-RTO-30000', '面议 / Project Quote', 'Airflow capacity: 5,000 - 80,000 Nm3/h; VOCs removal efficiency: >=99.2%; Heat recovery thermal efficiency: >=95%; Ceramic honeycomb heat storage bed.', '/images/products/1368359523.jpg', '', 0, 12, 92000, 'exhaust gas treatment, 废气处理成套设备, RTO regenerative thermal oxidizer, industrial VOCs abatement, air pollution control equipment', 'Comprehensive environmental VOCs and industrial exhaust gas treatment systems meeting international environmental discharge standards.', '2026-03-14 13:20:00');
INSERT INTO `products` VALUES (8, 9, '机械五金', '铸件毛坯开发 Casting Blank Development', 'Custom Precision Sand Casting & Investment Casting Blanks', 'EFT-CAST-OEM', '面议 / Negotiable', 'Materials: Ductile iron QT450/QT500, Gray iron HT250, Carbon steel, Stainless steel 304/316; Casting weight: 0.5kg - 5,000kg; 3D CMM inspection report included.', '/images/products/1368360522.jpg', '', 0, 500, 150, 'casting blank, 铸件毛坯开发, OEM iron casting, precision investment casting China, custom foundry service', 'High-quality OEM casting blank prototyping and volume production service with CNC roughing and finish machining capabilities.', '2026-03-15 08:30:00');

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT '公司动态',
  `summary` text,
  `content` longtext,
  `publish_date` varchar(50) DEFAULT '',
  `target_url` varchar(255) DEFAULT '',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `news` VALUES (1, '如何让自己的网站更有质量？AB模板王有妙招', '行业资讯', '企业出海与国际贸易网站如何构建高信任感？从用户体验、国际化多语言版面以及核心产品动态展示深度解析。', '在当今全球化商务竞争中，企业官方网站是海外买家了解公司实力与产品标准的第一窗口。E.F.T.（HE Efficient and Industry Limited）依托多年跨国贸易经验，通过优化网页加载速度、提供无障碍6国语言交互、以及详实的技术规格参数，为全球采购商打造无缝体验。', '2026-03-10', '', '2026-03-10 10:00:00');
INSERT INTO `news` VALUES (2, '带着 SEO 思维选域名，您的网络品牌建设事半功倍', '企业动态', '国际品牌域名的结构设计、全站目录结构与搜索引擎GEO地理定位优化对Google和Baidu自然排名的重要意义。', '域名与规范化URL路径（如/product/class/）能显著提升搜索引擎蜘蛛对工业大类分类的抓取效率。结合规范化的OpenGraph、元数据标签以及结构化微数据，可以使企业成套设备与关键零部件在海外目标市场快速获得前列搜索展示。', '2026-03-08', '', '2026-03-08 11:30:00');
INSERT INTO `news` VALUES (3, '内容优化之有“心”创作，打动用户的关键所在', '技术前沿', '工业制造与成套生产线出口的专业文案撰写，如何从技术参数、实测报告与行业案例多维度打动大型采购商。', '真正有竞争力的外贸展示不是泛泛空谈，而是直击工程客户痛点的参数指标：材质牌号、形位公差、检测标准、装配产能与售后维保响应。E.F.T.始终坚持技术导向，每一项产品皆配备严格的工业测试标准。', '2026-03-05', '', '2026-03-05 14:20:00');
INSERT INTO `news` VALUES (4, '网络公司告诉你有关面包屑导航的事', '网站指南', '工业品类繁多的企业门户如何借助清晰的面包屑导航指引访客快速锁定目标产品类别与询盘入口。', '清晰的目录层级有助于工业客户在成套生产线、发电机组与汽摩配件之间高效穿梭。配合右下角即时在线客服与5秒主动应答机制，极大提升了采购意向转换率。', '2026-03-01', '', '2026-03-01 16:00:00');
INSERT INTO `news` VALUES (5, '怎样做一个符合 W3C 规范的网页', '技术标准', '全面支持手机、iPad平板和电脑全端自适应响应式设计的工程实践与跨浏览器兼容性保障。', '遵循现代Web开放标准，确保无论买家在海外工厂车间使用iPad现场审阅、还是在办公室多屏工作站查验CAD图纸，均能呈现出精准的排版、舒适的行距与高对比度色彩。', '2026-02-26', '', '2026-02-26 09:40:00');

DROP TABLE IF EXISTS `inquiries`;
CREATE TABLE `inquiries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(100) DEFAULT '',
  `company` varchar(200) DEFAULT '',
  `message` text NOT NULL,
  `ip` varchar(50) DEFAULT '',
  `status` enum('unread','read','replied') DEFAULT 'unread',
  `reply_content` text,
  `replied_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `inquiries` VALUES (1, '张工程经理 (Zhang)', 'zhang.tech@heavyequip.cn', '+86 138 1234 5678', '华东动力重工集团', '您好，我们厂区扩建需要采购2套1200KW天然气发电机组及热电联产并网配套，请发送完整技术协议书和商务报价至邮箱，谢谢。', '180.168.22.45', 'unread', NULL, NULL, '2026-03-15 16:30:20');
INSERT INTO `inquiries` VALUES (2, 'Carlos Mendoza', 'carlos.m@transglobal-logistics.mx', '+52 55 4123 8890', 'Mendoza Auto Parts Mexico', 'Dear Sir, We are interested in regular bulk container shipment of diesel engine camshafts (EFT-CS-2026) and oil pans. Please advise MOQ and CIF Manzanillo port pricing.', '201.144.18.92', 'read', 'Sent technical catalog and quotation sheet to customer email.', '2026-03-15 17:10:00', '2026-03-15 14:12:08');

DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `user_email` varchar(150) DEFAULT '',
  `user_phone` varchar(100) DEFAULT '',
  `role` enum('user','bot','admin') DEFAULT 'user',
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `visitors`;
CREATE TABLE `visitors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `country` varchar(100) DEFAULT '中国',
  `city` varchar(100) DEFAULT '上海',
  `location_detail` varchar(255) DEFAULT '',
  `page_url` varchar(255) DEFAULT '/',
  `stay_seconds` int DEFAULT '0',
  `referrer` varchar(255) DEFAULT '',
  `os` varchar(100) DEFAULT '',
  `browser` varchar(100) DEFAULT '',
  `user_agent` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `visitors` VALUES (1789914168245, '127.0.0.1', '中国', '上海', '', '/', 1, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', '', '2026-09-20 14:22:48');
INSERT INTO `visitors` VALUES (1789914168931, '127.0.0.1', '中国', '上海', '', '/', 1, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', '', '2026-09-20 14:22:48');
INSERT INTO `visitors` VALUES (1789912903067, '127.0.0.1', '中国', '上海', '', '/', 1, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', '', '2026-09-20 14:01:42');
INSERT INTO `visitors` VALUES (1789912902799, '127.0.0.1', '中国', '上海', '', '/', 1, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', '', '2026-09-20 14:01:42');
INSERT INTO `visitors` VALUES (1789911199745, '127.0.0.1', '中国', '上海', '', '/', 1, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', '', '2026-09-20 13:33:18');
INSERT INTO `visitors` VALUES (1789911198964, '127.0.0.1', '中国', '上海', '', '/', 1, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', '', '2026-09-20 13:33:18');
INSERT INTO `visitors` VALUES (1789910994363, '127.0.0.1', '中国', '上海', '', '/', 1, 'https://ais-dev-6qsc3pcynonabnya7qnt47-259864977174.us-west2.run.app/', 'Windows PC', 'Google Chrome', '', '2026-09-20 13:29:53');
INSERT INTO `visitors` VALUES (1789910994361, '127.0.0.1', '中国', '上海', '', '/', 1, 'https://ais-dev-6qsc3pcynonabnya7qnt47-259864977174.us-west2.run.app/', 'Windows PC', 'Google Chrome', '', '2026-09-20 13:29:53');
INSERT INTO `visitors` VALUES (1789910941315, '127.0.0.1', '中国', '上海', '', '/', 1, 'https://ais-dev-6qsc3pcynonabnya7qnt47-259864977174.us-west2.run.app/', 'Windows PC', 'Google Chrome', '', '2026-09-20 13:29:00');
INSERT INTO `visitors` VALUES (1789910924593, '127.0.0.1', '中国', '上海', '', '/', 1, 'https://ais-dev-6qsc3pcynonabnya7qnt47-259864977174.us-west2.run.app/', 'Windows PC', 'Google Chrome', '', '2026-09-20 13:28:43');
INSERT INTO `visitors` VALUES (1789910924779, '127.0.0.1', '中国', '上海', '', '/', 1, 'https://ais-dev-6qsc3pcynonabnya7qnt47-259864977174.us-west2.run.app/', 'Windows PC', 'Google Chrome', '', '2026-09-20 13:28:43');
INSERT INTO `visitors` VALUES (1789909772600, '127.0.0.1', '中国', '上海', '', '/', 1, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', '', '2026-09-20 13:09:31');
INSERT INTO `visitors` VALUES (1789909757696, '127.0.0.1', '中国', '上海', '', '/', 1, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', '', '2026-09-20 13:09:17');
INSERT INTO `visitors` VALUES (1789909757942, '127.0.0.1', '中国', '上海', '', '/', 1, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', '', '2026-09-20 13:09:17');
INSERT INTO `visitors` VALUES (1789909688708, '127.0.0.1', '中国', '上海', '', '/', 1, 'https://ais-dev-6qsc3pcynonabnya7qnt47-259864977174.us-west2.run.app/', 'Windows PC', 'Google Chrome', '', '2026-09-20 13:08:08');
INSERT INTO `visitors` VALUES (1789909688277, '127.0.0.1', '中国', '上海', '', '/', 1, 'https://ais-dev-6qsc3pcynonabnya7qnt47-259864977174.us-west2.run.app/', 'Windows PC', 'Google Chrome', '', '2026-09-20 13:08:08');
INSERT INTO `visitors` VALUES (1789907401358, '127.0.0.1', '中国', '上海', '', '/', 1, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', '', '2026-09-20 12:30:01');
INSERT INTO `visitors` VALUES (1789906764987, '127.0.0.1', '中国', '上海', '', '/', 1, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', '', '2026-09-20 12:19:24');
INSERT INTO `visitors` VALUES (1789906643942, '127.0.0.1', '中国', '上海', '', '/', 1, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', '', '2026-09-20 12:17:23');
INSERT INTO `visitors` VALUES (1789906643429, '127.0.0.1', '中国', '上海', '', '/', 1, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', '', '2026-09-20 12:17:23');
INSERT INTO `visitors` VALUES (149, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 430, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 08:50:56');
INSERT INTO `visitors` VALUES (148, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/admin/', 240, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 08:46:55');
INSERT INTO `visitors` VALUES (147, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 20, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 08:46:32');
INSERT INTO `visitors` VALUES (146, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/admin/', 490, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 08:24:42');
INSERT INTO `visitors` VALUES (145, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 08:24:38');
INSERT INTO `visitors` VALUES (144, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/product/class/', 10, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 08:24:28');
INSERT INTO `visitors` VALUES (143, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 10, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 08:24:15');
INSERT INTO `visitors` VALUES (142, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 08:24:15');
INSERT INTO `visitors` VALUES (141, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 1215, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 08:24:14');
INSERT INTO `visitors` VALUES (140, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 125, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 07:46:57');
INSERT INTO `visitors` VALUES (139, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/admin/', 115, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 07:45:02');
INSERT INTO `visitors` VALUES (138, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 65, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 07:43:56');
INSERT INTO `visitors` VALUES (137, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 07:43:56');
INSERT INTO `visitors` VALUES (136, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 310, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 07:43:56');
INSERT INTO `visitors` VALUES (135, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 620, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 07:33:32');
INSERT INTO `visitors` VALUES (134, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/admin/', 510, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 07:25:00');
INSERT INTO `visitors` VALUES (133, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 230, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 07:21:06');
INSERT INTO `visitors` VALUES (132, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 07:21:06');
INSERT INTO `visitors` VALUES (131, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 1370, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 07:21:06');
INSERT INTO `visitors` VALUES (130, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 550, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 07:11:54');
INSERT INTO `visitors` VALUES (129, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/admin/', 1440, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 06:34:02');
INSERT INTO `visitors` VALUES (128, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 5, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 06:33:54');
INSERT INTO `visitors` VALUES (127, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/admin/', 20, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 06:33:33');
INSERT INTO `visitors` VALUES (126, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 95, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 06:31:57');
INSERT INTO `visitors` VALUES (125, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/product/class/', 5, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 06:31:48');
INSERT INTO `visitors` VALUES (124, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 15, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 06:31:28');
INSERT INTO `visitors` VALUES (123, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 06:31:28');
INSERT INTO `visitors` VALUES (122, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 2150, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 06:31:28');
INSERT INTO `visitors` VALUES (121, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 670, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 06:20:14');
INSERT INTO `visitors` VALUES (120, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 06:20:14');
INSERT INTO `visitors` VALUES (119, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 670, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 06:20:14');
INSERT INTO `visitors` VALUES (118, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 70, 'https://ais-dev-zdjzos6hfnfzuxxyb5kjpz-429000343916.us-east1.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 06:19:03');
INSERT INTO `visitors` VALUES (117, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'https://ais-dev-zdjzos6hfnfzuxxyb5kjpz-429000343916.us-east1.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 06:19:03');
INSERT INTO `visitors` VALUES (116, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'https://ais-dev-zdjzos6hfnfzuxxyb5kjpz-429000343916.us-east1.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 06:19:03');
INSERT INTO `visitors` VALUES (115, '128.14.180.210', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 70, 'https://ais-dev-zdjzos6hfnfzuxxyb5kjpz-429000343916.us-east1.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 06:19:03');
INSERT INTO `visitors` VALUES (114, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 2270, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 04:27:00');
INSERT INTO `visitors` VALUES (113, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 04:27:00');
INSERT INTO `visitors` VALUES (112, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 2280, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 04:27:00');
INSERT INTO `visitors` VALUES (111, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 5625, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 02:44:18');
INSERT INTO `visitors` VALUES (110, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 02:44:18');
INSERT INTO `visitors` VALUES (109, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 5620, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 02:44:18');
INSERT INTO `visitors` VALUES (108, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 55, 'https://ais-dev-yhb4hcdbgoqi4djq4uzhpj-337729553144.us-east5.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 02:43:10');
INSERT INTO `visitors` VALUES (107, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'https://ais-dev-yhb4hcdbgoqi4djq4uzhpj-337729553144.us-east5.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 02:43:10');
INSERT INTO `visitors` VALUES (106, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 60, 'https://ais-dev-yhb4hcdbgoqi4djq4uzhpj-337729553144.us-east5.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 02:43:10');
INSERT INTO `visitors` VALUES (105, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'https://ais-dev-yhb4hcdbgoqi4djq4uzhpj-337729553144.us-east5.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-20 02:43:10');
INSERT INTO `visitors` VALUES (104, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 1220, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 07:40:12');
INSERT INTO `visitors` VALUES (103, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/admin/', 25, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 07:39:47');
INSERT INTO `visitors` VALUES (102, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 5, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 07:39:39');
INSERT INTO `visitors` VALUES (101, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/admin/', 35, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 07:39:00');
INSERT INTO `visitors` VALUES (100, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 190, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 07:35:47');
INSERT INTO `visitors` VALUES (99, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 07:35:47');
INSERT INTO `visitors` VALUES (98, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 1485, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 07:35:47');
INSERT INTO `visitors` VALUES (97, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 2020, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 06:53:14');
INSERT INTO `visitors` VALUES (96, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/admin/', 40, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 06:52:30');
INSERT INTO `visitors` VALUES (95, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 115, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 06:50:31');
INSERT INTO `visitors` VALUES (94, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 2190, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 06:50:31');
INSERT INTO `visitors` VALUES (93, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 06:50:31');
INSERT INTO `visitors` VALUES (92, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 2560, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 06:05:24');
INSERT INTO `visitors` VALUES (91, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 06:05:24');
INSERT INTO `visitors` VALUES (90, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 2560, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 06:05:24');
INSERT INTO `visitors` VALUES (89, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 1940, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 05:25:11');
INSERT INTO `visitors` VALUES (88, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/admin/', 50, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 05:24:19');
INSERT INTO `visitors` VALUES (87, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 555, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 05:15:02');
INSERT INTO `visitors` VALUES (86, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 05:15:02');
INSERT INTO `visitors` VALUES (85, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 2555, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 05:15:02');
INSERT INTO `visitors` VALUES (84, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 445, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 05:07:33');
INSERT INTO `visitors` VALUES (83, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 05:07:33');
INSERT INTO `visitors` VALUES (82, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 450, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 05:07:33');
INSERT INTO `visitors` VALUES (81, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 165, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 05:04:45');
INSERT INTO `visitors` VALUES (80, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 05:04:45');
INSERT INTO `visitors` VALUES (79, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 165, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 05:04:45');
INSERT INTO `visitors` VALUES (78, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 100, 'https://ais-dev-is44miaqtyb2o3nvydq3n2-259864977174.us-west2.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 05:03:02');
INSERT INTO `visitors` VALUES (77, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'https://ais-dev-is44miaqtyb2o3nvydq3n2-259864977174.us-west2.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 05:03:02');
INSERT INTO `visitors` VALUES (76, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 325, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 01:20:26');
INSERT INTO `visitors` VALUES (75, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 01:20:26');
INSERT INTO `visitors` VALUES (74, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 220, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 01:16:33');
INSERT INTO `visitors` VALUES (73, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/admin/', 290, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 01:11:43');
INSERT INTO `visitors` VALUES (72, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 5, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 01:11:33');
INSERT INTO `visitors` VALUES (71, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 01:11:33');
INSERT INTO `visitors` VALUES (70, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/admin/', 40, 'https://ais-dev-hh2u4m3ktg6dn6jkzjiotn-366631453563.us-east1.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 01:10:50');
INSERT INTO `visitors` VALUES (69, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 15, 'https://ais-dev-hh2u4m3ktg6dn6jkzjiotn-366631453563.us-east1.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 01:10:35');
INSERT INTO `visitors` VALUES (68, '128.14.162.114', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'https://ais-dev-hh2u4m3ktg6dn6jkzjiotn-366631453563.us-east1.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-17 01:10:35');
INSERT INTO `visitors` VALUES (67, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 4325, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 12:11:11');
INSERT INTO `visitors` VALUES (66, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 12:11:11');
INSERT INTO `visitors` VALUES (65, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 7200, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 08:21:31');
INSERT INTO `visitors` VALUES (64, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 08:21:31');
INSERT INTO `visitors` VALUES (63, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 2075, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:46:53');
INSERT INTO `visitors` VALUES (62, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:46:53');
INSERT INTO `visitors` VALUES (61, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 285, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:42:06');
INSERT INTO `visitors` VALUES (60, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:42:06');
INSERT INTO `visitors` VALUES (59, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 690, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:29:32');
INSERT INTO `visitors` VALUES (58, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:29:32');
INSERT INTO `visitors` VALUES (57, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 45, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:28:43');
INSERT INTO `visitors` VALUES (56, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/contact/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:28:41');
INSERT INTO `visitors` VALUES (55, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/message/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:28:40');
INSERT INTO `visitors` VALUES (54, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/contact/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:28:36');
INSERT INTO `visitors` VALUES (53, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/product/class/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:28:35');
INSERT INTO `visitors` VALUES (52, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/news/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:28:33');
INSERT INTO `visitors` VALUES (51, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/introduce/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:28:31');
INSERT INTO `visitors` VALUES (50, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 275, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:23:51');
INSERT INTO `visitors` VALUES (49, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:23:51');
INSERT INTO `visitors` VALUES (48, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:19:06');
INSERT INTO `visitors` VALUES (47, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 280, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:19:06');
INSERT INTO `visitors` VALUES (46, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 185, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:13:54');
INSERT INTO `visitors` VALUES (45, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/admin/', 55, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:12:58');
INSERT INTO `visitors` VALUES (44, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 10, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:12:48');
INSERT INTO `visitors` VALUES (43, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/contact/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:12:45');
INSERT INTO `visitors` VALUES (42, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/message/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:12:42');
INSERT INTO `visitors` VALUES (41, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/product/class/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:12:40');
INSERT INTO `visitors` VALUES (40, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/news/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:12:35');
INSERT INTO `visitors` VALUES (39, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/introduce/', 180, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:09:34');
INSERT INTO `visitors` VALUES (38, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 15, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:09:15');
INSERT INTO `visitors` VALUES (37, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 07:09:15');
INSERT INTO `visitors` VALUES (36, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 850, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 06:55:03');
INSERT INTO `visitors` VALUES (35, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/introduce/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 06:55:00');
INSERT INTO `visitors` VALUES (34, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 06:54:56');
INSERT INTO `visitors` VALUES (33, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/contact/', 5, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 06:54:52');
INSERT INTO `visitors` VALUES (32, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/message/', 5, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 06:54:45');
INSERT INTO `visitors` VALUES (31, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/product/class/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 06:54:42');
INSERT INTO `visitors` VALUES (30, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/news/', 5, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 06:54:36');
INSERT INTO `visitors` VALUES (29, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/introduce/', 75, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 06:53:20');
INSERT INTO `visitors` VALUES (28, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 235, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 06:49:21');
INSERT INTO `visitors` VALUES (27, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 06:49:21');
INSERT INTO `visitors` VALUES (26, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 55, 'https://ais-dev-yuklgtj55mfdesmxrsgfbn-429000343916.us-east1.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 06:48:33');
INSERT INTO `visitors` VALUES (25, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'https://ais-dev-yuklgtj55mfdesmxrsgfbn-429000343916.us-east1.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 06:48:33');
INSERT INTO `visitors` VALUES (24, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 760, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 06:00:24');
INSERT INTO `visitors` VALUES (23, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 06:00:24');
INSERT INTO `visitors` VALUES (22, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 470, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:52:33');
INSERT INTO `visitors` VALUES (21, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:52:33');
INSERT INTO `visitors` VALUES (20, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/contact/', 585, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:42:44');
INSERT INTO `visitors` VALUES (19, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/message/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:42:40');
INSERT INTO `visitors` VALUES (18, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/product/class/', 5, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:42:33');
INSERT INTO `visitors` VALUES (17, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/news/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:42:29');
INSERT INTO `visitors` VALUES (16, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/introduce/', 5, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:42:22');
INSERT INTO `visitors` VALUES (15, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 135, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:40:02');
INSERT INTO `visitors` VALUES (14, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'Google 搜索引擎 (https://aistudio.google.com/)', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:40:02');
INSERT INTO `visitors` VALUES (13, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/contact/', 345, 'https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:34:16');
INSERT INTO `visitors` VALUES (12, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/message/', 20, 'https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:33:55');
INSERT INTO `visitors` VALUES (11, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/product/class/', 105, 'https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:32:08');
INSERT INTO `visitors` VALUES (10, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/news/', 5, 'https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:31:59');
INSERT INTO `visitors` VALUES (9, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/introduce/', 25, 'https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:31:29');
INSERT INTO `visitors` VALUES (8, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 140, 'https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:29:06');
INSERT INTO `visitors` VALUES (7, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/admin/', 10, 'https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:28:53');
INSERT INTO `visitors` VALUES (6, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 1000, 'https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:11:55');
INSERT INTO `visitors` VALUES (5, '107.151.187.186', '中国 (China)', '上海市 (Shanghai)', '中国 华东地区 电信骨干节点', '/', 0, 'https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/', 'Windows PC', 'Google Chrome', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', '2026-09-16 05:11:55');
INSERT INTO `visitors` VALUES (1, '180.168.22.45', '中国 (China)', '上海市浦东新区', '中国 上海市浦东新区 电信骨干网', '/product/class/', 142, 'https://www.google.com/search?q=EFT+发电机组+上海', 'Windows 11 64-bit', 'Chrome 122.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', '2026-03-15 16:20:10');
INSERT INTO `visitors` VALUES (2, '201.144.18.92', '墨西哥 (Mexico)', 'Mexico City', 'Mexico, Distrito Federal, Telmex Enterprise', '/product/class/?id=1', 320, 'https://www.google.com/search?q=automotive+camshaft+supplier+shanghai', 'macOS Sonoma', 'Safari 17.3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3 Safari/605.1.15', '2026-03-15 14:05:32');
INSERT INTO `visitors` VALUES (3, '52.90.114.22', '美国 (United States)', 'Ashburn, Virginia', 'United States, Virginia, AWS East Datacenter', '/introduce/', 68, '直接输入网址 (Direct URL)', 'Windows 10', 'Microsoft Edge 122', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0', '2026-03-15 13:40:15');
INSERT INTO `visitors` VALUES (4, '116.228.111.89', '中国 (China)', '上海市嘉定区', '中国 上海市嘉定区工业区 中国联通', '/', 85, 'https://www.baidu.com/s?wd=HE Efficient and Industry Limited', 'iOS 17.4 (iPhone 15 Pro)', 'Mobile Safari', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1', '2026-03-15 12:15:00');

DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` int NOT NULL DEFAULT '1',
  `config_json` longtext NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `system_config` (`id`, `config_json`) VALUES (1, '{"company_name": "HE Efficient and Industry Limited", "company_en": "HE Efficient and Industry Limited", "passcode": "admin888", "sales_phone": "021-6257 8368", "contact_person": "普先生 (Mr. Pu)", "contact_email": "info@efficientsh.com", "site_url": "www.efficientsh.com", "address_shanghai_reg": "上海嘉定工业区叶城路1630号8幢10762室", "address_shanghai_office": "嘉定工业区叶城路1630号8幢10762室；浦东外高桥保税区菲拉路55号409", "address_usa": "17700 CASTLETON ST, SUITE 288, CITY OF INDUSTRY, CA 91748, USA", "address_hk": "ROOM 1502, 15/F, FU LEE COMMERCIAL BUILDING, NO. 14-20, PILKEM STREET, JORDAN, KOWLOON, HONGKONG", "baidu_netdisk_api_key": "121.7147364e9181402b9118759d222b66b2.YCtEattdaBYff6PE_XU8EcoF8XfoPlP2qDjFh-O.xGGSRw", "google_drive_api_key": "", "backup_interval_days": 2, "backup_retention_days": 10, "downtime_auto_restore": true, "smtp_host": "smtp.efficientsh.com", "smtp_port": 465, "smtp_user": "noreply@efficientsh.com", "smtp_pass": "EftSecureSmtp2026", "mysql_host": "localhost", "mysql_port": 3306, "mysql_user": "root", "mysql_database": "efficientsh", "google_drive_client_id": "", "google_drive_client_secret": "", "google_drive_access_token": "", "google_drive_refresh_token": "", "google_drive_account_email": "", "google_drive_folder_id": "", "google_drive_folder_name": "", "google_drive_connected": false, "google_drive_auto_files": true, "google_drive_auto_database": true, "google_drive_verify_upload": true, "google_drive_retention_count": 7, "baidu_netdisk_app_key": "8yH7YBQHUenTBYybBtABV5MzUY70GIUJ", "baidu_netdisk_app_secret": "cmFsEDRF13ch3jXGnGSZmynUywsvybLj", "baidu_netdisk_access_token": "121.7147364e9181402b9118759d222b66b2.YCtEattdaBYff6PE_XU8EcoF8XfoPlP2qDjFh-O.xGGSRw", "baidu_netdisk_refresh_token": "122.8763f09165ecca425ab305435b5c4a9d.YHQocxzzHNpj_KcAuCHV2GVqeCB_Vf32VsMiSPA.lr-OJw", "baidu_netdisk_account_name": "david8slayer", "baidu_netdisk_token_expires_at": "2026-10-20 13:26:22", "baidu_netdisk_quota_total": 2199023255552, "baidu_netdisk_quota_used": 133680857088}');

DROP TABLE IF EXISTS `introduce`;
CREATE TABLE `introduce` (
  `id` int NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT '',
  `hero_image` varchar(255) DEFAULT '/eftphoto/factory.jpg',
  `content_html` longtext,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `introduce` (`id`, `title`, `subtitle`, `hero_image`, `content_html`) VALUES (1, 'HE Efficient and Industry Limited', '中国领先的机械重工制造、成套流水线自动化、电力机组与汽车精密零部件综合出口集团', '/eftphoto/factory.jpg', '<div class="space-y-6 text-slate-700 text-sm leading-relaxed">\n  <p class="text-justify leading-relaxed">\n    HE Efficient and Industry Limited 始创于二十世纪九十年代，总部位于上海。依托中国雄厚完备的工业装备制造体系，历经三十载精耕细作，集团已成长为集重型机械成套装备、洁净食品自动化流水线、天然气及柴油发电机组系统、汽车底盘与发动机关键零部件为一体的全球化工业集成制造商与全链条出口服务商。\n  </p>\n  <p class="text-justify leading-relaxed">\n    集团推行“全球化视野、本土化交付”的发展战略，业务网络横跨美洲、欧洲、中东、东南亚及非洲等60多个国家与地区。我们在中国上海设立外高桥保税区与嘉定工业区两大运营基地，同时在美国加利福尼亚州及中国香港特别行政区设立海外分支机构，为国际工程总承包商、跨国汽配售后采购集团提供“一对一”的技术方案定制、CAD/CAM工程图纸审验、海陆空多式联运及全生命周期售后备件保障。\n  </p>\n  <div class="my-6 rounded-xl overflow-hidden border border-slate-200 shadow-xs bg-slate-900">\n    <img src="/eftphoto/factory.jpg" alt="上海现代化成套装备加工基地" class="w-full h-72 object-cover" />\n    <div class="p-3 text-slate-300 text-xs flex justify-between items-center">\n      <span>E.F.T. 上海现代化精密加工与大型成套设备装配车间</span>\n      <span class="text-emerald-400 font-mono">ISO9001 / CE CERTIFIED</span>\n    </div>\n  </div>\n</div>');

-- Legacy compatibility views for chathistory, vistinghistory, liuyanhistory
CREATE OR REPLACE VIEW `chathistory` AS SELECT * FROM `chats`;
CREATE OR REPLACE VIEW `vistinghistory` AS SELECT * FROM `visitors`;
CREATE OR REPLACE VIEW `liuyanhistory` AS SELECT * FROM `inquiries`;


-- SNAPSHOT_JSON_START:
/*{
  "products": [
    {
      "cat_id": 7,
      "cat_name": "电子电气",
      "name": "B111一拖二家用办公室无线遥控门铃",
      "subtitle": "B111 1-to-2 Wireless Doorbell with Remote Control for Home and Office Use",
      "model_no": "EFT-B111-WIRELESS",
      "price": "面议 / Negotiable",
      "specs": "Model: B111; Type: 1-to-2 (1 Receiver, 2 Transmitters); Power Source: AC Plug-in; Frequency: High-frequency wireless transmission; Application: Residential and Commercial; Certifications: CE/RoHS",
      "img_url": "/prophoto/sourced_1789893923162_0_1789893923657_309874659c.jpg, /prophoto/sourced_1789893923691_1_1789893923739_7fc1ca3e0c.jpg, /prophoto/sourced_1789893923765_2_1789893923781_1a99218e14.jpg, /prophoto/sourced_1789893923788_3_1789893923806_e81ceb7a30.jpg",
      "video_url": "https://img.alicdn.com/imgextra/i4/6000000001921/O1CN01Fe8so01Q3rPf6I8Ox_!!6000000001921-0-tbvideo.jpg",
      "is_hot": true,
      "stock": 500,
      "ecommerce_price": 45,
      "seo_keywords": "wireless doorbell, office doorbell, remote control doorbell, AC powered doorbell, intercom system, B2B wholesale doorbell",
      "seo_description": "High-quality B111 wireless doorbell featuring 1-to-2 configuration, suitable for homes and offices. Easy installation, stable signal, and durable design for B2B export.",
      "id": 15,
      "created_at": "2026-09-20 08:45:37"
    },
    {
      "cat_id": 7,
      "cat_name": "电子电气",
      "name": "F536无线家用门铃交流数码一拖一呼叫器按键可设不同铃声门铃",
      "subtitle": "F536 Wireless AC Digital Doorbell with One-to-One Paging and Adjustable Ringtone Settings",
      "model_no": "EFT-F536",
      "price": "面议 / Negotiable",
      "specs": "Power Supply: AC; Connection Type: Wireless; Paging: One-to-One; Features: Adjustable Ringtones, Digital Signal Processing; Mounting: Wall-mount; Certifications: CE/RoHS",
      "img_url": "/prophoto/sourced_1789893885923_0_1789893886194_b6e1ac2f1c.jpg, /prophoto/sourced_1789893886227_1_1789893886277_518bc407b3.jpg, /prophoto/sourced_1789893886312_2_1789893886330_02c735a8e2.jpg, /prophoto/sourced_1789893886349_3_1789893886369_17ad44923d.jpg, /prophoto/sourced_1789893886373_4_1789893886390_5b18c12b23.jpg",
      "video_url": "https://img.alicdn.com/imgextra/i4/6000000000583/O1CN01Z5wVUm1GB3wtv1PN9_!!6000000000583-0-tbvideo.jpg",
      "is_hot": true,
      "stock": 500,
      "ecommerce_price": 25.5,
      "seo_keywords": "wireless doorbell, digital paging system, AC door chime, home security bell, smart doorbell F536, B2B wholesale electronics",
      "seo_description": "Professional F536 wireless digital doorbell featuring one-to-one paging and selectable ringtones. Ideal for residential and commercial entry notification systems.",
      "id": 14,
      "created_at": "2026-09-20 08:45:06"
    },
    {
      "name": "自动化工作流测试产品 EFT-WORKFLOW-01",
      "cat_name": "工业设备",
      "model_no": "EFT-WF-01",
      "price": "¥28,000",
      "specs": "自动化工作流一键导入测试规格",
      "img_url": "/prophoto/1368357932.jpg",
      "id": 11,
      "created_at": "2026-09-17 06:03:58"
    },
    {
      "name": "精密工业级部件总成 Precision Industrial Unit EFT-4903",
      "subtitle": "High Precision OEM Engineered Assembly - China Direct Export Quality",
      "cat_id": 7,
      "cat_name": "超市学校",
      "model_no": "EFT-IND-4903",
      "price": "面议 / Negotiable",
      "specs": "Standard: ISO9001 / CE; Material: High-Grade Alloy Steel / Aluminum; Precision: ±0.01mm; Surface Treatment: Anti-rust Anodized / Shot Peened; Quality Control: 100% CMM Inspected.",
      "img_url": "/prophoto/1368359523.jpg",
      "stock": 200,
      "ecommerce_price": 350,
      "seo_keywords": "industrial equipment China, OEM precision machining supplier Shanghai, precision mechanical components export, Baidu Google SEO top rank",
      "seo_description": "HE Efficient and Industry Limited provides precision industrial components and assembly solutions for global markets with high durability and strict quality control.",
      "sanitization_report": {
        "removed_trademarks": [
          "Third-party branding filtered"
        ],
        "watermarks_stripped": [
          "Image watermark overlay removed",
          "Copyright imprint cleaned"
        ],
        "seo_geo_optimized": true
      },
      "is_hot": true,
      "id": 10,
      "created_at": "2026-09-17 01:15:52"
    },
    {
      "name": "精密工业级部件总成 Precision Industrial Unit EFT-2015",
      "subtitle": "High Precision OEM Engineered Assembly - China Direct Export Quality",
      "cat_id": 2,
      "cat_name": "工业设备",
      "model_no": "EFT-IND-2015",
      "price": "面议 / Negotiable",
      "specs": "Standard: ISO9001 / CE; Material: High-Grade Alloy Steel / Aluminum; Precision: ±0.01mm; Surface Treatment: Anti-rust Anodized / Shot Peened; Quality Control: 100% CMM Inspected.",
      "img_url": "/prophoto/1368357356.jpg",
      "stock": 200,
      "ecommerce_price": 350,
      "seo_keywords": "industrial equipment China, OEM precision machining supplier Shanghai, precision mechanical components export, Baidu Google SEO top rank",
      "seo_description": "HE Efficient and Industry Limited provides precision industrial components and assembly solutions for global markets with high durability and strict quality control.",
      "sanitization_report": {
        "removed_trademarks": [
          "Third-party branding filtered"
        ],
        "watermarks_stripped": [
          "Image watermark overlay removed",
          "Copyright imprint cleaned"
        ],
        "seo_geo_optimized": true
      },
      "is_hot": true,
      "id": 9,
      "created_at": "2026-09-17 01:15:09"
    },
    {
      "id": 1,
      "cat_id": 5,
      "cat_name": "汽摩配件",
      "name": "凸轮轴 cam shaft",
      "subtitle": "High Precision Automotive Engine Camshaft Assemblies",
      "model_no": "EFT-CS-2026",
      "price": "面议 / Negotiable",
      "specs": "Material: Chilled Cast Iron / Forged Alloy Steel; Tolerance: ±0.005mm; Surface Hardness: HRC 58-62; Applicable engines: Cummins, Weichai, Yuchai, Deutz.",
      "img_url": "/images/products/1368349295.jpg",
      "target_url": "/product/class/?id=1",
      "is_hot": true,
      "stock": 260,
      "ecommerce_price": 320,
      "seo_keywords": "cam shaft, 凸轮轴, automotive camshaft, engine components, OEM auto parts China",
      "seo_description": "E.F.T. supplies high-precision automotive and industrial engine camshafts with CNC hardening and ISO9001 certification.",
      "created_at": "2026-03-10 09:20:00"
    },
    {
      "id": 2,
      "cat_id": 5,
      "cat_name": "汽摩配件",
      "name": "油底壳 Engine Oil Pan",
      "subtitle": "Heavy Duty Die-Cast Aluminum & Stamped Steel Oil Pan",
      "model_no": "EFT-OP-8800",
      "price": "面议 / Negotiable",
      "specs": "Material: High-strength die-cast aluminum alloy A380; Volume: 15L-35L; Anti-corrosion electro-deposition coating; Leak testing: 100% pneumatic inspection.",
      "img_url": "/images/products/1368349483.jpg",
      "target_url": "/product/class/?id=2",
      "is_hot": true,
      "stock": 180,
      "ecommerce_price": 195,
      "seo_keywords": "oil pan, 油底壳, engine oil sump, cast aluminum pan, truck parts supplier",
      "seo_description": "Professional die-cast engine oil pans engineered for commercial trucks, heavy machinery, and marine diesel engines.",
      "created_at": "2026-03-11 11:15:00"
    },
    {
      "id": 3,
      "cat_id": 4,
      "cat_name": "发电机组",
      "name": "天然气发电机组 Natural Gas Genset",
      "subtitle": "High-Efficiency Low-Emission Cogeneration Gas Generator",
      "model_no": "EFT-NG-1200KW",
      "price": "面议 / Inquire",
      "specs": "Rated Power: 200kW - 1200kW; Frequency: 50/60Hz; Gas Consumption: <=0.28m3/kW.h; Grid parallel capability; CHP thermal recovery efficiency up to 88%.",
      "img_url": "/images/products/1368357356.jpg",
      "target_url": "/product/class/?id=3",
      "is_hot": true,
      "stock": 25,
      "ecommerce_price": 48500,
      "seo_keywords": "natural gas genset, 天然气发电机组, gas generator set, clean power generation, cogeneration unit",
      "seo_description": "Continuous power solutions with EFT Natural Gas Generator Sets designed for industrial plants, oilfields, and commercial microgrids.",
      "created_at": "2026-03-12 14:00:00"
    },
    {
      "id": 4,
      "cat_id": 3,
      "cat_name": "生产装备",
      "name": "全自动无菌牛奶生产线 Aseptic Milk Line",
      "subtitle": "Turnkey Dairy UHT Sterilization & Packaging Production Line",
      "model_no": "EFT-DAIRY-5000L",
      "price": "面议 / Project Quote",
      "specs": "Capacity: 1,000L - 10,000L/hour; CIP automatic cleaning system; Siemens PLC central SCADA control; SUS316L food grade stainless steel sanitary standard.",
      "img_url": "/images/products/1368357932.jpg",
      "target_url": "/product/class/?id=4",
      "is_hot": true,
      "stock": 8,
      "ecommerce_price": 128000,
      "seo_keywords": "milk production line, 无菌牛奶生产线, dairy processing equipment, aseptic filling line, beverage machinery turnkey",
      "seo_description": "Complete automated turnkey dairy and juice processing lines from milk receiving, standardization, UHT, to aseptic carton packaging.",
      "created_at": "2026-03-13 10:30:00"
    },
    {
      "id": 5,
      "cat_id": 2,
      "cat_name": "工业设备",
      "name": "房车生产线 RV Assembly Line",
      "subtitle": "Automated Motorhome & Caravan Production Assembly Line",
      "model_no": "EFT-RV-PRO",
      "price": "面议 / Custom Engineered",
      "specs": "Modular conveyor stations: chassis integration, composite wall lamination, interior furnishing, electronics testing; Cycle time: 45 min/vehicle.",
      "img_url": "/images/products/1368358603.jpg",
      "target_url": "/product/class/?id=5",
      "is_hot": true,
      "stock": 5,
      "ecommerce_price": 360000,
      "seo_keywords": "RV production line, 房车生产线, motorhome manufacturing line, automotive assembly conveyor, turnkey factory line",
      "seo_description": "State-of-the-art flexible RV and camper manufacturing production line system with robotic lifting and automatic guided vehicle transfer.",
      "created_at": "2026-03-13 15:45:00"
    },
    {
      "id": 6,
      "cat_id": 2,
      "cat_name": "工业设备",
      "name": "工业超纯水处理设备 Industrial Ultrapure Water System",
      "subtitle": "RO + EDI Two-Stage Electronic Grade Ultrapure Water System",
      "model_no": "EFT-UPW-20T",
      "price": "面议 / Quote",
      "specs": "Flow Rate: 5T/h - 100T/h; Output Resistivity: 18.2 MOhm·cm @25℃; TOC < 5ppb; Dow Filmtec reverse osmosis membranes; EDI continuous deionization.",
      "img_url": "/images/products/1368359371.jpg",
      "target_url": "/product/class/?id=6",
      "is_hot": true,
      "stock": 15,
      "ecommerce_price": 68000,
      "seo_keywords": "ultrapure water system, 工业超纯水处理设备, industrial RO EDI water treatment, electronic grade pure water, semiconductor water plant",
      "seo_description": "Advanced industrial ultrapure water purification equipment for electronics, pharmaceuticals, power stations, and chemical industries.",
      "created_at": "2026-03-14 09:10:00"
    },
    {
      "id": 7,
      "cat_id": 2,
      "cat_name": "工业设备",
      "name": "废气处理成套设备 VOCs Exhaust Gas Treatment System",
      "subtitle": "Regenerative Thermal Oxidizer (RTO) & Catalytic Combustion VOCs Unit",
      "model_no": "EFT-RTO-30000",
      "price": "面议 / Project Quote",
      "specs": "Airflow capacity: 5,000 - 80,000 Nm3/h; VOCs removal efficiency: >=99.2%; Heat recovery thermal efficiency: >=95%; Ceramic honeycomb heat storage bed.",
      "img_url": "/images/products/1368359523.jpg",
      "target_url": "/product/class/?id=7",
      "is_hot": false,
      "stock": 12,
      "ecommerce_price": 92000,
      "seo_keywords": "exhaust gas treatment, 废气处理成套设备, RTO regenerative thermal oxidizer, industrial VOCs abatement, air pollution control equipment",
      "seo_description": "Comprehensive environmental VOCs and industrial exhaust gas treatment systems meeting international environmental discharge standards.",
      "created_at": "2026-03-14 13:20:00"
    },
    {
      "id": 8,
      "cat_id": 9,
      "cat_name": "机械五金",
      "name": "铸件毛坯开发 Casting Blank Development",
      "subtitle": "Custom Precision Sand Casting & Investment Casting Blanks",
      "model_no": "EFT-CAST-OEM",
      "price": "面议 / Negotiable",
      "specs": "Materials: Ductile iron QT450/QT500, Gray iron HT250, Carbon steel, Stainless steel 304/316; Casting weight: 0.5kg - 5,000kg; 3D CMM inspection report included.",
      "img_url": "/images/products/1368360522.jpg",
      "target_url": "/product/class/?id=8",
      "is_hot": false,
      "stock": 500,
      "ecommerce_price": 150,
      "seo_keywords": "casting blank, 铸件毛坯开发, OEM iron casting, precision investment casting China, custom foundry service",
      "seo_description": "High-quality OEM casting blank prototyping and volume production service with CNC roughing and finish machining capabilities.",
      "created_at": "2026-03-15 08:30:00"
    }
  ],
  "news": [
    {
      "id": 1,
      "title": "如何让自己的网站更有质量？AB模板王有妙招",
      "category": "行业资讯",
      "summary": "企业出海与国际贸易网站如何构建高信任感？从用户体验、国际化多语言版面以及核心产品动态展示深度解析。",
      "content": "在当今全球化商务竞争中，企业官方网站是海外买家了解公司实力与产品标准的第一窗口。E.F.T.（HE Efficient and Industry Limited）依托多年跨国贸易经验，通过优化网页加载速度、提供无障碍6国语言交互、以及详实的技术规格参数，为全球采购商打造无缝体验。",
      "publish_date": "2026-03-10",
      "created_at": "2026-03-10 10:00:00"
    },
    {
      "id": 2,
      "title": "带着 SEO 思维选域名，您的网络品牌建设事半功倍",
      "category": "企业动态",
      "summary": "国际品牌域名的结构设计、全站目录结构与搜索引擎GEO地理定位优化对Google和Baidu自然排名的重要意义。",
      "content": "域名与规范化URL路径（如/product/class/）能显著提升搜索引擎蜘蛛对工业大类分类的抓取效率。结合规范化的OpenGraph、元数据标签以及结构化微数据，可以使企业成套设备与关键零部件在海外目标市场快速获得前列搜索展示。",
      "publish_date": "2026-03-08",
      "created_at": "2026-03-08 11:30:00"
    },
    {
      "id": 3,
      "title": "内容优化之有“心”创作，打动用户的关键所在",
      "category": "技术前沿",
      "summary": "工业制造与成套生产线出口的专业文案撰写，如何从技术参数、实测报告与行业案例多维度打动大型采购商。",
      "content": "真正有竞争力的外贸展示不是泛泛空谈，而是直击工程客户痛点的参数指标：材质牌号、形位公差、检测标准、装配产能与售后维保响应。E.F.T.始终坚持技术导向，每一项产品皆配备严格的工业测试标准。",
      "publish_date": "2026-03-05",
      "created_at": "2026-03-05 14:20:00"
    },
    {
      "id": 4,
      "title": "网络公司告诉你有关面包屑导航的事",
      "category": "网站指南",
      "summary": "工业品类繁多的企业门户如何借助清晰的面包屑导航指引访客快速锁定目标产品类别与询盘入口。",
      "content": "清晰的目录层级有助于工业客户在成套生产线、发电机组与汽摩配件之间高效穿梭。配合右下角即时在线客服与5秒主动应答机制，极大提升了采购意向转换率。",
      "publish_date": "2026-03-01",
      "created_at": "2026-03-01 16:00:00"
    },
    {
      "id": 5,
      "title": "怎样做一个符合 W3C 规范的网页",
      "category": "技术标准",
      "summary": "全面支持手机、iPad平板和电脑全端自适应响应式设计的工程实践与跨浏览器兼容性保障。",
      "content": "遵循现代Web开放标准，确保无论买家在海外工厂车间使用iPad现场审阅、还是在办公室多屏工作站查验CAD图纸，均能呈现出精准的排版、舒适的行距与高对比度色彩。",
      "publish_date": "2026-02-26",
      "created_at": "2026-02-26 09:40:00"
    }
  ],
  "chats": [
    {
      "ip": "127.0.0.1",
      "user_email": "",
      "user_phone": "",
      "role": "bot",
      "message": "Yes, we can certainly provide a formal quotation for our Natural Gas Gensets. Our systems range from 200kW to 1200kW, utilizing clean energy with CHP efficiency up to 88%. To provide you with an accurate quote, could you please provide the required power capacity (kW), the specific application, the expected quantity, and your destination port? You can reply with these details here or submit your request via our email at info@efficientsh.com.",
      "is_read": false,
      "id": 13,
      "created_at": "2026-09-20 07:48:55"
    },
    {
      "ip": "127.0.0.1",
      "user_email": "",
      "user_phone": "",
      "role": "user",
      "message": "Hello, please send quotation for natural gas generator",
      "is_read": false,
      "id": 12,
      "created_at": "2026-09-20 07:48:54"
    },
    {
      "ip": "128.14.162.114",
      "user_email": "david8slayer@gmail.com",
      "user_phone": "18916169306",
      "role": "bot",
      "message": "尊敬的客户，您好！我们完全可以为您提供正式的产品报价。为了向您提供最精准的报价方案，麻烦您提供具体的产品名称/型号、规格要求、采购数量以及目的港等信息。您也可以直接在官网的“MESSAGE / 询盘”栏目中提交详细需求，或发送邮件至 info@efficientsh.com 与我们联系。非常期待与您的合作！",
      "is_read": false,
      "id": 11,
      "created_at": "2026-09-17 07:41:27"
    },
    {
      "ip": "128.14.162.114",
      "user_email": "david8slayer@gmail.com",
      "user_phone": "18916169306",
      "role": "user",
      "message": "你们可以报价吗？",
      "is_read": false,
      "id": 10,
      "created_at": "2026-09-17 07:40:39"
    },
    {
      "id": 1,
      "ip": "180.168.22.45",
      "user_email": "zhang.tech@heavyequip.cn",
      "user_phone": "+86 138 1234 5678",
      "role": "bot",
      "message": "Welcome E.F.T. What can I do for you?",
      "is_read": true,
      "created_at": "2026-03-15 16:25:00"
    },
    {
      "id": 2,
      "ip": "180.168.22.45",
      "user_email": "zhang.tech@heavyequip.cn",
      "user_phone": "+86 138 1234 5678",
      "role": "user",
      "message": "请问天然气发电机组目前现货交期是多久？有无配置余热回收系统？",
      "is_read": true,
      "created_at": "2026-03-15 16:25:35"
    },
    {
      "id": 3,
      "ip": "180.168.22.45",
      "user_email": "zhang.tech@heavyequip.cn",
      "user_phone": "+86 138 1234 5678",
      "role": "bot",
      "message": "您好！E.F.T.天然气发电机组采用高可靠性工业机体，常规功率段现货储备丰富，标准交期为15-20个工作日。系统标配支持CHP热电联产余热回收装置，综合热能利用效率可高达88%。如有特殊技术协议定制，我们工程师团队可为您量身出具系统图。",
      "is_read": true,
      "created_at": "2026-03-15 16:25:40"
    },
    {
      "id": 4,
      "ip": "180.168.22.45",
      "user_email": "zhang.tech@heavyequip.cn",
      "user_phone": "+86 138 1234 5678",
      "role": "user",
      "message": "太好了，我已经在留言页面留下了我们公司的需求，请销售经理普先生尽快与我们电话联系。",
      "is_read": true,
      "created_at": "2026-03-15 16:26:15"
    },
    {
      "id": 5,
      "ip": "180.168.22.45",
      "user_email": "zhang.tech@heavyequip.cn",
      "user_phone": "+86 138 1234 5678",
      "role": "admin",
      "message": "您好张经理！已收到您的需求，普先生（销售热线：021-6199 3984）正在为您准备成套技术资料，稍后将致电沟通！",
      "is_read": true,
      "created_at": "2026-03-15 16:35:00"
    },
    {
      "ip": "127.0.0.1",
      "user_email": "buyer@california-auto.com",
      "user_phone": "+1-626-555-0199",
      "role": "user",
      "message": "Do you manufacture custom camshafts for heavy duty diesel engines?",
      "is_read": false,
      "id": 6,
      "created_at": "2026-09-16 05:10:27"
    },
    {
      "ip": "127.0.0.1",
      "user_email": "buyer@california-auto.com",
      "user_phone": "+1-626-555-0199",
      "role": "bot",
      "message": "您好！E.F.T.专业定制高精度凸轮轴，采用冷激铸铁或合金钢锻造，全数控CNC精密磨削，表面硬度HRC 58-62，适配重型卡车、工程机械与船舶柴油机。请留下您的图纸或型号，我们工程师即刻出具技术协议！",
      "is_read": false,
      "id": 7,
      "created_at": "2026-09-16 05:10:27"
    },
    {
      "ip": "127.0.0.1",
      "user_email": "",
      "user_phone": "",
      "role": "user",
      "message": "What are your main products?",
      "is_read": false,
      "id": 8,
      "created_at": "2026-09-17 01:19:20"
    },
    {
      "ip": "127.0.0.1",
      "user_email": "",
      "user_phone": "",
      "role": "bot",
      "message": "At E.F.T. (HE Efficient and Industry Limited), our main product lines include:\n\n1. Engine Components: High-precision Camshafts (chilled cast iron/alloy steel) and Engine Oil Pans for heavy trucks, machinery, and marine engines.\n2. Power Generation: Natural Gas Gensets (200kW - 1200kW, clean energy with CHP efficiency up to 88%).\n3. Complete Production Lines: Fully Automatic Aseptic Milk Production Lines (1,000L-10,000L/h) and Turnkey RV Assembly Lines.\n4. Industrial & Environmental Equipment: Industrial Ultrapure Water Treatment Systems (RO + EDI) and VOCs Exhaust Gas Treatment Equipment (RTO systems).\n5. Casting & Machining: Custom Casting Blank Development (QT450/QT500, HT250) and CNC roughing.\n\nPlease let us know if you would like technical specifications or customization details for any of these products!",
      "is_read": false,
      "id": 9,
      "created_at": "2026-09-17 01:19:29"
    },
    {
      "id": "msg_1789906621712",
      "ip": "127.0.0.1",
      "user_email": "test@example.com",
      "user_phone": "",
      "role": "user",
      "message": "Hello, do you support OEM doorbell orders?",
      "is_read": 0,
      "created_at": "2026-09-20 12:17:01"
    },
    {
      "id": "msg_1789906621911",
      "ip": "127.0.0.1",
      "user_email": "test@example.com",
      "user_phone": "",
      "role": "bot",
      "message": "Welcome to HE Efficient and Industry Limited (E.F.T.)! We have logged your consultation. Our senior sales director Mr. Pu (+86 021-6257 8368 / Mobile: +86 13917387399) has received your request and will contact you promptly with quotations and specifications.",
      "is_read": 0,
      "created_at": "2026-09-20 12:17:01"
    }
  ],
  "visitors": [
    {
      "id": 1789914168245,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 14:22:48"
    },
    {
      "id": 1789914168931,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 14:22:48"
    },
    {
      "id": 1789912903067,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 14:01:42"
    },
    {
      "id": 1789912902799,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 14:01:42"
    },
    {
      "id": 1789911199745,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 13:33:18"
    },
    {
      "id": 1789911198964,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 13:33:18"
    },
    {
      "id": 1789910994363,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "https://ais-dev-6qsc3pcynonabnya7qnt47-259864977174.us-west2.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 13:29:53"
    },
    {
      "id": 1789910994361,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "https://ais-dev-6qsc3pcynonabnya7qnt47-259864977174.us-west2.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 13:29:53"
    },
    {
      "id": 1789910941315,
      "ip": "127.0.0.1",
      "page": "/admin/",
      "stay_seconds": 1,
      "referrer": "https://ais-dev-6qsc3pcynonabnya7qnt47-259864977174.us-west2.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 13:29:00"
    },
    {
      "id": 1789910924593,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "https://ais-dev-6qsc3pcynonabnya7qnt47-259864977174.us-west2.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 13:28:43"
    },
    {
      "id": 1789910924779,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "https://ais-dev-6qsc3pcynonabnya7qnt47-259864977174.us-west2.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 13:28:43"
    },
    {
      "id": 1789909772600,
      "ip": "127.0.0.1",
      "page": "/admin/",
      "stay_seconds": 1,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 13:09:31"
    },
    {
      "id": 1789909757696,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 13:09:17"
    },
    {
      "id": 1789909757942,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 13:09:17"
    },
    {
      "id": 1789909688708,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "https://ais-dev-6qsc3pcynonabnya7qnt47-259864977174.us-west2.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 13:08:08"
    },
    {
      "id": 1789909688277,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "https://ais-dev-6qsc3pcynonabnya7qnt47-259864977174.us-west2.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 13:08:08"
    },
    {
      "id": 1789907401358,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 12:30:01"
    },
    {
      "id": 1789906764987,
      "ip": "127.0.0.1",
      "page": "/admin/",
      "stay_seconds": 1,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 12:19:24"
    },
    {
      "id": 1789906643942,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 12:17:23"
    },
    {
      "id": 1789906643429,
      "ip": "127.0.0.1",
      "page": "/",
      "stay_seconds": 1,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "created_at": "2026-09-20 12:17:23"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 430,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 149,
      "created_at": "2026-09-20 08:50:56"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/admin/",
      "stay_seconds": 240,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 148,
      "created_at": "2026-09-20 08:46:55"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 20,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 147,
      "created_at": "2026-09-20 08:46:32"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/admin/",
      "stay_seconds": 490,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 146,
      "created_at": "2026-09-20 08:24:42"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 145,
      "created_at": "2026-09-20 08:24:38"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/product/class/",
      "stay_seconds": 10,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 144,
      "created_at": "2026-09-20 08:24:28"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 10,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 143,
      "created_at": "2026-09-20 08:24:15"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 142,
      "created_at": "2026-09-20 08:24:15"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 1215,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 141,
      "created_at": "2026-09-20 08:24:14"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 125,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 140,
      "created_at": "2026-09-20 07:46:57"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/admin/",
      "stay_seconds": 115,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 139,
      "created_at": "2026-09-20 07:45:02"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 65,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 138,
      "created_at": "2026-09-20 07:43:56"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 137,
      "created_at": "2026-09-20 07:43:56"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 310,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 136,
      "created_at": "2026-09-20 07:43:56"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 620,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 135,
      "created_at": "2026-09-20 07:33:32"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/admin/",
      "stay_seconds": 510,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 134,
      "created_at": "2026-09-20 07:25:00"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 230,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 133,
      "created_at": "2026-09-20 07:21:06"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 132,
      "created_at": "2026-09-20 07:21:06"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 1370,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 131,
      "created_at": "2026-09-20 07:21:06"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 550,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 130,
      "created_at": "2026-09-20 07:11:54"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/admin/",
      "stay_seconds": 1440,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 129,
      "created_at": "2026-09-20 06:34:02"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 5,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 128,
      "created_at": "2026-09-20 06:33:54"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/admin/",
      "stay_seconds": 20,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 127,
      "created_at": "2026-09-20 06:33:33"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 95,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 126,
      "created_at": "2026-09-20 06:31:57"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/product/class/",
      "stay_seconds": 5,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 125,
      "created_at": "2026-09-20 06:31:48"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 15,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 124,
      "created_at": "2026-09-20 06:31:28"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 123,
      "created_at": "2026-09-20 06:31:28"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 2150,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 122,
      "created_at": "2026-09-20 06:31:28"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 670,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 121,
      "created_at": "2026-09-20 06:20:14"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 120,
      "created_at": "2026-09-20 06:20:14"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 670,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 119,
      "created_at": "2026-09-20 06:20:14"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 70,
      "referrer": "https://ais-dev-zdjzos6hfnfzuxxyb5kjpz-429000343916.us-east1.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 118,
      "created_at": "2026-09-20 06:19:03"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "https://ais-dev-zdjzos6hfnfzuxxyb5kjpz-429000343916.us-east1.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 117,
      "created_at": "2026-09-20 06:19:03"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "https://ais-dev-zdjzos6hfnfzuxxyb5kjpz-429000343916.us-east1.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 116,
      "created_at": "2026-09-20 06:19:03"
    },
    {
      "ip": "128.14.180.210",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 70,
      "referrer": "https://ais-dev-zdjzos6hfnfzuxxyb5kjpz-429000343916.us-east1.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 115,
      "created_at": "2026-09-20 06:19:03"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 2270,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 114,
      "created_at": "2026-09-20 04:27:00"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 113,
      "created_at": "2026-09-20 04:27:00"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 2280,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 112,
      "created_at": "2026-09-20 04:27:00"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 5625,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 111,
      "created_at": "2026-09-20 02:44:18"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 110,
      "created_at": "2026-09-20 02:44:18"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 5620,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 109,
      "created_at": "2026-09-20 02:44:18"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 55,
      "referrer": "https://ais-dev-yhb4hcdbgoqi4djq4uzhpj-337729553144.us-east5.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 108,
      "created_at": "2026-09-20 02:43:10"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "https://ais-dev-yhb4hcdbgoqi4djq4uzhpj-337729553144.us-east5.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 107,
      "created_at": "2026-09-20 02:43:10"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 60,
      "referrer": "https://ais-dev-yhb4hcdbgoqi4djq4uzhpj-337729553144.us-east5.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 106,
      "created_at": "2026-09-20 02:43:10"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "https://ais-dev-yhb4hcdbgoqi4djq4uzhpj-337729553144.us-east5.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 105,
      "created_at": "2026-09-20 02:43:10"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 1220,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 104,
      "created_at": "2026-09-17 07:40:12"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/admin/",
      "stay_seconds": 25,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 103,
      "created_at": "2026-09-17 07:39:47"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 5,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 102,
      "created_at": "2026-09-17 07:39:39"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/admin/",
      "stay_seconds": 35,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 101,
      "created_at": "2026-09-17 07:39:00"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 190,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 100,
      "created_at": "2026-09-17 07:35:47"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 99,
      "created_at": "2026-09-17 07:35:47"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 1485,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 98,
      "created_at": "2026-09-17 07:35:47"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 2020,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 97,
      "created_at": "2026-09-17 06:53:14"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/admin/",
      "stay_seconds": 40,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 96,
      "created_at": "2026-09-17 06:52:30"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 115,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 95,
      "created_at": "2026-09-17 06:50:31"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 2190,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 94,
      "created_at": "2026-09-17 06:50:31"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 93,
      "created_at": "2026-09-17 06:50:31"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 2560,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 92,
      "created_at": "2026-09-17 06:05:24"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 91,
      "created_at": "2026-09-17 06:05:24"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 2560,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 90,
      "created_at": "2026-09-17 06:05:24"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 1940,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 89,
      "created_at": "2026-09-17 05:25:11"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/admin/",
      "stay_seconds": 50,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 88,
      "created_at": "2026-09-17 05:24:19"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 555,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 87,
      "created_at": "2026-09-17 05:15:02"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 86,
      "created_at": "2026-09-17 05:15:02"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 2555,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 85,
      "created_at": "2026-09-17 05:15:02"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 445,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 84,
      "created_at": "2026-09-17 05:07:33"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 83,
      "created_at": "2026-09-17 05:07:33"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 450,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 82,
      "created_at": "2026-09-17 05:07:33"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 165,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 81,
      "created_at": "2026-09-17 05:04:45"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 80,
      "created_at": "2026-09-17 05:04:45"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 165,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 79,
      "created_at": "2026-09-17 05:04:45"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 100,
      "referrer": "https://ais-dev-is44miaqtyb2o3nvydq3n2-259864977174.us-west2.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 78,
      "created_at": "2026-09-17 05:03:02"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "https://ais-dev-is44miaqtyb2o3nvydq3n2-259864977174.us-west2.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 77,
      "created_at": "2026-09-17 05:03:02"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 325,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 76,
      "created_at": "2026-09-17 01:20:26"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 75,
      "created_at": "2026-09-17 01:20:26"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 220,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 74,
      "created_at": "2026-09-17 01:16:33"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/admin/",
      "stay_seconds": 290,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 73,
      "created_at": "2026-09-17 01:11:43"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 5,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 72,
      "created_at": "2026-09-17 01:11:33"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 71,
      "created_at": "2026-09-17 01:11:33"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/admin/",
      "stay_seconds": 40,
      "referrer": "https://ais-dev-hh2u4m3ktg6dn6jkzjiotn-366631453563.us-east1.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 70,
      "created_at": "2026-09-17 01:10:50"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 15,
      "referrer": "https://ais-dev-hh2u4m3ktg6dn6jkzjiotn-366631453563.us-east1.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 69,
      "created_at": "2026-09-17 01:10:35"
    },
    {
      "ip": "128.14.162.114",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "https://ais-dev-hh2u4m3ktg6dn6jkzjiotn-366631453563.us-east1.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 68,
      "created_at": "2026-09-17 01:10:35"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 4325,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 67,
      "created_at": "2026-09-16 12:11:11"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 66,
      "created_at": "2026-09-16 12:11:11"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 7200,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 65,
      "created_at": "2026-09-16 08:21:31"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 64,
      "created_at": "2026-09-16 08:21:31"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 2075,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 63,
      "created_at": "2026-09-16 07:46:53"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 62,
      "created_at": "2026-09-16 07:46:53"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 285,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 61,
      "created_at": "2026-09-16 07:42:06"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 60,
      "created_at": "2026-09-16 07:42:06"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 690,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 59,
      "created_at": "2026-09-16 07:29:32"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 58,
      "created_at": "2026-09-16 07:29:32"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 45,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 57,
      "created_at": "2026-09-16 07:28:43"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/contact/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 56,
      "created_at": "2026-09-16 07:28:41"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/message/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 55,
      "created_at": "2026-09-16 07:28:40"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/contact/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 54,
      "created_at": "2026-09-16 07:28:36"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/product/class/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 53,
      "created_at": "2026-09-16 07:28:35"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/news/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 52,
      "created_at": "2026-09-16 07:28:33"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/introduce/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 51,
      "created_at": "2026-09-16 07:28:31"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 275,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 50,
      "created_at": "2026-09-16 07:23:51"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 49,
      "created_at": "2026-09-16 07:23:51"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 48,
      "created_at": "2026-09-16 07:19:06"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 280,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 47,
      "created_at": "2026-09-16 07:19:06"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 185,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 46,
      "created_at": "2026-09-16 07:13:54"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/admin/",
      "stay_seconds": 55,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 45,
      "created_at": "2026-09-16 07:12:58"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 10,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 44,
      "created_at": "2026-09-16 07:12:48"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/contact/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 43,
      "created_at": "2026-09-16 07:12:45"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/message/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 42,
      "created_at": "2026-09-16 07:12:42"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/product/class/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 41,
      "created_at": "2026-09-16 07:12:40"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/news/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 40,
      "created_at": "2026-09-16 07:12:35"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/introduce/",
      "stay_seconds": 180,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 39,
      "created_at": "2026-09-16 07:09:34"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 15,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 38,
      "created_at": "2026-09-16 07:09:15"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 37,
      "created_at": "2026-09-16 07:09:15"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 850,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 36,
      "created_at": "2026-09-16 06:55:03"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/introduce/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 35,
      "created_at": "2026-09-16 06:55:00"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 34,
      "created_at": "2026-09-16 06:54:56"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/contact/",
      "stay_seconds": 5,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 33,
      "created_at": "2026-09-16 06:54:52"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/message/",
      "stay_seconds": 5,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 32,
      "created_at": "2026-09-16 06:54:45"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/product/class/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 31,
      "created_at": "2026-09-16 06:54:42"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/news/",
      "stay_seconds": 5,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 30,
      "created_at": "2026-09-16 06:54:36"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/introduce/",
      "stay_seconds": 75,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 29,
      "created_at": "2026-09-16 06:53:20"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 235,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 28,
      "created_at": "2026-09-16 06:49:21"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 27,
      "created_at": "2026-09-16 06:49:21"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 55,
      "referrer": "https://ais-dev-yuklgtj55mfdesmxrsgfbn-429000343916.us-east1.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 26,
      "created_at": "2026-09-16 06:48:33"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "https://ais-dev-yuklgtj55mfdesmxrsgfbn-429000343916.us-east1.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 25,
      "created_at": "2026-09-16 06:48:33"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 760,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 24,
      "created_at": "2026-09-16 06:00:24"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 23,
      "created_at": "2026-09-16 06:00:24"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 470,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 22,
      "created_at": "2026-09-16 05:52:33"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 21,
      "created_at": "2026-09-16 05:52:33"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/contact/",
      "stay_seconds": 585,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 20,
      "created_at": "2026-09-16 05:42:44"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/message/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 19,
      "created_at": "2026-09-16 05:42:40"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/product/class/",
      "stay_seconds": 5,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 18,
      "created_at": "2026-09-16 05:42:33"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/news/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 17,
      "created_at": "2026-09-16 05:42:29"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/introduce/",
      "stay_seconds": 5,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 16,
      "created_at": "2026-09-16 05:42:22"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 135,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 15,
      "created_at": "2026-09-16 05:40:02"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "Google 搜索引擎 (https://aistudio.google.com/)",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 14,
      "created_at": "2026-09-16 05:40:02"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/contact/",
      "stay_seconds": 345,
      "referrer": "https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 13,
      "created_at": "2026-09-16 05:34:16"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/message/",
      "stay_seconds": 20,
      "referrer": "https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 12,
      "created_at": "2026-09-16 05:33:55"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/product/class/",
      "stay_seconds": 105,
      "referrer": "https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 11,
      "created_at": "2026-09-16 05:32:08"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/news/",
      "stay_seconds": 5,
      "referrer": "https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 10,
      "created_at": "2026-09-16 05:31:59"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/introduce/",
      "stay_seconds": 25,
      "referrer": "https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 9,
      "created_at": "2026-09-16 05:31:29"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 140,
      "referrer": "https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 8,
      "created_at": "2026-09-16 05:29:06"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/admin/",
      "stay_seconds": 10,
      "referrer": "https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 7,
      "created_at": "2026-09-16 05:28:53"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 1000,
      "referrer": "https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 6,
      "created_at": "2026-09-16 05:11:55"
    },
    {
      "ip": "107.151.187.186",
      "country": "中国 (China)",
      "city": "上海市 (Shanghai)",
      "location_detail": "中国 华东地区 电信骨干节点",
      "page_url": "/",
      "stay_seconds": 0,
      "referrer": "https://ais-dev-rc34ddafwgl6y5tsmbxgnk-337729553144.us-east5.run.app/",
      "os": "Windows PC",
      "browser": "Google Chrome",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36",
      "id": 5,
      "created_at": "2026-09-16 05:11:55"
    },
    {
      "id": 1,
      "ip": "180.168.22.45",
      "country": "中国 (China)",
      "city": "上海市浦东新区",
      "location_detail": "中国 上海市浦东新区 电信骨干网",
      "page_url": "/product/class/",
      "stay_seconds": 142,
      "referrer": "https://www.google.com/search?q=EFT+发电机组+上海",
      "os": "Windows 11 64-bit",
      "browser": "Chrome 122.0",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36",
      "created_at": "2026-03-15 16:20:10"
    },
    {
      "id": 2,
      "ip": "201.144.18.92",
      "country": "墨西哥 (Mexico)",
      "city": "Mexico City",
      "location_detail": "Mexico, Distrito Federal, Telmex Enterprise",
      "page_url": "/product/class/?id=1",
      "stay_seconds": 320,
      "referrer": "https://www.google.com/search?q=automotive+camshaft+supplier+shanghai",
      "os": "macOS Sonoma",
      "browser": "Safari 17.3",
      "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3 Safari/605.1.15",
      "created_at": "2026-03-15 14:05:32"
    },
    {
      "id": 3,
      "ip": "52.90.114.22",
      "country": "美国 (United States)",
      "city": "Ashburn, Virginia",
      "location_detail": "United States, Virginia, AWS East Datacenter",
      "page_url": "/introduce/",
      "stay_seconds": 68,
      "referrer": "直接输入网址 (Direct URL)",
      "os": "Windows 10",
      "browser": "Microsoft Edge 122",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0",
      "created_at": "2026-03-15 13:40:15"
    },
    {
      "id": 4,
      "ip": "116.228.111.89",
      "country": "中国 (China)",
      "city": "上海市嘉定区",
      "location_detail": "中国 上海市嘉定区工业区 中国联通",
      "page_url": "/",
      "stay_seconds": 85,
      "referrer": "https://www.baidu.com/s?wd=HE Efficient and Industry Limited",
      "os": "iOS 17.4 (iPhone 15 Pro)",
      "browser": "Mobile Safari",
      "user_agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 17_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1",
      "created_at": "2026-03-15 12:15:00"
    }
  ],
  "inquiries": [
    {
      "id": 1,
      "name": "张工程经理 (Zhang)",
      "email": "zhang.tech@heavyequip.cn",
      "phone": "+86 138 1234 5678",
      "company": "华东动力重工集团",
      "message": "您好，我们厂区扩建需要采购2套1200KW天然气发电机组及热电联产并网配套，请发送完整技术协议书和商务报价至邮箱，谢谢。",
      "ip": "180.168.22.45",
      "status": "unread",
      "created_at": "2026-03-15 16:30:20"
    },
    {
      "id": 2,
      "name": "Carlos Mendoza",
      "email": "carlos.m@transglobal-logistics.mx",
      "phone": "+52 55 4123 8890",
      "company": "Mendoza Auto Parts Mexico",
      "message": "Dear Sir, We are interested in regular bulk container shipment of diesel engine camshafts (EFT-CS-2026) and oil pans. Please advise MOQ and CIF Manzanillo port pricing.",
      "ip": "201.144.18.92",
      "status": "read",
      "reply_content": "Sent technical catalog and quotation sheet to customer email.",
      "replied_at": "2026-03-15 17:10:00",
      "created_at": "2026-03-15 14:12:08"
    }
  ],
  "backups": [
    {
      "id": "bk_1789913990106",
      "filename": "efficientsh_full_site_backup_2026-09-20T14-19-27-861Z.zip",
      "zip_filename": "efficientsh_full_site_backup_2026-09-20T14-19-27-861Z.zip",
      "sql_filename": "efficientsh_site_backup_2026-09-20T14-19-27-861Z.sql",
      "size": "15.3 MB (整站+数据库)",
      "created_at": "2026-09-20 14:19:50",
      "type": "full_site_and_db",
      "status": "success",
      "destinations": [
        "Local Storage (/data/backups)",
        "百度网盘整站ZIP (/apps/efficientsh_backup/efficientsh_full_site_backup_2026-09-20T14-19-27-861Z.zip)",
        "百度网盘SQL快照 (/apps/efficientsh_backup/efficientsh_site_backup_2026-09-20T14-19-27-861Z.sql)"
      ],
      "baidu_sync": {
        "success": true,
        "path": "/apps/efficientsh_backup/efficientsh_full_site_backup_2026-09-20T14-19-27-861Z.zip",
        "fs_id": 1095329937498163
      },
      "baidu_sql_sync": {
        "success": true,
        "path": "/apps/efficientsh_backup/efficientsh_site_backup_2026-09-20T14-19-27-861Z.sql",
        "fs_id": 1057983321164976
      }
    },
    {
      "id": "bk_1789913952313",
      "filename": "efficientsh_full_site_backup_2026-09-20T14-19-05-139Z.zip",
      "zip_filename": "efficientsh_full_site_backup_2026-09-20T14-19-05-139Z.zip",
      "sql_filename": "efficientsh_site_backup_2026-09-20T14-19-05-139Z.sql",
      "size": "0.0 MB (整站+数据库)",
      "created_at": "2026-09-20 14:19:12",
      "type": "full_site_and_db",
      "status": "success",
      "destinations": [
        "Local Storage (/data/backups)",
        "百度网盘ZIP同步提醒 (File is empty)",
        "百度网盘SQL快照 (/apps/efficientsh_backup/efficientsh_site_backup_2026-09-20T14-19-05-139Z.sql)"
      ],
      "baidu_sync": {
        "success": false,
        "error": "File is empty"
      },
      "baidu_sql_sync": {
        "success": true,
        "path": "/apps/efficientsh_backup/efficientsh_site_backup_2026-09-20T14-19-05-139Z.sql",
        "fs_id": 640192222394509
      }
    },
    {
      "id": "bk_1789913917594",
      "filename": "efficientsh_full_site_backup_2026-09-20T14-18-33-388Z.zip",
      "zip_filename": "efficientsh_full_site_backup_2026-09-20T14-18-33-388Z.zip",
      "sql_filename": "efficientsh_site_backup_2026-09-20T14-18-33-388Z.sql",
      "size": "0.0 MB (整站+数据库)",
      "created_at": "2026-09-20 14:18:37",
      "type": "full_site_and_db",
      "status": "success",
      "destinations": [
        "Local Storage (/data/backups)",
        "百度网盘ZIP同步提醒 (File is empty)",
        "百度网盘SQL快照 (/apps/efficientsh_backup/efficientsh_site_backup_2026-09-20T14-18-33-388Z.sql)"
      ],
      "baidu_sync": {
        "success": false,
        "error": "File is empty"
      },
      "baidu_sql_sync": {
        "success": true,
        "path": "/apps/efficientsh_backup/efficientsh_site_backup_2026-09-20T14-18-33-388Z.sql",
        "fs_id": 672487572123315
      }
    },
    {
      "id": "bk_1789913886450",
      "filename": "efficientsh_full_site_backup_2026-09-20T14-18-01-083Z.zip",
      "zip_filename": "efficientsh_full_site_backup_2026-09-20T14-18-01-083Z.zip",
      "sql_filename": "efficientsh_site_backup_2026-09-20T14-18-01-083Z.sql",
      "size": "0.0 MB (整站+数据库)",
      "created_at": "2026-09-20 14:18:06",
      "type": "full_site_and_db",
      "status": "success",
      "destinations": [
        "Local Storage (/data/backups)",
        "百度网盘ZIP同步提醒 (File is empty)",
        "百度网盘SQL快照 (/apps/efficientsh_backup/efficientsh_site_backup_2026-09-20T14-18-01-083Z.sql)"
      ],
      "baidu_sync": {
        "success": false,
        "error": "File is empty"
      },
      "baidu_sql_sync": {
        "success": true,
        "path": "/apps/efficientsh_backup/efficientsh_site_backup_2026-09-20T14-18-01-083Z.sql",
        "fs_id": 347043906697867
      }
    },
    {
      "id": "bk_1789912269908",
      "filename": "efficientsh_site_backup_2026-09-20T13-51-03-403Z.sql",
      "size": "14.5 MB",
      "created_at": "2026-09-20 13:51:09",
      "type": "manual",
      "status": "success",
      "destinations": [
        "Local Storage (/data/backups)",
        "百度网盘 (/apps/efficientsh_backup/efficientsh_site_backup_2026-09-20T13-51-03-403Z.sql)"
      ],
      "baidu_sync": {
        "success": true,
        "path": "/apps/efficientsh_backup/efficientsh_site_backup_2026-09-20T13-51-03-403Z.sql",
        "fs_id": 313692006633612
      }
    },
    {
      "id": "bk_1789912255163",
      "filename": "efficientsh_site_backup_2026-09-20T13-50-55-161Z.sql",
      "size": "14.5 MB",
      "created_at": "2026-09-20 13:50:55",
      "type": "manual",
      "status": "success",
      "destinations": [
        "Local Storage (/data/backups)",
        "Cloud Storage"
      ]
    },
    {
      "id": "bk_1789880729155",
      "filename": "efficientsh_site_backup_2026-09-20T05-05-29-154Z.sql",
      "size": "14.2 MB",
      "created_at": "2026-09-20 05:05:29",
      "type": "manual",
      "status": "success",
      "destinations": [
        "Local Storage (/data/backups)"
      ]
    },
    {
      "id": "bk_1789872170384",
      "filename": "efficientsh_site_backup_2026-09-20T02-42-50-382Z.sql",
      "size": "14.2 MB",
      "created_at": "2026-09-20 02:42:50",
      "type": "auto",
      "status": "success",
      "destinations": [
        "Local Storage (/data/backups)"
      ]
    },
    {
      "id": "bk_1789535429401",
      "filename": "efficientsh_site_backup_2026-09-16T05-10-29-401Z.sql",
      "size": "14.2 MB",
      "created_at": "2026-09-16 05:10:29",
      "type": "manual",
      "status": "success",
      "destinations": [
        "Local Storage (/data/backups)"
      ]
    },
    {
      "id": "bk_1789535178660",
      "filename": "efficientsh_site_backup_2026-09-16T05-06-18-659Z.sql",
      "size": "14.2 MB",
      "created_at": "2026-09-16 05:06:18",
      "type": "auto",
      "status": "success",
      "destinations": [
        "Local Storage (/data/backups)"
      ]
    }
  ],
  "config": {
    "company_name": "HE Efficient and Industry Limited",
    "company_en": "HE Efficient and Industry Limited",
    "passcode": "admin888",
    "sales_phone": "021-6257 8368",
    "contact_person": "普先生 (Mr. Pu)",
    "contact_email": "info@efficientsh.com",
    "site_url": "www.efficientsh.com",
    "address_shanghai_reg": "上海嘉定工业区叶城路1630号8幢10762室",
    "address_shanghai_office": "嘉定工业区叶城路1630号8幢10762室；浦东外高桥保税区菲拉路55号409",
    "address_usa": "17700 CASTLETON ST, SUITE 288, CITY OF INDUSTRY, CA 91748, USA",
    "address_hk": "ROOM 1502, 15/F, FU LEE COMMERCIAL BUILDING, NO. 14-20, PILKEM STREET, JORDAN, KOWLOON, HONGKONG",
    "baidu_netdisk_api_key": "121.7147364e9181402b9118759d222b66b2.YCtEattdaBYff6PE_XU8EcoF8XfoPlP2qDjFh-O.xGGSRw",
    "google_drive_api_key": "",
    "backup_interval_days": 2,
    "backup_retention_days": 10,
    "downtime_auto_restore": true,
    "smtp_host": "smtp.efficientsh.com",
    "smtp_port": 465,
    "smtp_user": "noreply@efficientsh.com",
    "smtp_pass": "EftSecureSmtp2026",
    "mysql_host": "localhost",
    "mysql_port": 3306,
    "mysql_user": "root",
    "mysql_database": "efficientsh",
    "google_drive_client_id": "",
    "google_drive_client_secret": "",
    "google_drive_access_token": "",
    "google_drive_refresh_token": "",
    "google_drive_account_email": "",
    "google_drive_folder_id": "",
    "google_drive_folder_name": "",
    "google_drive_connected": false,
    "google_drive_auto_files": true,
    "google_drive_auto_database": true,
    "google_drive_verify_upload": true,
    "google_drive_retention_count": 7,
    "baidu_netdisk_app_key": "8yH7YBQHUenTBYybBtABV5MzUY70GIUJ",
    "baidu_netdisk_app_secret": "cmFsEDRF13ch3jXGnGSZmynUywsvybLj",
    "baidu_netdisk_access_token": "121.7147364e9181402b9118759d222b66b2.YCtEattdaBYff6PE_XU8EcoF8XfoPlP2qDjFh-O.xGGSRw",
    "baidu_netdisk_refresh_token": "122.8763f09165ecca425ab305435b5c4a9d.YHQocxzzHNpj_KcAuCHV2GVqeCB_Vf32VsMiSPA.lr-OJw",
    "baidu_netdisk_account_name": "david8slayer",
    "baidu_netdisk_token_expires_at": "2026-10-20 13:26:22",
    "baidu_netdisk_quota_total": 2199023255552,
    "baidu_netdisk_quota_used": 133680857088
  },
  "introduce": {
    "title": "HE Efficient and Industry Limited",
    "subtitle": "中国领先的机械重工制造、成套流水线自动化、电力机组与汽车精密零部件综合出口集团",
    "hero_image": "/eftphoto/factory.jpg",
    "content_html": "<div class=\"space-y-6 text-slate-700 text-sm leading-relaxed\">\n  <p class=\"text-justify leading-relaxed\">\n    HE Efficient and Industry Limited 始创于二十世纪九十年代，总部位于上海。依托中国雄厚完备的工业装备制造体系，历经三十载精耕细作，集团已成长为集重型机械成套装备、洁净食品自动化流水线、天然气及柴油发电机组系统、汽车底盘与发动机关键零部件为一体的全球化工业集成制造商与全链条出口服务商。\n  </p>\n  <p class=\"text-justify leading-relaxed\">\n    集团推行“全球化视野、本土化交付”的发展战略，业务网络横跨美洲、欧洲、中东、东南亚及非洲等60多个国家与地区。我们在中国上海设立外高桥保税区与嘉定工业区两大运营基地，同时在美国加利福尼亚州及中国香港特别行政区设立海外分支机构，为国际工程总承包商、跨国汽配售后采购集团提供“一对一”的技术方案定制、CAD/CAM工程图纸审验、海陆空多式联运及全生命周期售后备件保障。\n  </p>\n  <div class=\"my-6 rounded-xl overflow-hidden border border-slate-200 shadow-xs bg-slate-900\">\n    <img src=\"/eftphoto/factory.jpg\" alt=\"上海现代化成套装备加工基地\" class=\"w-full h-72 object-cover\" />\n    <div class=\"p-3 text-slate-300 text-xs flex justify-between items-center\">\n      <span>E.F.T. 上海现代化精密加工与大型成套设备装配车间</span>\n      <span class=\"text-emerald-400 font-mono\">ISO9001 / CE CERTIFIED</span>\n    </div>\n  </div>\n</div>",
    "updated_at": "2026-03-16 10:00:00"
  },
  "bottom_tags": {
    "title": "热搜产品推荐标签 (Popular Product Tags)",
    "tags": [
      "智能可视对讲门铃",
      "数码安防监控系统",
      "精密工业零配件加工",
      "出口级工业制造装备",
      "超静音柴油发电机组",
      "汽摩精品改装配件",
      "数控机床与精密机械五金",
      "商超与学校综合配套设备",
      "医用级器械与防护耗材",
      "特种工程橡塑密封制品",
      "OEM/ODM外贸定制出海",
      "跨境进出口报关全托管服务"
    ],
    "content_html": "HE Efficient and Industry Limited (E.F.T.) 专注研发设计、智能制造与国际供应链交付。产品涵盖工业设备、汽摩配件、安防门铃及橡塑五金，支持全球客户多语言验厂与规格定制。",
    "enabled": true,
    "updated_at": "2026-09-18 10:00:00"
  }
}*/
-- SNAPSHOT_JSON_END
