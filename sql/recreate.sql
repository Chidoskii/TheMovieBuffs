DROP TABLE IF EXISTS Ratings;
DROP TABLE IF EXISTS List_Items;
DROP TABLE IF EXISTS Lists;
DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS Followers;
DROP TABLE IF EXISTS ProfileChanges; 
DROP TABLE IF EXISTS ProfileHistory;
DROP TABLE IF EXISTS User;

CREATE TABLE User(
    userID int NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    fname VARCHAR(255) DEFAULT NULL,
    lname VARCHAR(255) DEFAULT NULL,
    dob DATE DEFAULT NULL,
    adminn BOOLEAN DEFAULT 0,
    dname VARCHAR(255) DEFAULT NULL,
    avatar VARCHAR(255) DEFAULT NULL, 
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Primary Key(userID)
);

CREATE TABLE Followers(
    u_ID INT NOT NULL,
    follower_ID INT NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (u_ID, follower_ID),
    FOREIGN KEY (u_ID) REFERENCES User(userID)
    ON UPDATE CASCADE ON DELETE CASCADE, 
    FOREIGN KEY (follower_ID) REFERENCES User(userID)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Reviews (
    u_ID INT NOT NULL,
    mID INT NOT NULL,
    critique TEXT NOT NULL,
    NOD boolean DEFAULT 0,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (u_ID, mID),
    FOREIGN KEY (u_ID) REFERENCES User(userID)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Lists (
    listID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    u_ID INT NOT NULL, 
    listName VARCHAR(255) NOT NULL,
    ltype VARCHAR(255) NOT NULL, 
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (u_ID) REFERENCES User(userID)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE List_Items (
    lID INT NOT NULL,
    mID INT NOT NULL, 
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (lID, mID),
    FOREIGN KEY (lID) REFERENCES Lists(listID)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Ratings (
    mID INT NOT NULL,
    uID INT NOT NULL,
    rating DECIMAL(2,1) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (uID, mID),
    FOREIGN KEY (uID) REFERENCES User(userID)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE ProfileChanges(
    uID INT NOT NULL,
    changeType VARCHAR(255),
    oldValue TEXT,
    newValue TEXT,
    changeDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ProfileHistory (
    uID INT NOT NULL,
    deletedUsername VARCHAR(255),
    deletedfname VARCHAR(255) DEFAULT NULL,
    deletedlname VARCHAR(255) DEFAULT NULL,
    deleteddob DATE DEFAULT NULL,
    deleteDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
