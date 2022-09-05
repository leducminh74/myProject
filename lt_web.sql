/*
 Navicat Premium Data Transfer

 Source Server         : Web
 Source Server Type    : MySQL
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : lt_web

 Target Server Type    : MySQL
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 15/08/2022 16:25:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isAdmin` tinyint(1) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'admin', 'admin', 'ducminh0573@gmail..com', 1, '1');
INSERT INTO `account` VALUES (2, 'minh', '97f0e44dcd6fbf3646ac678a77919e48d32d9a815632fa4b7a4d3519e83f67a2', 'ducminh0573@gmail.com', 0, '1');
INSERT INTO `account` VALUES (3, 'minhccc', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'ducminh1311@gmail.com', 0, '2');
INSERT INTO `account` VALUES (18, 'minh1', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'ducminh1311@gmail.com', 0, '1');
INSERT INTO `account` VALUES (34, 'minh1234', '3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '19130133@st.hcmuaf.edu.vn', 0, '1');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int NOT NULL,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Guess');
INSERT INTO `category` VALUES (2, 'Abercrombie & Fitch');
INSERT INTO `category` VALUES (3, 'Parour');
INSERT INTO `category` VALUES (4, 'Furla');
INSERT INTO `category` VALUES (5, 'Dolce & Gabbana');
INSERT INTO `category` VALUES (6, 'Gucci');
INSERT INTO `category` VALUES (7, 'Other');

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `contact_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`contact_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES (0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for new_arrivals
-- ----------------------------
DROP TABLE IF EXISTS `new_arrivals`;
CREATE TABLE `new_arrivals`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of new_arrivals
-- ----------------------------
INSERT INTO `new_arrivals` VALUES ('female', 'Female');
INSERT INTO `new_arrivals` VALUES ('male', 'Male');
INSERT INTO `new_arrivals` VALUES ('unisex', 'Unisex');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orders_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `payment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`orders_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `account` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (71, 1, 189.00, '1', 'Đức Minh Lê', '22 Bà Trịu', '0122454', '2022-01-11 16:11:47', '2022-01-11 16:11:47', 4);
INSERT INTO `orders` VALUES (73, 18, 355.99, '1', 'Đức Minh Lê', '22 Bà Trịu', '0122454', '2022-01-18 15:08:27', '2022-01-18 15:08:27', 4);
INSERT INTO `orders` VALUES (74, 18, 244.00, '1', 'Đức Minh Lê', '22 Bà Trịu', '0122454', '2022-01-20 00:29:55', '2022-01-20 00:29:55', 3);
INSERT INTO `orders` VALUES (75, 18, 215.50, '1', 'Đức Minh Lê', '22 Bà Trịu', '0122454', '2022-01-20 10:16:29', '2022-01-20 10:16:29', 1);
INSERT INTO `orders` VALUES (76, 18, 63.00, '1', 'Đức Minh Lê', '22 Bà Trịu', '0122454', '2022-01-20 10:24:24', '2022-01-20 10:24:24', 5);

-- ----------------------------
-- Table structure for orders_detail
-- ----------------------------
DROP TABLE IF EXISTS `orders_detail`;
CREATE TABLE `orders_detail`  (
  `orders_detail_id` int NOT NULL AUTO_INCREMENT,
  `orders_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`orders_detail_id`) USING BTREE,
  INDEX `orders_id`(`orders_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `orders_detail_ibfk_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`orders_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_detail
-- ----------------------------
INSERT INTO `orders_detail` VALUES (90, 71, 2, 63.00, 3, '2022-01-11 16:11:47', '2022-01-11 16:11:47');
INSERT INTO `orders_detail` VALUES (91, 73, 1, 55.00, 2, '2022-01-18 15:08:27', '2022-01-18 15:08:27');
INSERT INTO `orders_detail` VALUES (92, 73, 2, 63.00, 2, '2022-01-18 15:08:27', '2022-01-18 15:08:27');
INSERT INTO `orders_detail` VALUES (93, 73, 6, 119.99, 1, '2022-01-18 15:08:27', '2022-01-18 15:08:27');
INSERT INTO `orders_detail` VALUES (94, 74, 1, 55.00, 1, '2022-01-20 00:29:55', '2022-01-20 00:29:55');
INSERT INTO `orders_detail` VALUES (95, 74, 2, 63.00, 3, '2022-01-20 00:29:55', '2022-01-20 00:29:55');
INSERT INTO `orders_detail` VALUES (96, 75, 9, 80.00, 1, '2022-01-20 10:16:29', '2022-01-20 10:16:29');
INSERT INTO `orders_detail` VALUES (97, 75, 10, 135.50, 1, '2022-01-20 10:16:29', '2022-01-20 10:16:29');
INSERT INTO `orders_detail` VALUES (98, 76, 2, 63.00, 1, '2022-01-20 10:24:24', '2022-01-20 10:24:24');

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `payment_id` int NOT NULL,
  `payment_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (1, 'Cash');
INSERT INTO `payment` VALUES (2, 'Paid');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `origin` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `concentration` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `capacity` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `sellprice` decimal(10, 2) NOT NULL,
  `style` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `img` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int NULL DEFAULT NULL,
  `cid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Guess Man Gold', 'Guess', 'Male', 'America', 'Eau de toilette', '100 ml', 'Guess fashion brand has just launched Guess Gold Men EDT for men. With an affordable price as an advantage, this is definitely a very masculine and sought-after version of the men\'s fragrance. Guess Man perfume was introduced to perfume lovers in 2006, th', 60.00, 55.00, 'young, modern, strong, masculine', 'http://localhost:8080/lab6_war_exploded/images/g10.png', 9, 1);
INSERT INTO `product` VALUES (2, 'Guess Seductive Blue', 'Guess', 'Male', 'America', 'Eau de toilette', '100 ml', 'GUESS SEDUCTIVE BLUE MEN, is a powerful scent that embodies the unique nature and playfully seductive style that characterizes the GUESS brand. Infused with cool aromas of black pepper, geranium and cashmere wood. The oriental fragrance evokes the quality', 72.00, 63.00, 'strong, manly, seductive', 'http://localhost:8080/lab6_war_exploded/images/g9.png', 47, 1);
INSERT INTO `product` VALUES (3, 'Guess Seductive Noir', 'Guess', 'Female', 'America', 'Eau de toilette', '100 ml', 'Guess Seductive Noir For Women Eau de Toilette offers the best attention-grabbing scent and is easily said passionately by a woman\'s inner hiddenness. Released in 2019, Guess Seductive Noir For Women EDT is crafted by master perfumers.', 64.00, 60.00, 'passionate, sexy, sophisticated', 'http://localhost:8080/lab6_war_exploded/images/g3.png', 89, 1);
INSERT INTO `product` VALUES (4, 'Guess 1981 Los Angeles', 'Guess', 'Female', 'America', 'Eau de toilette', '100 ml', 'GUESS 1981 Los Angeles for women is created with fresh notes of succulent fruit, red currant, juicy mandarin and a hint of pear. Followed by sun-soaked jasmine petals, rosy peony and sparkling orange blossom, while apricot nectar adds a hint of sweetness ', 89.30, 85.30, 'Young, seductive, feminine', 'http://localhost:8080/lab6_war_exploded/images/g4.png', 99, 1);
INSERT INTO `product` VALUES (5, 'Guess Gold', 'Guess', 'Female', 'America', 'Eau de parfum', '100 ml', 'Guess Gold was launched in 2007 in the harmonious rhythm of the floral-fruity fragrance group with its creator Claudette Belnavis. Inspired by its predecessor Guess fragrances but with a chic and captivating style, Guess Gold is perfect to wear with Guess', 124.50, 122.30, 'Sexy, feminine, casual', 'http://localhost:8080/lab6_war_exploded/images/g5.png', 98, 1);
INSERT INTO `product` VALUES (6, 'Guess Seductive', 'Guess', 'Female', 'America', 'Eau de toilette', '100 ml', 'Guess Seductive Perfume is a famous American brand of fashion and perfumery. In 2010, Guess brand launched Guess Seductive perfume, creating a scent that brings lightness and romance to the gentlest women. Guess Seductive was created by the talented hands', 146.10, 119.99, 'Seductive, sexy, free', 'http://localhost:8080/lab6_war_exploded/images/g6.png', 88, 1);
INSERT INTO `product` VALUES (7, 'Guess Dare', 'Guess', 'Male', 'America', 'Eau de toilette', '100 ml', 'After the feminine version Dare from 2014 and Double Dare from 2015, the Guess brand officially announced Dare for Men in mid-2016. The masculine scent of the Guess collection represents freedom, sexual desire. and adventure. Thi', 98.20, 90.80, 'Freedom, Seduction, Generosity ', 'http://localhost:8080/lab6_war_exploded/images/g7.png', 94, 1);
INSERT INTO `product` VALUES (8, 'Guess Girl', 'Guess', 'Female', 'America', 'Eau de toilette', '100 ml', 'Guess brand launched a new fragrance called Guess Girl in February 2013. This perfume was created targeting young girls in their 20s and was inspired by memories. 30 years of brand establishment. Steve Mormoris added: ', 123.60, 120.50, 'Young, personality, charming', 'http://localhost:8080/lab6_war_exploded/images/g8.png', 100, 1);
INSERT INTO `product` VALUES (9, 'A&F First Instinct', 'Abercrombie & Fitch', 'Male', 'America', 'Eau de toilette', '100 ml', 'Inspired by the first attraction moment, when the whole world around the couple is engulfed in the flames of passion. The fragrance “First Instinct” is the best way to illustrate the emotions of an exciting first look and an initial sense of connection. T', 88.40, 80.00, 'masculine, strong, seductive', 'http://localhost:8080/lab6_war_exploded/images/a1.png', 99, 2);
INSERT INTO `product` VALUES (10, 'A&F Authentic', 'Abercrombie & Fitch', 'Male', 'America', 'Eau de toilette', '100 ml', 'AUTHENTIC - a fresh scent that brings modernity in every man\'s breath. Opening with the scent of Grapefruit combined with bergamot opens the freshness, then, the scent adds a seductive and alluring charm thanks to the interesting, interesting drops of nat', 140.00, 135.50, 'Modern, masculine, elegant', 'http://localhost:8080/lab6_war_exploded/images/a2.png', 99, 2);
INSERT INTO `product` VALUES (11, 'A&F First Instinct', 'Abercrombie & Fitch', 'Female', 'America', 'Eau de parfum', '100 ml', 'Abercrombie & Fitch Woman, also known as First Instinct for Women, is a scent inspired by the first attractive moment of a woman, when the two sexes face each other and feel the \"thunderbolt\" right at the moment. head. There is no denying the influence of', 126.80, 120.00, 'Feminine, Elegant', 'http://localhost:8080/lab6_war_exploded/images/a3.png', 100, 2);
INSERT INTO `product` VALUES (12, 'A&F Authentic', 'Abercrombie & Fitch', 'Female', 'America', 'Eau de parfum', '100 ml', 'Launched in 2019, Abercrombie & Fitch Authentic is a fresh yet sexy fragrance that is the perfect complement to your bright outfit. With a blend of fruit and floral aromas, the sweetness and freshness begin with the juiciness of citrus and pear as well as', 150.30, 135.50, 'Sweet, feminine, charismatic', 'http://localhost:8080/lab6_war_exploded/images/a4.png', 100, 2);
INSERT INTO `product` VALUES (13, 'A&F First Instinct Blue', 'Abercrombie & Fitch', 'Male', 'America', 'Eau de toilette', '100 ml', 'Discover the deeper side of freshness with Abercrombie & Fitch First Instruments Blue For Men - a fresh fragrance for men with thrilling, unexpected and daring personality aspects. With the blue version for men, immediately evoke masculinity, strength and', 144.70, 123.60, 'masculine, strong, brave, sexy', 'http://localhost:8080/lab6_war_exploded/images/a5.png', 100, 2);
INSERT INTO `product` VALUES (14, 'A&F First Instinct Sheer', 'Abercrombie & Fitch', 'Female', 'America', 'Eau de parfum', '100 ml', 'First Instinct Sheer was launched in August 2018 after Abercrombie & Fitch\'s First Instinct Blue and First Instinct for Women were introduced in 2017. Developed based on the idea of bringing the feeling of immersion in looking at the flowers of the sun, w', 100.00, 98.99, 'Young, seductive, feminine', 'http://localhost:8080/lab6_war_exploded/images/a6.png', 100, 2);
INSERT INTO `product` VALUES (15, 'A&F First Instinct Extreme', 'Abercrombie & Fitch', 'Male', 'America', 'Eau de parfum', '100 ml', 'A&F First Instinct Extreme Men for men is a symbol of new experiences, excitement and becomes a daily companion in his upcoming adventures. Not as famous as other brands, but that does not mean that this fragrance does not surprise you, especially young m', 89.40, 85.00, 'masculine, strong, seductive', 'http://localhost:8080/lab6_war_exploded/images/a7.png', 100, 2);
INSERT INTO `product` VALUES (16, 'Lomani Orchidée Sauvage', 'Parour', 'Female', 'France', 'Eau de parfum', '100 ml', 'The scent of timeless freshness. Sweet, elegant and delicate notes for confident and happy women in life. Lomani Orchidee Sauvage is like a flower in full bloom, representing the beauty and attractiveness of a happy woman.', 75.50, 72.30, 'gentle, feminine, sweet, fresh', 'http://localhost:8080/lab6_war_exploded/images/p1.png', 100, 3);
INSERT INTO `product` VALUES (17, 'Mila\'s Secret Venezia', 'Parour', 'Female', 'France', 'Eau de parfum', '100 ml', 'Carrying fresh fruity notes of star fruit and tangerine, the middle notes of this perfume are emphasized by a floral trio of rose, orange blossom and jasmine.\nPatchouli adds a chypre elegance surrounded by a subtle aura of sensual vanilla and delicious pr', 82.70, 80.00, 'Young, seductive, feminine', 'http://localhost:8080/lab6_war_exploded/images/p2.png', 100, 3);
INSERT INTO `product` VALUES (18, 'Black Storm Private', 'Parour', 'Unisex', 'America', 'Eau de parfum', '100 ml', 'A symbol of masculinity, both strong and soft, Black Storm exudes an elegant and unique scent. The top note opens up to a fresh and slightly spicy scent before moving on to the next note with a fruity version. The strength of this note lies in agarwood an', 124.60, 122.00, 'Masculine, elegant, seductive', 'http://localhost:8080/lab6_war_exploded/images/b9.png', 100, 3);
INSERT INTO `product` VALUES (19, 'Jardin Du Sud', 'Parour', 'Unisex', 'America', 'Eau de toilette', '100 ml', 'Jardins du Sud EDT is for both men and women (unisex). A wonderfully citrusy fragrance (with jasmine in the center and mossy notes) spiced by fragrant flowers typical of sunny Provence.', 110.30, 103.70, 'Luxury, Noble, Elegant, Sophisticated', 'http://localhost:8080/lab6_war_exploded/images/j1.png', 99, 3);
INSERT INTO `product` VALUES (20, 'Vanille Tonka', 'Parour', 'Female', 'France', 'Eau de parfum', '100 ml', 'Incredibly delicious, sweet and full-bodied, this fragrance is reminiscent of the worlds of cigars and gastronomy. It is APPETIZING, like a dessert in which roses and black currants are soaked in a layer of vanilla and Tonka beans, providing satisfaction ', 154.30, 150.00, 'Sweet, luxurious, delicate', 'http://localhost:8080/lab6_war_exploded/images/v1.png', 100, 3);
INSERT INTO `product` VALUES (21, 'Rose De Marrakech Perfume', 'Parour', 'Female', 'France', 'Eau de parfum', '100 ml', 'A rose that shines, light, delicate, modern and delicious by the sweet color and sweet nectar of Marrakech rose, bringing a fresh and youthful fragrance, suitable for elegant women. , elegant, feminine. ', 110.00, 99.90, 'elegant, elegant, attractive', 'http://localhost:8080/lab6_war_exploded/images/r1.png', 100, 3);
INSERT INTO `product` VALUES (22, 'Divine Elixir Rose Capricieuse', 'Parour', 'Female', 'America', 'Eau de parfum', '100 ml', 'Intense, sensual, irresistible - Divine Elixir Rose Capricieuse perfume from Kristel Saint Martin offers a new sensation of timeless value. A delicate note suitable for the confident and wild woman that is hidden in each of us. This perfume creates a flor', 103.70, 100.00, 'Sweet, Feminine, Charming', 'http://localhost:8080/lab6_war_exploded/images/d1.png', 100, 3);
INSERT INTO `product` VALUES (23, 'Cigar Rose Noire', 'Parour', 'Female', 'France', 'Eau de parfum', '100 ml', 'Rose Noir is a classic elegant fragrance, dominated by powdery notes of iris and rose. Sensual and harmonious, it opens with notes of geranium, bergamot and jasmine. Middle notes include sandalwood, vetiver, rose and iris, while base notes are vanilla, am', 126.50, 125.00, 'Sweet, passionate, feminine', 'http://localhost:8080/lab6_war_exploded/images/c1.png', 100, 3);
INSERT INTO `product` VALUES (24, 'Jardin Du Sud by Fouquet\'s ', 'Parour', 'Unisex', 'France', 'Eau de toilette', '100 ml', 'Jardins du Sud EDT is for both men and women (unisex). A sublime citrus fragrance (with jasmine in the center and oakmoss of vetiver) spiced with fragrant lavender blooms typical of sunny Provence.', 98.30, 95.00, 'Luxury, Noble, Elegant, Sophisticated', 'http://localhost:8080/lab6_war_exploded/images/j2.png', 100, 3);
INSERT INTO `product` VALUES (25, 'White Fusion', 'Parour', 'Unisex', 'America', 'Eau de parfum', '100 ml', 'The fresh scent in the top notes blends perfectly with the woody base notes. The floral duo creates a vibrant and energetic fragrance. The scent of jasmine blends beautifully with the elegant rose scent. They are then connected to the scent of majestic fo', 83.20, 78.00, 'Fresh, elegant, delicate', 'http://localhost:8080/lab6_war_exploded/images/w1.png', 100, 3);
INSERT INTO `product` VALUES (26, 'Mystic Scent Pour Homme ', 'Parour', 'Male', 'America', 'Eau de toilette', '100 ml', 'This fragrance gives a strong and delicate feeling, with a hint of citrus sparkle, as well as portrays the sensuality of the user, providing a captivating atmosphere like an unforgettable song. echo here. ', 50.30, 45.00, 'passionate, sexy, delicate', 'http://localhost:8080/lab6_war_exploded/images/m1.png', 100, 3);
INSERT INTO `product` VALUES (27, 'Fugue A Paris', 'Parour', 'Male', 'France', 'Eau de toilette', '100 ml', 'A harmony of precious woods and rare spices, the notes are placed in an addictive base of vanilla and balm that brings sophistication, elegance and holds all the essence of nobility. characteristic faction of Paris', 72.70, 68.10, 'Exquisite, luxurious', 'http://localhost:8080/lab6_war_exploded/images/f1.png', 100, 3);
INSERT INTO `product` VALUES (28, 'Vial Spice Addict', 'Parour', 'Unisex', 'France', 'Eau de parfum', '100 ml', 'It is a wonderful blend of strong, sensual spice and deep forest aroma. The brilliant combination of raw materials gives this perfume its character. The scent creator has chosen to exploit the strengths of wood, such as Gaiac and Patchoul, which bring uni', 122.60, 110.30, 'passionate, sexy, sophisticated', 'http://localhost:8080/lab6_war_exploded/images/v2.png', 100, 3);
INSERT INTO `product` VALUES (29, 'Mila\'s Secret Amazing Diamond', 'Parour', 'Female', 'America', 'Eau de parfum', '100 ml', 'A fragrance that wraps the body with a strong femininity, Amazing Diamond opens up an attractive fresh fruity note on a base of lemon, black currant and freesia.', 89.90, 85.30, 'Feminine, seductive, sexy', 'http://localhost:8080/lab6_war_exploded/images/m2.png', 100, 3);
INSERT INTO `product` VALUES (30, 'Rose Elixir Musc', 'Parour', 'Female', 'France', 'Eau de parfum', '100 ml', 'ROSE ELIXIR MUSC Eau de Parfum is the creation of the new brand PRIVATE PERFUMER, as a true elixir that marks the sophistication of a sumptuous bouquet of roses and peonies. Middle notes are harmony between precious Absolute and Damascus rose. At the base', 92.70, 90.00, 'Sophisticated, elegant, sexy', 'http://localhost:8080/lab6_war_exploded/images/r2.png', 100, 3);
INSERT INTO `product` VALUES (31, 'Spice Addict By Lomani', 'Parour', 'Unisex', 'America', 'Eau de parfum', '100 ml', 'It is a wonderful blend of strong, sensual spice and deep forest aroma. The brilliant combination of raw materials gives this perfume its character. The scent creator has chosen to exploit the strengths of wood, such as Gaiac and Patchoul, which bring uni', 87.90, 85.00, 'passionate, sexy, sophisticated', 'http://localhost:8080/lab6_war_exploded/images/s1.png', 100, 3);
INSERT INTO `product` VALUES (32, 'Cigar Silver Essence', 'Parour', 'Male', 'France', 'Eau de toilette', '100 ml', 'Silver Essence by Cigar is a pungent fragrance for men. Silver Essence was launched in 2014. Top notes are lemon, grapefruit, mandarin and orange; middle notes are ginger, geranium, nutmeg, green incense and water notes; Base notes are cedar, patchouli, v', 111.30, 105.70, 'Masculine, elegant, seductive', 'http://localhost:8080/lab6_war_exploded/images/c2.png', 100, 3);
INSERT INTO `product` VALUES (33, 'Vial White Fusion by Lomani', 'Parour', 'Unisex', 'France', 'Eau de parfum', '100 ml', 'The fresh scent in the top notes blends perfectly with the woody base notes. The floral duo creates a vibrant and energetic fragrance. The scent of jasmine blends beautifully with the elegant rose scent. They are then connected to the scent of majestic fo', 95.40, 90.00, 'Fresh, elegant, delicate', 'http://localhost:8080/lab6_war_exploded/images/p3.png', 100, 3);
INSERT INTO `product` VALUES (34, 'Jasmin de Grasse', 'Parour', 'Female', 'France', 'Eau de parfum', '100 ml', 'A DELICIOUS sensation and \"sweet\" taste thanks to the combination of uniform aromas and slightly caramelized notes as in mainstream Havana cigars often radiate this aroma. Nestled in the hilltops above the French Riviera, the scent of Jasmine pervades the', 88.70, 75.00, 'Gentle, Sweet, Sensual', 'http://localhost:8080/lab6_war_exploded/images/j3.png', 100, 3);
INSERT INTO `product` VALUES (35, 'Vial Cigar Rose Noire', 'Parour', 'Female', 'America', 'Eau de parfum', '100 ml', 'An ENERGY fragrance. Extremely strong aromas of flowers and especially red berries highlighted by pepper and pink pepper give off a sweet, nutty aroma reminiscent of raspberry macaroons to enjoy with jasmine tea. or as a cigar with a floral aroma.', 96.30, 90.00, 'Sweet, passionate, feminine', 'http://localhost:8080/lab6_war_exploded/images/v3.png', 100, 3);
INSERT INTO `product` VALUES (36, 'Vial Black Storm', 'Parour', 'Unisex', 'America', 'Eau de parfum', '100 ml', 'A symbol of masculinity, both strong and soft, Black Storm exudes an elegant and unique scent. The top note opens up to a fresh and slightly spicy scent before moving on to the next note with a fruity version. The strength of this note lies in agarwood an', 88.50, 85.70, 'Masculine, elegant, seductive', 'http://localhost:8080/lab6_war_exploded/images/v4.png', 100, 3);
INSERT INTO `product` VALUES (37, 'Vial Cigar Mystic', 'Parour', 'Male', 'America', 'Eau de toilette', '100 ml', 'This fragrance gives a strong and delicate feeling, with a hint of citrus sparkle, as well as portrays the sensuality of the user, providing a captivating atmosphere like an unforgettable song. echo here. ', 121.30, 110.30, 'passionate, sexy, sophisticated', 'http://localhost:8080/lab6_war_exploded/images/v5.png', 100, 3);
INSERT INTO `product` VALUES (38, 'Vial Cigar Aromatic Amber', 'Parour', 'Male', 'France', 'Eau de toilette', '100 ml', 'An atmosphere with a characteristic tobacco smoke, helps the body relax and each note is a gentle interpretation with a sweet and warm aroma with spices of black and pink peppers. A strong oriental touch for a perfect gentleman\'s demeanor, where the deep ', 116.20, 110.10, 'Elegant, Elegant, Charming', 'http://localhost:8080/lab6_war_exploded/images/v6.png', 100, 3);
INSERT INTO `product` VALUES (39, 'Vial Rose Taif & Vanille', 'Parour', 'Female', 'France', 'Eau de parfum', '100 ml', 'L\'Eau de Parfum ROSE TAÏF&VANILLE is inspired by Taïf - the heart of an Eastern oasis in the Mecca region of Saudi Arabia. The city of Taïf is often referred to as the city of roses because of the delicately scented flowers that grow in the deserts of thi', 75.60, 74.00, 'Sexy, elegant, seductive', 'http://localhost:8080/lab6_war_exploded/images/v7.png', 100, 3);
INSERT INTO `product` VALUES (40, 'Vial Mila\'s Secret Amazing ', 'Parour', 'Female', 'America', 'Eau de parfum', '100 ml', 'A fragrance that wraps the body with a strong femininity, Amazing Diamond opens up an attractive fresh fruity note on a base of lemon, black currant and freesia.', 62.80, 60.00, 'Feminine, seductive, sexy', 'http://localhost:8080/lab6_war_exploded/images/v8.png', 100, 3);
INSERT INTO `product` VALUES (41, 'Vial Cigar Silver Essence', 'Parour', 'Male', 'France', 'Eau de toilette', '100 ml', 'Silver Essence by Cigar is a pungent fragrance for men. Silver Essence was launched in 2014. Top notes are lemon, grapefruit, mandarin and orange; middle notes are ginger, geranium, nutmeg, green incense and water notes; Base notes are cedar, patchouli, v', 110.40, 102.00, 'Masculine, elegant, seductive', 'http://localhost:8080/lab6_war_exploded/images/v9.png', 100, 3);
INSERT INTO `product` VALUES (42, 'Vial Mila\'s Secret Venezia', 'Parour', 'Female', 'France', 'Eau de parfum', '100 ml', 'Carrying fresh fruity notes of star fruit and tangerine, the middle notes of this perfume are emphasized by a floral trio of rose, orange blossom and jasmine.', 89.60, 85.30, 'Young, seductive, feminine', 'http://localhost:8080/lab6_war_exploded/images/v10.png', 100, 3);
INSERT INTO `product` VALUES (43, 'Vial Cigar Essence de Bois', 'Parour', 'Male', 'France', 'Eau de toilette', '100 ml', 'The impression of the Cigar Essence de Bois Precious Pour Homme EDT is very noticeable, like the cigar exudes a blend of uniform aromas. Spicy vanilla finishes with a faintly chalky, round, warm, sensual, addictive aroma. With an aluminum box design with ', 92.70, 90.30, 'Masculine, elegant, seductive', 'http://localhost:8080/lab6_war_exploded/images/v11.png', 100, 3);
INSERT INTO `product` VALUES (44, 'Vial Jardin Du Sud', 'Parour', 'Unisex', 'America', 'Eau de toilette', '100 ml', 'Jardins du Sud EDT is for both men and women (unisex). A sublime citrus fragrance (with jasmine in the center and oakmoss of vetiver) spiced with fragrant lavender blooms typical of sunny Provence.', 76.40, 72.10, 'Luxury, Noble, Elegant, Sophisticated', 'http://localhost:8080/lab6_war_exploded/images/v12.png', 100, 3);
INSERT INTO `product` VALUES (45, 'Vial Vanille Tonka', 'Parour', 'Female', 'France', 'Eau de parfum', '100 ml', 'Incredibly delicious, sweet and full-bodied, this fragrance is reminiscent of the worlds of cigars and gastronomy. It is APPETIZING, like a dessert in which roses and black currants are soaked in a layer of vanilla and Tonka beans, providing satisfaction ', 123.50, 116.50, 'Sweet, luxurious, delicate', 'http://localhost:8080/lab6_war_exploded/images/v13.png', 100, 3);
INSERT INTO `product` VALUES (46, 'Jean Paul Gaultier Scandal', 'Jean Paul Gaultier', 'Male', 'France', 'Eau de toilette', '100 ml', 'For the first time, the Scandal perfume line with the symbol of elongated legs appeared in a version for men. Jean Paul Gaultier Scandal Pour Homme EDT has caused a fever in the scent region with the image of a guy possessing strong muscles, seductive but', 110.80, 98.10, 'Masculine, seductive, daring', 'http://localhost:8080/lab6_war_exploded/images/j4.png', 100, 7);
INSERT INTO `product` VALUES (47, 'South Carolina Herrera BadBoy', 'Carolina Herrera', 'Male', 'France', 'Eau de toilette', '100 ml', 'Reviving the charisma and allure of Hollywood superstars with this new edition, this collector\'s iconic Bad Boy scent arrives in a sparkling finish that embodies the opposite personality. embodies the bold nature of the modern man. Bad Boy Superstars is t', 112.50, 109.20, 'Masculine, outstanding, attractive', 'http://localhost:8080/lab6_war_exploded/images/s2.png', 100, 7);
INSERT INTO `product` VALUES (48, 'Jimmy Choo Urban Hero', 'Jimmy Choo', 'Male', 'America', 'Eau de parfum', '100 ml', 'Jimmy Choo Urban Hero Gold Edition is a sophisticated fragrance with an intense creative spirit, a symbol of street art full of rebellious, inspirational but also very elegant and daring. Urban Hero Gold embodies the opposing personalities of a man and em', 92.60, 90.80, 'Bold, masculine, fresh', 'http://localhost:8080/lab6_war_exploded/images/j5.png', 100, 7);
INSERT INTO `product` VALUES (49, 'CK Defy', 'Calvin Klein', 'Male', 'America', 'Eau de toilette', '100 ml', 'Calvin Klein Defy EDT for men  was launched in 2021, specially crafted by 3 different perfumers at the same time: Pascal Gaurin, Loc Dong and Anne Flipo. The face of the campaign is star Richard Madden, who appears dressed in Calvin Klein\'s iconic white t', 112.50, 110.60, 'Fresh, Powerful, Charming', 'http://localhost:8080/lab6_war_exploded/images/c3.png', 100, 7);
INSERT INTO `product` VALUES (50, 'Tiffany & Co Love', 'T&C', 'Male', 'France', 'Eau de toilette', '100 ml', 'Tiffany & Co Men\'s Perfume Love For Him is a high-end product line from the famous Tiffany & Co brand, launched by the brand in 2019 with an extremely attractive scent that has been sought after by many perfumers since its inception. launch. Rather, this ', 121.80, 110.00, 'Masculine, elegant, seductive', 'http://localhost:8080/lab6_war_exploded/images/t1.png', 100, 7);
INSERT INTO `product` VALUES (51, 'Dsquared2 Green Wood', 'DSQUARED', 'Male', 'Canada', 'Eau de toilette', '100 ml', 'Launched in parallel with Red Wood Pour Femme, DSQUARED² Green Wood Pour Homme men\'s perfume was created as a pair of cards that attracted the perfume world since 2019. Classified in the Woody Aromatic fragrance line, it is not too difficult to understand', 178.50, 150.00, 'Attractive, Strong, Masculine', 'http://localhost:8080/lab6_war_exploded/images/d2.png', 100, 7);
INSERT INTO `product` VALUES (52, 'Lacoste Match Point', 'Lacoste', 'Male', 'France', 'Eau de toilette', '100 ml', 'Lacoste Match Point For Men EDT is the most anticipated summer men\'s fragrance from the Lacoste \"crocodile\" brand. If you ask me what the enthusiasm of young men is, I will explain it to you with the scent of Lacoste Match Point. No need to be too liberal', 75.80, 70.20, 'Charming, Confident, Masculine', 'http://localhost:8080/lab6_war_exploded/images/l1.png', 100, 7);
INSERT INTO `product` VALUES (53, 'Paco Rabanne Phantom', 'Paco Rabanne', 'Male', 'Spain', 'Eau de toilette', '100 ml', 'Perfume  Paco Rabanne EDT Phantom is a woody perfume for men was launched in 2021. The Phantom was created by Anne FLIPO, Dominique Ropion, Loc Dong and Juliette Karagueuzoglou. As the world\'s first perfume model that can connect to your smartphone throug', 92.40, 89.20, 'Charming, Confident, Dynamic', 'http://localhost:8080/lab6_war_exploded/images/p4.png', 100, 7);
INSERT INTO `product` VALUES (54, 'Paco Rabanne Phantom ', 'Paco Rabanne', 'Male', 'Spain', 'Eau de toilette', '100 ml', 'If you already love the Paco Rabanne Phantom EDT men\'s fragrance, the comfort that this fragrance brings can last longer with the deodorant stick with the Paco Rabanne Phantom Deo Stick For Men line. The essence of confidence fueled by good energy and goo', 98.40, 90.00, 'Charming, Confident, Dynamic', 'http://localhost:8080/lab6_war_exploded/images/p5.png', 100, 7);
INSERT INTO `product` VALUES (55, 'Tommy Hilfiger Impact Intense', 'Tommy Hilfiger', 'Male', 'America', 'Eau de parfum', '100 ml', 'The newly released Tommy Hilfiger Impact Intense For Men EDP men\'s fragrance is an upgraded version of the previous Tommy Hilfiger Impact For Men EDT. Enjoy the thrill of achieving your dreams with Tommy Hilfiger Impact Intense For Men EDP, a more immersi', 75.30, 70.90, 'Attractive, Strong, Masculine', 'http://localhost:8080/lab6_war_exploded/images/t2.png', 100, 7);
INSERT INTO `product` VALUES (56, 'D&G The One Gold Intense', 'Dolce & Gabbana', 'Male', 'IDEA', 'Eau de parfum', '100 ml', 'The One Gold Intense For Men EDP is the next version launched in 2021 to continue the success of the versions of The One fragrance line - a fragrance line with fragrance duos for men and women. most special of Dolce & Gabbana. ', 210.40, 200.00, 'Luxury, Elegant, Powerful, Charming', 'http://localhost:8080/lab6_war_exploded/images/dg1.png', 100, 5);
INSERT INTO `product` VALUES (57, 'D&G Light Blue Forever', 'Dolce & Gabbana', 'Male', 'IDEA', 'Eau de parfum', '100 ml', 'Light Blue Forever is the 20th anniversary edition of Light Blue floral fragrance. The Italian fashion house has launched two new scents for men and women. This limited edition perfume can be seen as a representation of the couple\'s love for Dolce & Gabba', 250.30, 244.70, 'Fresh, elegant, delicate', 'http://localhost:8080/lab6_war_exploded/images/dg2.png', 100, 5);
INSERT INTO `product` VALUES (58, 'Boss Bottled', 'Hugo Boss', 'Male', 'Germany', 'Eau de parfum', '100 ml', 'Hugo Boss Boss Bottled Eau de Parfum is a spicy woody fragrance, inspired by the original Hugo Boss Boss Bottled Eau de Toilette. The fragrance is balanced with a fresh top note with warm fruit and floral notes, a bit pungent dominated by black pepper, ci', 110.40, 102.50, 'Masculine, elegant, seductive', 'http://localhost:8080/lab6_war_exploded/images/b2.png', 100, 7);
INSERT INTO `product` VALUES (59, 'Mont Blanc Explorer Ultra Blue', 'Mont Blanc', 'Male', 'France', 'Eau de parfum', '100 ml', 'Explorer Ultra Blue was created by Jordi Fernández, Olivier Pescheux and Antoine Maisondieu. The Explorer Ultra Blue man is confident, determined and an undying spirit of adventure. He celebrates blue, the color of the sky and sea, the blue of snow-capped', 89.40, 80.80, 'Modern, Liberal, Confident', 'http://localhost:8080/lab6_war_exploded/images/m3.png', 100, 7);
INSERT INTO `product` VALUES (60, 'Creed Virgin Island Water', 'Creed', 'Male', 'France', 'Eau de parfum', '100 ml', 'Creed Virgin Island Water has a pure sound, sketching the pure, virgin beauty mixed with a bit of wildness and rusticity that Olivier Creed and his son Erwin Creed have felt during their journey down the rivers. boat near Ginger Island in the Caribbean. O', 300.50, 289.90, 'Sophisticated, Attractive, Luxurious', 'http://localhost:8080/lab6_war_exploded/images/c4.png', 100, 7);
INSERT INTO `product` VALUES (61, 'Versace Eros ', 'Versace', 'Male', 'Italy', 'Eau de parfum', '100 ml', 'If you are used to seeing Versace Eros as a dynamic, young man, now Versace Eros EDP will appear as an experienced man, lingering more or less dust in his eyes. The fact that this guy was inherently wild, is now even more attractive by his dusty, dusty lo', 110.50, 102.70, 'Masculine, Sexy, Outstanding', 'http://localhost:8080/lab6_war_exploded/images/v14.png', 100, 7);
INSERT INTO `product` VALUES (62, 'Carolina Herrera 212 Heroes', 'Carolina Herrera', 'Male', 'America', 'Eau de toilette', '100 ml', 'Inspired by the prosperous metropolis of New York with its youthful and enthusiastic energy that never stops moving, 212 by Carolina Herrera represents the perfect intersection of beauty of old values ​​and old values. modern novelties.', 98.50, 95.40, 'Young, dynamic, personality', 'http://localhost:8080/lab6_war_exploded/images/c5.png', 100, 7);
INSERT INTO `product` VALUES (63, 'Jean Paul Gaultier Le Male', 'Jean Paul Gaultier', 'Male', 'France', 'Eau de parfum', '100 ml', 'Le Male Le Parfum by Jean Paul Gaultier is an oriental fragrance for men launched in 2020 with the skillful hands of Quentin Bisch and Nathalie Gracia-Cetto. Bearing the image of a captain full of masculinity and majesty, this fragrance is considered to h', 72.30, 77.10, 'Charming, Sexy, Attractive', 'http://localhost:8080/lab6_war_exploded/images/j6.png', 100, 7);
INSERT INTO `product` VALUES (64, 'Davidoff Run Wild', 'Davidoff', 'Male', 'Switzerland', 'Eau de toilette', '100 ml', 'Launched in 2019, Run Wild Davidoff is a male spirit product from creators Alexandra Carlin and Pierre-Constantin Guéros.Like a beach undulating with waves, the sun shines through each canopy, making the passion of ginger and cinnamon blend into the green', 65.40, 60.00, 'Charming, Attractive, Outstanding', 'http://localhost:8080/lab6_war_exploded/images/d3.png', 100, 7);
INSERT INTO `product` VALUES (65, 'Narciso Rodriguez Bleu Noir', 'Narciso Rodriguez', 'Male', 'America', 'Eau de parfum', '100 ml', 'Narciso Rodriguez presents Narciso Rodriguez For Him Bleu Noir Eau de Parfum – a new version of the original For Him Bleu Noir released in 2015 with the Eau de Toilette. Bleu Noir Eau de Parfum is luxurious, attractive and sexy. Narciso Rodriguez For Him ', 72.70, 70.50, 'Luxurious, Attractive, Sensual', 'http://localhost:8080/lab6_war_exploded/images/n1.png', 100, 7);
INSERT INTO `product` VALUES (66, 'Carolina Herrera GoodGirl', 'Carolina Herrera', 'Female', 'America', 'Eau de parfum', '100 ml', 'Capturing the boldness of the rock chick lady, Good Girl Superstars EDP was born as a tribute to the confident star within you. The legendary and dazzling Good Girl fragrance by Carolina Herrera promises to steal every lady\'s heart thanks to the sparkling', 89.80, 87.50, 'Feminine, outstanding, shining', 'http://localhost:8080/lab6_war_exploded/images/c6.png', 100, 7);
INSERT INTO `product` VALUES (67, 'Coach Dreams Sunset', 'Coach', 'Female', 'America', 'Eau de parfum', '100 ml', 'Coach Dreams Sunset EDP Women\'s Perfume - the latest fragrance line of the Coach brand, describes young girls who are free to explore and experience new and different things around them. Dreams Sunset has a light, youthful and liberal fragrance. ', 92.60, 89.80, 'Young, gentle, feminine', 'http://localhost:8080/lab6_war_exploded/images/c7.png', 100, 7);
INSERT INTO `product` VALUES (68, 'Royal Delina Exclusif', 'Parfums De Marly', 'Female', 'America', 'Eau de parfum', '100 ml', 'Parfums de Marly Delina Exclusif for women  was launched in 2017 by the Parfums de Marly brand  . This haughty girl was created by top perfumer Quentin Bisch, a genius at bringing historical emotions, combining noble ingredients and creating luxurious, pr', 75.50, 72.10, 'Feminine, Glamorous, Outstanding, Luxurious', 'http://localhost:8080/lab6_war_exploded/images/r3.png', 100, 7);
INSERT INTO `product` VALUES (69, 'Moschino Toy 2 BubbleGum', 'Moschino', 'Female', 'IDEA', 'Eau de toilette', '100 ml', 'Launched in 2021, Moschino Toy 2 Bubble Gum For Women EDT has affirmed Moschino as a special brand in fashion and perfumery when launching the Toy series, especially Toy 2 and Toy Boy. These two fragrances have been making waves in the international fragr', 68.40, 65.80, 'Sweet, Young, Cute', 'http://localhost:8080/lab6_war_exploded/images/m4.png', 100, 7);
INSERT INTO `product` VALUES (70, 'Tiffany & Co Signature Sheer', 'Tiffany & Co', 'Female', 'France', 'Eau de toilette', '100 ml', 'Launched in 2017,  Tiffany & Co Signature Sheer For Women EDP is one of the next fragrances launched by the most popular American jewelry brand. Full of light and sparkle, this floral fragrance leaves a special mark on the modern, sophisticated and youthf', 89.20, 87.60, 'Fresh, elegant, delicate', 'http://localhost:8080/lab6_war_exploded/images/t3.png', 100, 5);
INSERT INTO `product` VALUES (71, 'Tiffany & Co Signature', 'Tiffany & Co', 'Female', 'France', 'Eau de parfum', '100 ml', 'Women\'s perfume Tiffany & Co Signature For Women EDP  is one of the first perfume line of brand jewelry, luxury accessories hottest America - Tiffany & Co. famous for its exquisite and iconic jewelry designs. This version of Eau de Parfum is a signature s', 127.40, 120.40, 'Modern, feminine, sophisticated', 'http://localhost:8080/lab6_war_exploded/images/t4.png', 100, 5);
INSERT INTO `product` VALUES (72, 'Tiffany & Co Signature Intense', 'Tiffany & Co', 'Female', 'France', 'Eau de parfum', '100 ml', 'In 2018, the most popular luxury jewelry and accessories brand in the US - Tiffany & Co. Famous for their exquisite and iconic jewelry designs,  Tiffany & Co Signature Intense For Women EDP continues with richer and deeper notes of the already launched si', 130.50, 117.50, 'Sexy, seductive, feminine', 'http://localhost:8080/lab6_war_exploded/images/t5.png', 100, 5);
INSERT INTO `product` VALUES (73, 'Furla Favolosa', 'Furla', 'Female', 'America', 'Eau de parfum', '100 ml', 'Furla Favolosa For Women EDP  is part of the  Furla Fragrance Collection - The  Harmonious Collection  of Art and Beauty ; combines the refinement of raw materials and the innovative process of the brand, recognized worldwide. Aimed at a female customer w', 92.70, 90.00, 'Modern, feminine, seductive', 'http://localhost:8080/lab6_war_exploded/images/f2.png', 100, 4);
INSERT INTO `product` VALUES (74, 'Furla Irresistible', 'Furla', 'Female', 'America', 'Eau de parfum', '100 ml', 'Furla Irresistible For Women EDP  is a part of the  Furla Fragrance Collection - The  Harmonious Collection  of Art and Beauty ; combines the refinement of raw materials and the innovative process of the brand, recognized worldwide. Aimed at a female cust', 87.90, 85.00, 'ethereal, contemporary, attractive', 'http://localhost:8080/lab6_war_exploded/images/f3.png', 100, 4);
INSERT INTO `product` VALUES (75, 'Furla Preziosa', 'Furla', 'Female', 'America', 'Eau de parfum', '100 ml', 'Furla Preziosa For Women EDP  is part of the  Furla Fragrance Collection - The  Harmonious Collection  of Art and Beauty ; combines the refinement of raw materials and the innovative process of the brand, recognized worldwide. Aimed at a female customer w', 111.30, 105.70, 'Glamor, luxury, sophistication', 'http://localhost:8080/lab6_war_exploded/images/f4.png', 100, 4);
INSERT INTO `product` VALUES (76, 'Furla Romantica ', 'Furla', 'Female', 'America', 'Eau de parfum', '100 ml', 'Furla Romantica For Women EDP  is part of the  Furla Fragrance Collection - The  Harmonious Collection  of Art and Beauty ; combines the refinement of raw materials and the innovative process of the brand, recognized worldwide. Aimed at a female customer ', 95.40, 90.00, 'Sophisticated, sophisticated, feminine', 'http://localhost:8080/lab6_war_exploded/images/f5.png', 100, 4);
INSERT INTO `product` VALUES (77, 'Furla Magnifica', 'Furla', 'Female', 'America', 'Eau de parfum', '100 ml', 'Furla Magnifica Women\'s perfume EDP is in the collection  Furla Fragrance Collection  - Collection  of harmony of art and beauty ; combines the refinement of raw materials and the innovative process of the brand, recognized worldwide. Aimed at a female cu', 88.70, 75.00, 'intense, elegant', 'http://localhost:8080/lab6_war_exploded/images/f6.png', 100, 4);
INSERT INTO `product` VALUES (78, 'Dsquared2 Red Wood', 'DSQUARED', 'Female', 'Canada', 'Eau de toilette', '100 ml', 'Dsquared2 Red Wood Pour Femme EDT Women\'s Perfume was launched in 2019. The main color is red with the meaning of hotness and simple design like a potion ready to \"heal\" tender souls. . A bold, personal fragrance for modern girls who are always looking fo', 96.30, 90.00, 'Sexy, Sexy, Feminine', 'http://localhost:8080/lab6_war_exploded/images/d4.png', 100, 7);
INSERT INTO `product` VALUES (79, 'Paco Rabanne Lady Fabulous', 'Paco Rabanne', 'Female', 'Spain', 'Eau de parfum', '100 ml', 'Discover the new feminine fragrance from Paco Rabanne, Lady Million Fabulous - the queen of the night, where the party is and where she wields her power: gorgeous and dramatic. With the spirit of \"Life is fabulous. Time to shine!\", Paco Rabanne Lady Milli', 88.50, 85.70, 'Feminine, seductive, sexy', 'http://localhost:8080/lab6_war_exploded/images/p6.png', 100, 7);
INSERT INTO `product` VALUES (80, 'Lanvin Eclat D\'Arpege Sheer', 'Lanvin', 'Female', 'France', 'Eau de toilette', '100 ml', 'Lanvin Eclat D\'Arpege Sheer is a light, pure scent, with feminine pastel colors, this perfume bottle is like a sparkling crystal drop that everyone wants to own. With the latest variation hidden in a pale pink pearl, decorated with the famous symbol of mo', 121.30, 110.30, 'Sexy, Sexy, Feminine', 'http://localhost:8080/lab6_war_exploded/images/l2.png', 100, 7);
INSERT INTO `product` VALUES (81, 'Chloe Nomade Absolu', 'Chloe', 'Female', 'France', 'Eau de parfum', '100 ml', 'Chloe Nomade Absolu De Parfum EDP Women\'s Water  - the perfect gift that immerses her in the warm, delicate fragrance of a magical land that exists only in the realm of fantasy, Nomade Absolu unveils a powerful new version. more intense developed from the', 116.20, 110.10, 'Glamor, Luxury, Sophistication', 'http://localhost:8080/lab6_war_exploded/images/c8.png', 100, 7);
INSERT INTO `product` VALUES (82, 'Issey Miyake A Drop', 'Issey Miyake', 'Female', 'Japan', 'Eau de parfum', '100 ml', 'The new Issey Miyake A Drop D\'Issey EDP  Women\'s Perfume for Women by Issey Miyake is an invitation to see the \"familiar\" world in a new light, discovering the beauty hidden in nature. . A warm floral fragrance with notes of lilac is perceived through the', 85.00, 74.00, 'Fresh, natural, feminine, sweet', 'http://localhost:8080/lab6_war_exploded/images/i1.png', 100, 7);
INSERT INTO `product` VALUES (83, 'Chloe L\'Eau ', 'Chloe', 'Female', 'France', 'Eau de toilette', '100 ml', 'Once again Chloé celebrates feminine elegance by launching a new set of Chloé Eau de Parfum editions from 2008, followed by several Eau de Toilette variations. This time a bouquet of flowers in pale coral pink packaging. The fragrance, CHLOÉ L\'EAU EAU DE ', 98.20, 90.80, 'Feminine, Seductive, Sophisticated', 'http://localhost:8080/lab6_war_exploded/images/c9.png', 100, 7);
INSERT INTO `product` VALUES (84, 'Kenzo Flower ', 'Kenzo', 'Female', 'France', 'Eau de parfum', '100 ml', 'Let a bright red and fragile Poppy flower set the tone. “Love life and live with passion” - Love life and live with passion. Capture every moment and sing the hymn together. Poppy is a flower with bold red color and carries in itself a symbol of strength,', 123.60, 120.50, 'Feminine, Seductive, Gentle', 'http://localhost:8080/lab6_war_exploded/images/k1.png', 100, 7);
INSERT INTO `product` VALUES (85, 'Creed Spring Flower', 'Creed', 'Female', 'France', 'Eau de parfum', '100 ml', 'Flowers have been contributing to art and at Creed Spring Flower we see creative art blooming into flower clusters. Creed perfume brand is really \"cool\" in the cultivation career, so that the \"spring flowers\" that spread the fragrance from the golden age ', 88.40, 80.00, 'Elegant, Stylish, Feminine', 'http://localhost:8080/lab6_war_exploded/images/c10.png', 100, 7);
INSERT INTO `product` VALUES (86, 'Creed Royal Oud', 'Creed', 'Female', 'France', 'Eau de parfum', '100 ml', 'Under the magical hand of Olivier Creed, Royal Oud was born with the mission to honor elegance and majesty for both men and women. For him, the beauty without boundaries is the most obvious beauty. Filling our emotions from the top notes with Orange, Lemo', 140.00, 135.50, 'Glamor, Sophistication, Luxury', 'http://localhost:8080/lab6_war_exploded/images/c11.png', 100, 7);
INSERT INTO `product` VALUES (87, 'Carolina Herrera Very GoodGirl', 'Carolina Herrera', 'Female', 'America', 'Eau de parfum', '100 ml', 'Very Good Girl by Carolina Herrera is a fruity floral fragrance for women launched in 2021 by Quentin Bisch and Louise Turner. Very Good Girl EDP  is the boldest yet of Carolina Herrera\'s iconic scent of the opposite of the modern woman, sexy and hot but ', 126.80, 120.00, 'Glamor, Outstanding, Luxurious', 'http://localhost:8080/lab6_war_exploded/images/c12.png', 100, 7);
INSERT INTO `product` VALUES (88, 'Private Perfumer Rose Elixir', 'Parour', 'Female', 'America', 'Eau de parfum', '100 ml', 'ROSE ELIXIR MUSC Eau de Parfum is the creation of the new brand PRIVATE PERFUMER, as a true elixir that marks the sophistication of a sumptuous bouquet of roses and peonies. Middle notes are harmony between precious Absolute and Damascus rose. At the base', 150.30, 135.50, 'Sophisticated, elegant, sexy', 'http://localhost:8080/lab6_war_exploded/images/p7.png', 100, 3);
INSERT INTO `product` VALUES (89, 'Private Perfume Rose Taif', 'Parour', 'Female', 'America', 'Eau de parfum', '100 ml', 'L\'Eau de Parfum ROSE TAÏF&VANILLE is inspired by Taïf - the heart of an Eastern oasis in the Mecca region of Saudi Arabia. The city of Taïf is often referred to as the city of roses because of the delicately scented flowers that grow in the deserts of thi', 144.70, 123.60, 'Sexy, elegant, seductive', 'http://localhost:8080/lab6_war_exploded/images/p8.png', 100, 3);
INSERT INTO `product` VALUES (90, 'Lomani Orchidée Sauvage', 'Parour', 'Female', 'America', 'Eau de parfum', '100 ml', 'The scent of timeless freshness. Sweet, elegant and delicate notes for confident and happy women in life. Lomani Orchidee Sauvage is like a flower in full bloom, representing the beauty and attractiveness of a happy woman.', 100.00, 98.99, 'Gentle, feminine, sweet, fresh', 'http://localhost:8080/lab6_war_exploded/images/l3.png', 100, 3);
INSERT INTO `product` VALUES (91, 'Lanvin Modern Princess', 'Lanvin', 'Female', 'France', 'Eau de parfum', '100 ml', 'N Convention Lanvin Modern Princess flowers  bring will think differently of women today come with her. Always seductive, sexy but hidden in it is free will, not bound by anyone or anything. Lanvin Modern Princess  has a passionate scent of fruity florals', 89.40, 85.00, 'Modern, Free, Sexy', 'http://localhost:8080/lab6_war_exploded/images/l4.png', 100, 7);
INSERT INTO `product` VALUES (92, 'Gucci Bloom Profumo Di Fiori', 'Gucci', 'Female', 'Italy', 'Eau de parfum', '100 ml', 'The famous perfume line of GUCCI BLOOM, which started with the first Gucci Bloom perfume line in 2017 once again stirs up the summer atmosphere in 2020 with the scent GUCCI BLOOM PROFUMO DI FIORI. The \"new face\" in paradise Gucci Bloom fascinates the nose', 75.50, 72.30, 'Gentle, Sophisticated, Feminine', 'http://localhost:8080/lab6_war_exploded/images/g1.png', 100, 6);
INSERT INTO `product` VALUES (93, 'Jean Paul Gaultier La Belle', 'Jean Paul Gaultier', 'Female', 'France', 'Eau de parfum', '100 ml', 'With a blue design like a lake in a mysterious garden, it is a place to quench all thirst and heat. It can be seen a mile away and we will be captivated by the sparkling rays of the sun emanating from the golden layer of this magical box.', 82.70, 80.00, 'Sexy, Feminine, Sexy', 'http://localhost:8080/lab6_war_exploded/images/j7.png', 100, 7);
INSERT INTO `product` VALUES (94, 'Jimmy Choo I Want Choo', 'Jimmy Choo', 'Female', 'England', 'Eau de parfum', '100 ml', 'Opening the magnificent 2021, Jimmy Choo launches a new perfume masterpiece called  I WANT CHOO . Flashy and bubbly, confident and seductive, I WANT CHOO is a jewel of the high end and the perfect embodiment of the Jimmy Choo woman.', 124.60, 122.00, 'Sexy, Feminine, Sweet', 'http://localhost:8080/lab6_war_exploded/images/j8.png', 100, 7);
INSERT INTO `product` VALUES (95, 'D&G Dolce Rose ', 'Dolce & Gabbana', 'Female', 'IDEA', 'Eau de toilette', '100 ml', 'In January 2021, Dolce & Gabbana presents the newest fragrance of the Dolce collection dedicated to celebrating the fragrance and beauty of the rose. Dolce Rose is red, crispy and fragrant; depicts a very optimistic and feminine woman. The Dolce collectio', 110.30, 103.70, 'Passionate, sexy, sophisticated', 'http://localhost:8080/lab6_war_exploded/images/dg3.png', 100, 5);
INSERT INTO `product` VALUES (96, 'Splendida Tubereuse Mystique', 'Bvlgari', 'Female', 'IDEA', 'Eau de parfum', '100 ml', 'Splendida Tubereuse Mystique, represents the theme of the mystical and enchanting lily. Perfumer Sophie Labbé imagined the image of a white lily in the twilight, in order to express the strong character of this flower. Splendida Tubereuse Mystique is comb', 154.30, 150.00, 'Mysterious, Sexy, Attractive', 'http://localhost:8080/lab6_war_exploded/images/s3.png', 100, 7);
INSERT INTO `product` VALUES (97, 'Rose Goldea Kathleen Kye', 'Bvlgari', 'Female', 'IDEA', 'Eau de parfum', '100 ml', 'Rose Goldea is an unprecedented tribute to femininity that combines radiant rose and sophisticated musk into a blend imbued with desire. This new year, Bvlgari Rose Goldea launches a new limited edition in collaboration with Korea\'s most influential young', 110.00, 99.90, 'Modern, feminine, seductive', 'http://localhost:8080/lab6_war_exploded/images/r4.png', 99, 7);
INSERT INTO `product` VALUES (98, 'CK Euphoria Blush', 'Calvin Klein', 'Female', 'America', 'Eau de parfum', '100 ml', 'Euphoria Blush is the latest scent of the CK Euphoria line, launched by Calvin Klein in 2020. Inspired by the temptation of love, Euphoria Blush is considered an enchanting fragrance. and charm for girls. The fresh floral scent evokes passionate desires, ', 103.70, 100.00, 'Sexy, Fresh, Sophisticated', 'http://localhost:8080/lab6_war_exploded/images/c13.png', 100, 7);
INSERT INTO `product` VALUES (99, 'Gucci Bloom Ambrosia Di Fiori', 'Gucci', 'Female', 'IDEA', 'Eau de parfum', '100 ml', 'This is the latest Ambrosia di Fiori 2019 version of the hit Serious Bloom, with the presence of Damasc rose - the most fragrant rose in the world, mixed with Indian white lily, purple iris of Tuscan region, and young jasmine buds green, committed to bein', 126.50, 125.00, 'Glamor, Luxury', 'http://localhost:8080/lab6_war_exploded/images/g2.png', 99, 6);
INSERT INTO `product` VALUES (100, 'Jean Paul Gaultier Classique', 'Jean Paul Gaultier', 'Female', 'France', 'Eau de parfum', '100 ml', '\"I call this girl a dream, because she\'s too beautiful to be real.\" Perfume Jean Paul Gaultier Classique is the work of Firmenich, Jacques Cavallier. Jean Paul Gaultier Classique is an exotic perfume blend, bringing a clean feeling of pungent and powdery ', 147.50, 140.20, 'Sweet, Seductive, Sexy', 'http://localhost:8080/lab6_war_exploded/images/j9.png', 100, 7);
INSERT INTO `product` VALUES (101, 'Gucci Guilty', 'Gucci', 'Male', 'Italia', 'Eau de parfum', '100 ml', 'The new version of the Gucci Guilty fragrance line is improved to bring an intense version based on the masculine scent of Gucci Guilty Pour Homme. Celebrating the freedom the brand pursues through the #ForeverGuilty story, Gucci Guilty Pour Homme Eau de ', 120.00, 106.00, 'Charming, Attractive, Outstanding', 'http://localhost:8080/lab6_war_exploded/images/g11.png', 100, 6);
INSERT INTO `product` VALUES (102, 'Gucci Guilty Love', 'Gucci', 'Male', 'Italia', 'Eau de toilette', '100 ml', '\r\n“Gucci Guilty Love” this “guilty love” makes you move from curiosity, to excitement and finally to wanting to clearly feel each fragrance crystal working on your skin. This scent has absolutely no presence of Wood, so what remain', 113.00, 100.00, 'Masculine, Attractive, Generous', 'http://localhost:8080/lab6_war_exploded/images/g12.png', 100, 6);
INSERT INTO `product` VALUES (103, 'Gucci Guilty Absolute', 'Gucci', 'Male', 'Italia', 'Eau de toilette', '100 ml', '\r\nThe world famous fashion brand Gucci introduced a new men\'s fragrance called Gucci Guilty Absolute in early 2017. This new product line is the result of a quite good collaboration of Gucci creative director Alessandro and perfume', 98.00, 90.00, 'Elegant, charismatic, brave, confident', 'http://localhost:8080/lab6_war_exploded/images/g13.png', 100, 6);
INSERT INTO `product` VALUES (104, 'Gucci Guilty Eau', 'Gucci', 'Male', 'Italia', 'Eau de toilette', '100 ml', 'Gucci was founded by Guccio Gucci in 1921. The company\'s first fragrance: Gucci No. 1 for women, introduced in 1974. A range of fragrances for men and women have been launched since then, with a legendary status among perfume collectors, including Gucci 3', 146.00, 125.00, 'Masculine, elegant, seductive.', 'http://localhost:8080/lab6_war_exploded/images/g14.png', 100, 6);
INSERT INTO `product` VALUES (105, 'Gucci Guilty', 'Gucci', 'Male', 'Italia', 'Eau de toilette', '100 ml', 'Gucci Guilty pour Homme is specially designed for those who know and get what they want. With their seductive and provocative fragrance, they are like a magnet that attracts all eyes and captivates the ladies. The perfume was launched in 2011 and the crea', 132.00, 130.00, 'Attractive, masculine, seductive.', 'http://localhost:8080/lab6_war_exploded/images/g15.png', 100, 6);
INSERT INTO `product` VALUES (106, 'Gucci Made To Measure', 'Gucci', 'Male', 'Italia', 'Eau de toilette', '100 ml', 'Gucci has launched a new fragrance Made to Measure for men in fall 2013. It was created for the man \"of the times and tempered to ask for the best\". The scent is a companion to the feminine fragrance Gucci Premiere from 2012.', 124.50, 117.00, 'Elegant, masculine, strong.', 'http://localhost:8080/lab6_war_exploded/images/g16.png', 100, 6);
INSERT INTO `product` VALUES (107, 'Gucci Guilty Black', 'Gucci', 'Male', 'Italia', 'Eau de toilette', '100 ml', 'Gucci Guilty Black has been heralded as the seductive scent of the 21st century. Awarded the daring fragrance of the worldwide perfumery awards. And 2013 follows a new chapter for this product line. Gucci Guilty Black Pour Homme has appeared in the dark, ', 140.80, 140.00, 'Luxurious, elegant, bold, mixing classic and modern.', 'http://localhost:8080/lab6_war_exploded/images/g17.png', 100, 6);
INSERT INTO `product` VALUES (108, 'Gucci Guilty Pour Homme', 'Gucci', 'Male', 'Italia', 'Eau de toilette', '100 ml', 'Gucci Guilty pour Homme is specially designed for those who know and get what they want. With their seductive and provocative fragrance, they are like a magnet that attracts all eyes and captivates the ladies. The perfume was launched in 2011 and the crea', 215.60, 210.00, 'Young, sexy, masculine', 'http://localhost:8080/lab6_war_exploded/images/g18.png', 100, 6);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (0, 'Is Customer');
INSERT INTO `role` VALUES (1, 'Is Admin');

-- ----------------------------
-- Table structure for status_account
-- ----------------------------
DROP TABLE IF EXISTS `status_account`;
CREATE TABLE `status_account`  (
  `sa_id` int NOT NULL,
  `sa_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sa_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status_account
-- ----------------------------
INSERT INTO `status_account` VALUES (0, 'Not Activated');
INSERT INTO `status_account` VALUES (1, 'Activated');
INSERT INTO `status_account` VALUES (2, 'Disable');

-- ----------------------------
-- Table structure for status_orders
-- ----------------------------
DROP TABLE IF EXISTS `status_orders`;
CREATE TABLE `status_orders`  (
  `sid` int NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status_orders
-- ----------------------------
INSERT INTO `status_orders` VALUES (1, 'Pending');
INSERT INTO `status_orders` VALUES (2, 'Collected');
INSERT INTO `status_orders` VALUES (3, 'Shipped');
INSERT INTO `status_orders` VALUES (4, 'Delivered');
INSERT INTO `status_orders` VALUES (5, 'Cancelled');

SET FOREIGN_KEY_CHECKS = 1;
