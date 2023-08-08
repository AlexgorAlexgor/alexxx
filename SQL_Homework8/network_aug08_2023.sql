CREATE TABLE `Users` (
  `user_id` integer PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp,
  `username` varchar(64) UNIQUE,
  `email` varchar(256) UNIQUE,
  `phone` varchar(64) UNIQUE,
  `avatar_image` varchar(2048)
);

CREATE TABLE `Posts` (
  `post_id` integer PRIMARY KEY AUTO_INCREMENT,
  `author_id` integer,
  `image` varchar(2048),
  `alt` varchar(2048),
  `description` varchar(2048)
);

CREATE TABLE `Comments` (
  `comment_id` integer PRIMARY KEY AUTO_INCREMENT,
  `author_id` integer,
  `post_id` integer,
  `content` varchar(2048)
);

CREATE TABLE `Reactions` (
  `created_at` timestamp,
  `comment_id` integer,
  `content` varchar(2048)
);

CREATE TABLE `Chats` (
  `chat_id` integer PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp,
  `user_id` integer,
  `username` varchar(64) UNIQUE,
  `content` varchar(2048)
);

CREATE TABLE `Messages` (
  `messages_id` integer PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp,
  `user__id` integer,
  `content` varchar(2048)
);

CREATE TABLE `Friendship` (
  `user_id` integer PRIMARY KEY,
  `created_at` timestamp
);

ALTER TABLE `Posts` ADD FOREIGN KEY (`author_id`) REFERENCES `Users` (`user_id`);

ALTER TABLE `Comments` ADD FOREIGN KEY (`author_id`) REFERENCES `Users` (`user_id`);

ALTER TABLE `Comments` ADD FOREIGN KEY (`post_id`) REFERENCES `Posts` (`post_id`);

ALTER TABLE `Reactions` ADD FOREIGN KEY (`comment_id`) REFERENCES `Comments` (`comment_id`);

ALTER TABLE `Chats` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

ALTER TABLE `Messages` ADD FOREIGN KEY (`user__id`) REFERENCES `Users` (`user_id`);

ALTER TABLE `Friendship` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);
