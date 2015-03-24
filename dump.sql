CREATE TABLE users if not exists (
    idUser INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    pass VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(10) NOT NULL
);

CREATE TABLE categories if not exists (
    idCat INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    cat_name VARCHAR(30) NOT NULL
);

CREATE TABLE subCategories if not exists (
    idSub INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    idCat INT NOT NULL,
    sub_name VARCHAR(30) NOT NULL
);

CREATE TABLE posts if not exists (
    idPost INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    idUser INT NOT NULL,
    idSub INT NOT NULL,
    title VARCHAR(20) NOT NULL    
    description TEXT NOT NULL,
    price INT NOT NULL,     
    status INT(1) NOT NULL DEFAULT '1'
);
