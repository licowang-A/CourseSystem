/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : rainng_course

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 15/10/2021 10:05:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for rc_admin
-- ----------------------------
DROP TABLE IF EXISTS `rc_admin`;
CREATE TABLE `rc_admin`  (
  `admin_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_privilege` int NOT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE,
  UNIQUE INDEX `idx_admin_username`(`admin_username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_admin
-- ----------------------------
INSERT INTO `rc_admin` VALUES (1, 'admin', '123456', 255);
INSERT INTO `rc_admin` VALUES (2, 'admin2', '123456', 96);

-- ----------------------------
-- Table structure for rc_class
-- ----------------------------
DROP TABLE IF EXISTS `rc_class`;
CREATE TABLE `rc_class`  (
  `class_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `class_major_id` int UNSIGNED NOT NULL,
  `class_grade` int UNSIGNED NOT NULL,
  `class_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`class_id`) USING BTREE,
  INDEX `fk_major_id`(`class_major_id`) USING BTREE,
  INDEX `idx_class_name`(`class_name`) USING BTREE,
  CONSTRAINT `rc_class_ibfk_1` FOREIGN KEY (`class_major_id`) REFERENCES `rc_major` (`major_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_class
-- ----------------------------
INSERT INTO `rc_class` VALUES (1, 2, 2018, '软件工程');
INSERT INTO `rc_class` VALUES (2, 1, 2018, '数字媒体');
INSERT INTO `rc_class` VALUES (3, 4, 2018, '信息安全');
INSERT INTO `rc_class` VALUES (4, 5, 2017, '测试班级1');
INSERT INTO `rc_class` VALUES (5, 5, 2017, '测试班级2');
INSERT INTO `rc_class` VALUES (6, 5, 2017, '测试班级3');
INSERT INTO `rc_class` VALUES (7, 5, 2017, '测试班级4');
INSERT INTO `rc_class` VALUES (8, 5, 2017, '测试班级5');
INSERT INTO `rc_class` VALUES (9, 5, 2017, '测试班级6');
INSERT INTO `rc_class` VALUES (10, 5, 2017, '测试班级7');
INSERT INTO `rc_class` VALUES (11, 5, 2017, '测试班级8');
INSERT INTO `rc_class` VALUES (12, 5, 2017, '测试班级9');

-- ----------------------------
-- Table structure for rc_course
-- ----------------------------
DROP TABLE IF EXISTS `rc_course`;
CREATE TABLE `rc_course`  (
  `course_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_teacher_id` int UNSIGNED NOT NULL,
  `course_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_grade` int UNSIGNED NOT NULL,
  `course_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_location` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_credit` int UNSIGNED NOT NULL,
  `course_selected_count` int UNSIGNED NOT NULL DEFAULT 0,
  `course_max_size` int UNSIGNED NOT NULL,
  `course_exam_date` datetime NULL DEFAULT NULL,
  `course_exam_location` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`) USING BTREE,
  INDEX `fk_course_teacher_id`(`course_teacher_id`) USING BTREE,
  INDEX `idx_course_name`(`course_name`) USING BTREE,
  CONSTRAINT `rc_course_ibfk_1` FOREIGN KEY (`course_teacher_id`) REFERENCES `rc_teacher` (`teacher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_course
-- ----------------------------
INSERT INTO `rc_course` VALUES (1, 1, 'C语言程序设计', 2017, '1-1-2', '教学楼1', 5, 14, 50, NULL, NULL);
INSERT INTO `rc_course` VALUES (2, 1, 'Java程序设计', 2019, '1-3-2', '教学楼2', 4, 0, 30, NULL, NULL);
INSERT INTO `rc_course` VALUES (3, 1, '数据库实用技术', 2017, '2-3-2', '教学楼3', 2, 1, 50, NULL, NULL);
INSERT INTO `rc_course` VALUES (4, 1, '大数据开发与应用', 2018, '5-5-3', '教学楼1', 2, 1, 1, NULL, NULL);
INSERT INTO `rc_course` VALUES (5, 1, '软件体系设计', 2018, '3-9-2', '教学楼2', 3, 0, 10, NULL, NULL);
INSERT INTO `rc_course` VALUES (6, 3, '数据库概论', 2017, '3-1-2', '教学楼3', 5, 0, 40, NULL, NULL);
INSERT INTO `rc_course` VALUES (7, 3, '高等数学', 2018, '2-3-2', '教学楼4', 2, 0, 20, NULL, NULL);

-- ----------------------------
-- Table structure for rc_department
-- ----------------------------
DROP TABLE IF EXISTS `rc_department`;
CREATE TABLE `rc_department`  (
  `department_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_department
-- ----------------------------
INSERT INTO `rc_department` VALUES (1, '计算机系');
INSERT INTO `rc_department` VALUES (2, '数学系');
INSERT INTO `rc_department` VALUES (3, '物理系');
INSERT INTO `rc_department` VALUES (4, '化学系');
INSERT INTO `rc_department` VALUES (5, '测试系1');
INSERT INTO `rc_department` VALUES (6, '测试系2');
INSERT INTO `rc_department` VALUES (7, '测试系3');
INSERT INTO `rc_department` VALUES (8, '测试系4');
INSERT INTO `rc_department` VALUES (9, '测试系5');
INSERT INTO `rc_department` VALUES (10, '测试系6');
INSERT INTO `rc_department` VALUES (11, '测试系7');
INSERT INTO `rc_department` VALUES (12, '测试系8');
INSERT INTO `rc_department` VALUES (13, '测试系9');
INSERT INTO `rc_department` VALUES (14, '测试系10');
INSERT INTO `rc_department` VALUES (15, '临时系1');
INSERT INTO `rc_department` VALUES (16, '临时系2');
INSERT INTO `rc_department` VALUES (17, '临时系3');
INSERT INTO `rc_department` VALUES (18, '临时系4');
INSERT INTO `rc_department` VALUES (19, '临时系5');
INSERT INTO `rc_department` VALUES (20, '临时系6');
INSERT INTO `rc_department` VALUES (21, '临时系7');
INSERT INTO `rc_department` VALUES (22, '临时系8');
INSERT INTO `rc_department` VALUES (23, '临时系9');
INSERT INTO `rc_department` VALUES (24, '临时系10');
INSERT INTO `rc_department` VALUES (25, '演示系1');
INSERT INTO `rc_department` VALUES (26, '演示系2');
INSERT INTO `rc_department` VALUES (27, '演示系3');
INSERT INTO `rc_department` VALUES (28, '演示系4');
INSERT INTO `rc_department` VALUES (29, '演示系5');
INSERT INTO `rc_department` VALUES (30, '演示系6');
INSERT INTO `rc_department` VALUES (31, '演示系7');
INSERT INTO `rc_department` VALUES (32, '演示系8');
INSERT INTO `rc_department` VALUES (33, '演示系9');
INSERT INTO `rc_department` VALUES (34, '演示系10');
INSERT INTO `rc_department` VALUES (35, '演示系11');
INSERT INTO `rc_department` VALUES (36, '演示系12');
INSERT INTO `rc_department` VALUES (37, '演示系13');
INSERT INTO `rc_department` VALUES (38, '演示系14');
INSERT INTO `rc_department` VALUES (39, '演示系15');
INSERT INTO `rc_department` VALUES (40, '演示系16');
INSERT INTO `rc_department` VALUES (41, '演示系17');
INSERT INTO `rc_department` VALUES (42, '演示系18');
INSERT INTO `rc_department` VALUES (43, '演示系19');
INSERT INTO `rc_department` VALUES (46, '演示系');

-- ----------------------------
-- Table structure for rc_major
-- ----------------------------
DROP TABLE IF EXISTS `rc_major`;
CREATE TABLE `rc_major`  (
  `major_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `major_department_id` int UNSIGNED NOT NULL,
  `major_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`major_id`) USING BTREE,
  INDEX `fk_major_department_id`(`major_department_id`) USING BTREE,
  INDEX `idx_major_name`(`major_name`) USING BTREE,
  CONSTRAINT `rc_major_ibfk_1` FOREIGN KEY (`major_department_id`) REFERENCES `rc_department` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_major
-- ----------------------------
INSERT INTO `rc_major` VALUES (1, 1, '计算机科学与技术');
INSERT INTO `rc_major` VALUES (2, 1, '软件工程');
INSERT INTO `rc_major` VALUES (3, 1, '信息工程');
INSERT INTO `rc_major` VALUES (4, 2, '应用数学');
INSERT INTO `rc_major` VALUES (5, 2, '数学师范');
INSERT INTO `rc_major` VALUES (6, 5, '测试专业1');
INSERT INTO `rc_major` VALUES (7, 5, '测试专业2');
INSERT INTO `rc_major` VALUES (8, 5, '测试专业3');
INSERT INTO `rc_major` VALUES (9, 5, '测试专业4');
INSERT INTO `rc_major` VALUES (10, 5, '测试专业5');
INSERT INTO `rc_major` VALUES (11, 5, '测试专业6');
INSERT INTO `rc_major` VALUES (12, 5, '测试专业7');
INSERT INTO `rc_major` VALUES (13, 5, '测试专业8');
INSERT INTO `rc_major` VALUES (14, 5, '测试专业9');
INSERT INTO `rc_major` VALUES (15, 5, '测试专业10');
INSERT INTO `rc_major` VALUES (16, 6, '临时专业1');
INSERT INTO `rc_major` VALUES (17, 6, '临时专业2');
INSERT INTO `rc_major` VALUES (18, 6, '临时专业3');
INSERT INTO `rc_major` VALUES (19, 6, '临时专业4');
INSERT INTO `rc_major` VALUES (20, 6, '临时专业5');
INSERT INTO `rc_major` VALUES (21, 6, '临时专业6');
INSERT INTO `rc_major` VALUES (22, 6, '临时专业7');
INSERT INTO `rc_major` VALUES (23, 6, '临时专业8');
INSERT INTO `rc_major` VALUES (24, 6, '临时专业9');
INSERT INTO `rc_major` VALUES (25, 6, '临时专业10');
INSERT INTO `rc_major` VALUES (26, 7, '演示专业1');
INSERT INTO `rc_major` VALUES (27, 7, '演示专业2');
INSERT INTO `rc_major` VALUES (28, 7, '演示专业3');
INSERT INTO `rc_major` VALUES (29, 7, '演示专业4');
INSERT INTO `rc_major` VALUES (30, 7, '演示专业5');
INSERT INTO `rc_major` VALUES (31, 7, '演示专业6');
INSERT INTO `rc_major` VALUES (32, 7, '演示专业7');
INSERT INTO `rc_major` VALUES (33, 7, '演示专业8');
INSERT INTO `rc_major` VALUES (34, 7, '演示专业9');
INSERT INTO `rc_major` VALUES (35, 7, '演示专业10');
INSERT INTO `rc_major` VALUES (36, 7, '演示专业11');
INSERT INTO `rc_major` VALUES (37, 7, '演示专业12');
INSERT INTO `rc_major` VALUES (38, 7, '演示专业13');
INSERT INTO `rc_major` VALUES (39, 7, '演示专业14');
INSERT INTO `rc_major` VALUES (40, 7, '演示专业15');
INSERT INTO `rc_major` VALUES (41, 7, '演示专业16');
INSERT INTO `rc_major` VALUES (42, 7, '演示专业17');
INSERT INTO `rc_major` VALUES (43, 7, '演示专业18');
INSERT INTO `rc_major` VALUES (44, 7, '演示专业19');
INSERT INTO `rc_major` VALUES (46, 1, '计算机技术与科学');

-- ----------------------------
-- Table structure for rc_student
-- ----------------------------
DROP TABLE IF EXISTS `rc_student`;
CREATE TABLE `rc_student`  (
  `student_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_class_id` int UNSIGNED NOT NULL,
  `student_number` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student_password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `student_birthday` datetime NULL DEFAULT NULL,
  `student_sex` tinyint UNSIGNED NOT NULL,
  `student_last_login_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`) USING BTREE,
  UNIQUE INDEX `idx_student_number`(`student_number`) USING BTREE,
  INDEX `fk_student_class_id`(`student_class_id`) USING BTREE,
  INDEX `idx_student_name`(`student_name`) USING BTREE,
  CONSTRAINT `rc_student_ibfk_1` FOREIGN KEY (`student_class_id`) REFERENCES `rc_class` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_student
-- ----------------------------
INSERT INTO `rc_student` VALUES (1, 1, '20181120097', '刘珈彤', '123456', '1625214562@qq.com', '2000-07-18 00:00:00', 0, '2020-06-10 18:15:11');
INSERT INTO `rc_student` VALUES (3, 1, '0003', '李同学1', '123456', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (4, 1, '0004', '李同学2', '123456', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (5, 1, '0005', '李同学3', '123456', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (6, 1, '0006', '李同学4', '123456', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (7, 1, '0007', '李同学5', '123456', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (8, 1, '0008', '李同学6', '123456', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (9, 1, '0009', '李同学7', '123456', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (10, 1, '0010', '李同学8', '123456', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (11, 1, '0011', '李同学9', '123456', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (12, 1, '0012', '张同学1', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (13, 1, '0013', '张同学2', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (14, 1, '0014', '张同学3', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (15, 1, '0015', '张同学4', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (16, 1, '0016', '张同学5', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (17, 1, '0017', '张同学6', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (18, 1, '0018', '张同学7', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (19, 3, '0019', '王同学1', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (20, 3, '0020', '王同学2', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (21, 3, '0021', '王同学3', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (22, 3, '0022', '王同学4', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (23, 3, '0023', '王同学5', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (24, 3, '0024', '王同学6', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (25, 3, '0025', '王同学7', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (26, 3, '0026', '王同学8', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (27, 3, '0027', '王同学9', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (28, 3, '0028', '王同学10', '123456', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (35, 3, '123456789101', '刘', '', NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for rc_student_course
-- ----------------------------
DROP TABLE IF EXISTS `rc_student_course`;
CREATE TABLE `rc_student_course`  (
  `sc_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `sc_student_id` int UNSIGNED NOT NULL,
  `sc_course_id` int UNSIGNED NOT NULL,
  `sc_daily_score` int UNSIGNED NULL DEFAULT NULL,
  `sc_exam_score` int UNSIGNED NULL DEFAULT NULL,
  `sc_score` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`sc_id`) USING BTREE,
  INDEX `fk_sc_course_id`(`sc_course_id`) USING BTREE,
  INDEX `fk_sc_student_id`(`sc_student_id`) USING BTREE,
  CONSTRAINT `rc_student_course_ibfk_1` FOREIGN KEY (`sc_course_id`) REFERENCES `rc_course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rc_student_course_ibfk_2` FOREIGN KEY (`sc_student_id`) REFERENCES `rc_student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_student_course
-- ----------------------------
INSERT INTO `rc_student_course` VALUES (5, 5, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (6, 6, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (7, 7, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (8, 8, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (9, 9, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (10, 10, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (11, 11, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (12, 12, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (13, 13, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (14, 14, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (15, 15, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (16, 16, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (17, 17, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (18, 18, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (19, 1, 3, 98, 100, 99);
INSERT INTO `rc_student_course` VALUES (32, 1, 4, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for rc_teacher
-- ----------------------------
DROP TABLE IF EXISTS `rc_teacher`;
CREATE TABLE `rc_teacher`  (
  `teacher_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher_department_id` int UNSIGNED NOT NULL,
  `teacher_number` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`teacher_id`) USING BTREE,
  UNIQUE INDEX `idx_teacher_number`(`teacher_number`) USING BTREE,
  INDEX `fk_teacher_department_id`(`teacher_department_id`) USING BTREE,
  CONSTRAINT `rc_teacher_ibfk_1` FOREIGN KEY (`teacher_department_id`) REFERENCES `rc_department` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_teacher
-- ----------------------------
INSERT INTO `rc_teacher` VALUES (1, 1, '0001', '张三', '123456');
INSERT INTO `rc_teacher` VALUES (2, 3, '0002', '宋老师', '123456');
INSERT INTO `rc_teacher` VALUES (3, 1, '0003', '宋老师', '123456');
INSERT INTO `rc_teacher` VALUES (4, 1, '0004', '张老师', '123456');
INSERT INTO `rc_teacher` VALUES (5, 1, '0005', '吕老师', '123456');
INSERT INTO `rc_teacher` VALUES (6, 1, '0006', '王老师', '123456');
INSERT INTO `rc_teacher` VALUES (7, 1, '0007', '丁老师', '123456');
INSERT INTO `rc_teacher` VALUES (8, 1, '0008', '高老师', '123456');
INSERT INTO `rc_teacher` VALUES (9, 1, '0009', '赵老师', '123456');
INSERT INTO `rc_teacher` VALUES (12, 1, '123456789101', '张老师', '');

SET FOREIGN_KEY_CHECKS = 1;
