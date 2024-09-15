--Student ID - 2873826
--Date of Birth - 2 October 2001 
--Question - 2

--all the IDs are given the VARCHAR data type as the ID may contain alphabets, numbers, as well as special characters like underscores, and is of variable length - e.g. P06213_23, or ENSG00000074803, or 600839, or DB00152.
--the only ID given an integer type is the researcher ID; since this is a database for one research group, the researcher ID may be stored as an integer. 

--table for protein entity
CREATE TABLE Proteins (
	ProteinID VARCHAR(75) NOT NULL,
	Name VARCHAR(255) NOT NULL,
	Structure VARCHAR(255) NOT NULL,
	Function VARCHAR(255) NOT NULL,
	GeneID VARCHAR(75) NOT NULL,
	PRIMARY KEY (ProteinID),
	FOREIGN KEY (GeneID) REFERENCES Genes(GeneID)
);

--table for genes entity
CREATE TABLE Genes (
	GeneID VARCHAR(75) NOT NULL,
	Name VARCHAR(255) NOT NULL,
	Chromosome VARCHAR(255) NOT NULL,
	Location VARCHAR(255) NOT NULL,
	Sequence VARCHAR(10000) NOT NULL,
	DiseaseID VARCHAR(75) NOT NULL,
	PRIMARY KEY (GeneID),
	FOREIGN KEY (DiseaseID) REFERENCES Diseases(DiseaseID)
);

--table for diseases entity
CREATE TABLE Diseases (
	DiseaseID VARCHAR(75) NOT NULL,
	Severity VARCHAR(255) NOT NULL,
	Name VARCHAR(255) NOT NULL,
	Symptoms VARCHAR(255) NOT NULL,
	PRIMARY KEY (DiseaseID)
);

--table for researchers entity
CREATE TABLE Researchers (
	ResearcherID INT NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	Affiliation VARCHAR(255) NOT NULL,
	ResearchArea VARCHAR(255) NOT NULL,
	PRIMARY KEY (ResearcherID)
);

--table for 'study' relationship
CREATE TABLE Study (
	DiseaseID VARCHAR(75) NOT NULL,
	ResearcherID INT NOT NULL,
	Publications VARCHAR(255) NOT NULL,
	PRIMARY KEY (DiseaseID, ResearcherID),
	FOREIGN KEY (DiseaseID) REFERENCES Diseases(DiseaseID),
	FOREIGN KEY (ResearcherID) REFERENCES Researchers(ResearcherID)
);