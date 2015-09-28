/* The root user table. */
CREATE TABLE UserInfo (
UserID BIGINT PRIMARY KEY AUTO_INCREMENT,
Email VARCHAR(200) UNIQUE,
PhoneNumber VARCHAR(200) UNIQUE,
WechatID VARCHAR(200) UNIQUE,
WeboID VARCHAR(200) UNIQUE,
HashedPassword VARCHAR(300) NOT NULL,
IsConfirm TINYINT NOT NULL,
IsActive TINYINT NOT NULL,
Name VARCHAR(300) NOT NULL,
ImageURL VARCHAR(200),
Area BIGINT NOT NULL,
OtherArea VARCHAR(300),
School BIGINT NOT NULL,
OtherSchool VARCHAR(300),
Company BIGINT NOT NULL,
OtherCompany VARCHAR(300),
SelfDescription VARCHAR(3000)
);

/* Role & Skill tables. */
CREATE TABLE RoleFirstCategory (
FirstCategoryID BIGINT PRIMARY KEY AUTO_INCREMENT,
UserID BIGINT NOT NULL,
FirstCategory BIGINT NOT NULL,

FOREIGN KEY (UserID) REFERENCES UserInfo(UserID)
ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE RoleSecondCategory (
SecondCategoryID BIGINT PRIMARY KEY AUTO_INCREMENT,
FirstCategoryID BIGINT NOT NULL,
SecondCategory BIGINT NOT NULL,

FOREIGN KEY (FirstCategoryID) REFERENCES RoleFirstCategory(FirstCategoryID)
ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE Skill (
SkillID BIGINT PRIMARY KEY AUTO_INCREMENT,
FirstCategoryID BIGINT NOT NULL,
Skill VARCHAR(300) NOT NULL,

FOREIGN KEY (FirstCategoryID) REFERENCES RoleFirstCategory(FirstCategoryID)
ON DELETE CASCADE ON UPDATE NO ACTION
);

/* Project tables. */
CREATE TABLE ProjectInfo (
ProjectID BIGINT PRIMARY KEY AUTO_INCREMENT,
UserID BIGINT NOT NULL,
Name VARCHAR(300) NOT NULL,
ProjectType BIGINT NOT NULL,
URL VARCHAR(200),
Position VARCHAR(300),
StartDate DATE,
EndDate DATE,
Description VARCHAR(3000),

FOREIGN KEY (UserID) REFERENCES UserInfo(UserID)
ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE ProjectPartner (
PartnerID BIGINT PRIMARY KEY AUTO_INCREMENT,
ProjectID BIGINT NOT NULL,
UserID BIGINT,
Name VARCHAR(300),

FOREIGN KEY (ProjectID) REFERENCES ProjectInfo(ProjectID)
ON DELETE CASCADE ON UPDATE NO ACTION,
FOREIGN KEY (UserID) REFERENCES UserInfo(UserID)
ON DELETE NO ACTION ON UPDATE NO ACTION
);

/* Relationship tables. */
CREATE TABLE FriendShip (
RelationID BIGINT PRIMARY KEY AUTO_INCREMENT,
UserID BIGINT NOT NULL,
FriendID BIGINT NOT NULL,

FOREIGN KEY (UserID) REFERENCES UserInfo(UserID)
ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (FriendID) REFERENCES UserInfo(UserID)
ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE FriendTag (
TagID BIGINT PRIMARY KEY AUTO_INCREMENT,
RelationID BIGINT NOT NULL,
Tag VARCHAR(300) NOT NULL,

FOREIGN KEY (RelationID) REFERENCES FriendShip(RelationID)
ON DELETE CASCADE ON UPDATE NO ACTION
);
