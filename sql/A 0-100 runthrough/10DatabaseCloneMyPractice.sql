-- Database Clone
create database ig_info;

create table users(
	id int AUTO_INCREMENT primary key,
    username varchar(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
    );

create table comments(
	id int AUTO_INCREMENT primary key,
    content varchar(255) NOT NULL,
    created_at TIMESTAMP default now(),
    user_id INT NOT NULL,
    post_id int NOT NULL,
    foreign key (post_id) references post.id,
    foreign key (user_id) references users(id)
    );

create table posts(
	id int AUTO_INCREMENT primary key,
    created_at datetime default now(),
    user_id INT NOT NULL,
    image BLOB,
    caption varchar(255),
    file_size decimal(15,2),
    FOREIGN KEY (user_id) REFERENCES users(id)
    );

create table likes(
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    comment_id int,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

create table hashtags(
	id int AUTO_INCREMENT primary key,
	tag_name VARCHAR(255) UNIQUE,
	created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

create table followers(
    follower_id varchar(255),
    following_id varchar(255),
    foreign key (follower_id) references users(id),
    foreign key (following_id) references users(id)
    );
    