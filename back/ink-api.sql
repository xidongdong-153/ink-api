/*
 Navicat Premium Data Transfer

 Source Server         : Ink-API
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : localhost:3306
 Source Schema         : ink-api

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 11/03/2024 16:48:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for content_categories
-- ----------------------------
DROP TABLE IF EXISTS `content_categories`;
CREATE TABLE `content_categories` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `customOrder` int NOT NULL DEFAULT '0' COMMENT '分类排序',
  `mpath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `parentId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_d6aaf8517ca57297a8c3a44d3d` (`name`),
  KEY `FK_a03aea27707893300382b6f18ae` (`parentId`),
  CONSTRAINT `FK_a03aea27707893300382b6f18ae` FOREIGN KEY (`parentId`) REFERENCES `content_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content_categories
-- ----------------------------
BEGIN;
INSERT INTO `content_categories` (`id`, `name`, `customOrder`, `mpath`, `parentId`) VALUES ('2791f357-9433-40c5-a873-fad407b2afb0', '编程开发', 0, '596d0eec-7547-4d56-82a4-db39373f6b48.2791f357-9433-40c5-a873-fad407b2afb0.', '596d0eec-7547-4d56-82a4-db39373f6b48');
INSERT INTO `content_categories` (`id`, `name`, `customOrder`, `mpath`, `parentId`) VALUES ('596d0eec-7547-4d56-82a4-db39373f6b48', '技术文档', 1, '596d0eec-7547-4d56-82a4-db39373f6b48.', NULL);
INSERT INTO `content_categories` (`id`, `name`, `customOrder`, `mpath`, `parentId`) VALUES ('5afc40c0-b36f-4a9d-83e9-8916e7b9cb89', '部署运维', 1, '596d0eec-7547-4d56-82a4-db39373f6b48.5afc40c0-b36f-4a9d-83e9-8916e7b9cb89.', '596d0eec-7547-4d56-82a4-db39373f6b48');
INSERT INTO `content_categories` (`id`, `name`, `customOrder`, `mpath`, `parentId`) VALUES ('772ca6eb-e7cf-4d23-befd-080d781ae40f', '后端', 1, '596d0eec-7547-4d56-82a4-db39373f6b48.2791f357-9433-40c5-a873-fad407b2afb0.772ca6eb-e7cf-4d23-befd-080d781ae40f.', '2791f357-9433-40c5-a873-fad407b2afb0');
INSERT INTO `content_categories` (`id`, `name`, `customOrder`, `mpath`, `parentId`) VALUES ('c3d43cac-698b-47c8-ba28-974c963c5cd7', '开源推荐', 2, 'c3d43cac-698b-47c8-ba28-974c963c5cd7.', NULL);
INSERT INTO `content_categories` (`id`, `name`, `customOrder`, `mpath`, `parentId`) VALUES ('cb0d8764-a096-4be5-9b54-8994bf8db1f3', '前端', 0, '596d0eec-7547-4d56-82a4-db39373f6b48.2791f357-9433-40c5-a873-fad407b2afb0.cb0d8764-a096-4be5-9b54-8994bf8db1f3.', '2791f357-9433-40c5-a873-fad407b2afb0');
INSERT INTO `content_categories` (`id`, `name`, `customOrder`, `mpath`, `parentId`) VALUES ('fa400205-4074-446c-93f7-cd949a76a6fd', '随心笔记', 0, 'fa400205-4074-446c-93f7-cd949a76a6fd.', NULL);
COMMIT;

-- ----------------------------
-- Table structure for content_comments
-- ----------------------------
DROP TABLE IF EXISTS `content_comments`;
CREATE TABLE `content_comments` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `mpath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `parentId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `postId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_982a849f676860e5d6beb607f20` (`parentId`),
  KEY `FK_5e1c3747a0031f305e94493361f` (`postId`),
  CONSTRAINT `FK_5e1c3747a0031f305e94493361f` FOREIGN KEY (`postId`) REFERENCES `content_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_982a849f676860e5d6beb607f20` FOREIGN KEY (`parentId`) REFERENCES `content_comments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content_comments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for content_posts
-- ----------------------------
DROP TABLE IF EXISTS `content_posts`;
CREATE TABLE `content_posts` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标题',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文章描述',
  `keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '关键字',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'markdown' COMMENT '文章类型',
  `publishedAt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发布时间',
  `customOrder` int NOT NULL DEFAULT '0' COMMENT '自定义文章排序',
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `deletedAt` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `categoryId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4027367881933f659d02f367e92` (`categoryId`),
  CONSTRAINT `FK_4027367881933f659d02f367e92` FOREIGN KEY (`categoryId`) REFERENCES `content_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content_posts
-- ----------------------------
BEGIN;
INSERT INTO `content_posts` (`id`, `title`, `body`, `summary`, `keywords`, `type`, `publishedAt`, `customOrder`, `createdAt`, `updatedAt`, `deletedAt`, `categoryId`) VALUES ('b12e72ef-e752-4bb8-b6d9-6ae27efbccc3', 'meili 搜索', 'meili 全文搜索', NULL, NULL, 'markdown', NULL, 0, '2024-03-11 03:13:41.290355', '2024-03-11 03:13:41.290355', NULL, '596d0eec-7547-4d56-82a4-db39373f6b48');
INSERT INTO `content_posts` (`id`, `title`, `body`, `summary`, `keywords`, `type`, `publishedAt`, `customOrder`, `createdAt`, `updatedAt`, `deletedAt`, `categoryId`) VALUES ('df353333-72bf-4174-9281-1f25a6469627', 'mysql 搜索', 'mysql 全文搜索', NULL, NULL, 'markdown', NULL, 0, '2024-03-11 08:37:45.424440', '2024-03-11 08:37:45.424440', NULL, '596d0eec-7547-4d56-82a4-db39373f6b48');
COMMIT;

-- ----------------------------
-- Table structure for content_posts_tags_content_tags
-- ----------------------------
DROP TABLE IF EXISTS `content_posts_tags_content_tags`;
CREATE TABLE `content_posts_tags_content_tags` (
  `contentPostsId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contentTagsId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`contentPostsId`,`contentTagsId`),
  KEY `IDX_1e8c41827d0d509e70de1f6b70` (`contentPostsId`),
  KEY `IDX_888e6754015ee17f9e22faae57` (`contentTagsId`),
  CONSTRAINT `FK_1e8c41827d0d509e70de1f6b70e` FOREIGN KEY (`contentPostsId`) REFERENCES `content_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_888e6754015ee17f9e22faae578` FOREIGN KEY (`contentTagsId`) REFERENCES `content_tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content_posts_tags_content_tags
-- ----------------------------
BEGIN;
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('b12e72ef-e752-4bb8-b6d9-6ae27efbccc3', '509e5531-2baa-45b9-ab35-d1de274d74c5');
INSERT INTO `content_posts_tags_content_tags` (`contentPostsId`, `contentTagsId`) VALUES ('df353333-72bf-4174-9281-1f25a6469627', '509e5531-2baa-45b9-ab35-d1de274d74c5');
COMMIT;

-- ----------------------------
-- Table structure for content_tags
-- ----------------------------
DROP TABLE IF EXISTS `content_tags`;
CREATE TABLE `content_tags` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_6f504a08a58010e15c55b1eb23` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content_tags
-- ----------------------------
BEGIN;
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('17a46668-d492-44f7-ab27-de3410a08348', 'linux', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('2ce734c7-9367-444a-8fd4-2296ee49020d', 'react', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('509e5531-2baa-45b9-ab35-d1de274d74c5', 'node.js', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('57353e3d-d40e-40d9-a4c8-2dfd22a7df5f', 'laravel', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('592df60c-5a06-4ef6-bb2f-7af2fc82d784', 'nextjs', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('6845accc-0929-4b3a-ade0-22ae2ae4a9b1', 'typeorm', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('74560955-2022-4e7c-8655-c7f4f5a00c29', 'electron', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('7d58543d-ecc0-43f7-96ae-2f07c30e3bd9', 'prisma', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('8771a972-728d-4e00-9640-f0c65c35106f', 'symfony', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('b2b1590f-c8a6-4d8e-a30b-c95b7ae5cd4d', 'nestjs', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('b375946b-d42d-4f5e-9ed9-bf220ef64231', 'php', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('c60f050f-af4a-43f3-a2b6-7f474681c177', 'react native', NULL);
INSERT INTO `content_tags` (`id`, `name`, `description`) VALUES ('ef448996-8c4e-4365-a255-c195afd66365', 'drizzle', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
