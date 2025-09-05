   -- Bảng người dùng
   CREATE TABLE users (
       id BIGINT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       email VARCHAR(150) NOT NULL UNIQUE,
       password VARCHAR(255) NOT NULL,
       role VARCHAR(50) DEFAULT 'USER',
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
   );

   -- Bảng bài viết
   CREATE TABLE posts (
       id BIGINT AUTO_INCREMENT PRIMARY KEY,
       title VARCHAR(200) NOT NULL,
       content TEXT NOT NULL,
       author_id BIGINT NOT NULL,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
       CONSTRAINT fk_posts_author FOREIGN KEY (author_id) REFERENCES users(id)
           ON DELETE CASCADE ON UPDATE CASCADE
   );

   -- Bảng bình luận
   CREATE TABLE comments (
       id BIGINT AUTO_INCREMENT PRIMARY KEY,
       content TEXT NOT NULL,
       post_id BIGINT NOT NULL,
       user_id BIGINT NOT NULL,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       CONSTRAINT fk_comments_post FOREIGN KEY (post_id) REFERENCES posts(id)
           ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fk_comments_user FOREIGN KEY (user_id) REFERENCES users(id)
           ON DELETE CASCADE ON UPDATE CASCADE
   );
