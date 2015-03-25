CREATE TABLE `olx_users` (
    idUser INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    pass VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(10) NOT NULL
);

CREATE TABLE `olx_categories` (
    idCat INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    cat_name VARCHAR(30) NOT NULL
);

CREATE TABLE `olx_subCategories` (
    
    idSub INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    idCat INT NOT NULL,
    sub_name VARCHAR(30) NOT NULL
);

CREATE TABLE `olx_posts` (
    idPost INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    idUser INT NOT NULL,
    idSub INT NOT NULL,
    title VARCHAR(20) NOT NULL,    
    description text NOT NULL,
    price INT NOT NULL,     
    status INT(1) NOT NULL DEFAULT '1'
);
