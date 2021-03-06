Create Table SUSER (
		UserID VARCHAR2(10) PRIMARY KEY,
		Sex VARCHAR2(15),
		Age VARCHAR2(3),
		Loc VARCHAR2(50)
);
Create Table SSEARCH (
		Text VARCHAR2(75) NOT NULL,
		Engine VARCHAR2(20),
		SearchID VARCHAR2(15) PRIMARY KEY,
		KeyWord VARCHAR2(75)
);
Create Table LIKELYTO (
        UserID VARCHAR2(10),
		LSex VARCHAR2(15),
    	LAge VARCHAR2(3),
		LLoc VARCHAR2(50),
		LText VARCHAR2(75),
		LEngine VARCHAR2(20),
		SearchID VARCHAR2(15),
        LKeyWord VARCHAR2(75),
		PRIMARY KEY (UserID, SearchID)
);
INSERT INTO LIKELYTO (select * from SUSER CROSS JOIN SSEARCH);
Create Table WEIGHT (
		Weight VARCHAR(3)
);
Create Table HISTORY (
		HID VARCHAR2(15) PRIMARY KEY,
		hDate VARCHAR2(10)
);
Create Table RESULTS (
		ReturnedKey VARCHAR2(50),
		Title VARCHAR2(75),
		SRank INT
);
Create Table SUGGESTION (
		HID VARCHAR2(15),
		ReturnedKey VARCHAR2(50),
		Title VARCHAR2(75),
		SRank INT,
        UNIQUE(HID, SRank)
);
INSERT INTO SUGGESTION (select * from HISTORY CROSS JOIN RESULTS);
Create Table COMPANY (
		Title VARCHAR2(75) PRIMARY KEY,
		Industry VARCHAR2(75),
		Sector VARCHAR2(75)
);



\



Create Table SUSER (
		UserID VARCHAR2(10) PRIMARY KEY,
		Sex VARCHAR2(15),
		Age VARCHAR2(3),
		Loc VARCHAR2(50)
);

Create Table SSEARCH (
		Text VARCHAR2(75) NOT NULL,
		Engine VARCHAR2(20),
		SearchID VARCHAR2(15) PRIMARY KEY,
		KeyWord VARCHAR2(75)
);

Create Table HISTORY (
		HID VARCHAR2(15) PRIMARY KEY,
		hDate VARCHAR2(10),
		UserID VARCHAR2(10) REFERENCES SUSER,
		SearchID VARCHAR(15) REFERENCES SSEARCH,
		UNIQUE KEY (SearchID, UserID)
);

Create Table LIKELYTO (
		Weight VARCHAR(3),
      	UserID VARCHAR2(15) REFERENCES SUSER,
		SearchID VARCHAR2(15) REFERENCES SSEARCH,
		PRIMARY KEY (UserID, SearchID)
);

Create Table SUGGESTION (
		HID VARCHAR2(15),
		ReturnedKey VARCHAR2(50),
		Title VARCHAR2(75) NOT NULL,
		SRank INT,
		FOREIGN KEY(HID) REFERENCES HISTORY(HID) ON DELETE CASCADE
		PRIMARY KEY(HID, SRank)
);

Create Table COMPANY (
		Name VARCHAR2(75) PRIMARY KEY,
		Industry VARCHAR2(75),
		Sector VARCHAR2(75)
);

Create Table RELATEDTO (
		PaidAd CHAR(1),
		HID VARCHAR2(15),
		Name VARCHAR2(75) REFERENCES COMPANY(Name),
		SRank INT,
		FOREIGN KEY(HID,SRank) REFERENCES SUGGESTION,
		PRIMARY KEY (Name, HID, SRank)
);

Create Table TARGETS (
		Name VARCHAR2(75) REFERENCES COMPANY (Name),
		UserID VARCHAR2(10) REFERENCES SUSER (UserID),
		PRIMARY KEY (Name, UserID)
);
