CREATE TABLE Sportifs(
  IdSportif INT,
  Nom VARCHAR2(50),
  Prenom VARCHAR2(50),
  Sexe VARCHAR2(1),
  Age INT,
  IdSportifConseiller INT,
  constraint ck_sexe check (sexe in ('M','F')),
  constraint pk_Sportifs primary key(IdSportif),
  constraint fk_Conseiller foreign key(IdSportifConseiller) references Sportifs(IdSportif) on delete cascade);

CREATE TABLE Sports(
  IdSport INT,
  Libelle VARCHAR2(30),
  constraint pk_Sports primary key(IdSport));

CREATE TABLE Gymnases(
  IdGymnase INT,
  NomGymnase VARCHAR2(100),
  Adresse VARCHAR2(150),
  Ville VARCHAR2(50),
  Surface INT,
  constraint pk_Gymnases primary key(IdGymnase));

CREATE TABLE Arbitrer(
  IdSportif INT,
  IdSport INT,
  constraint fk_SportifArbitrer foreign key(IdSportif) references Sportifs(IdSportif) on delete cascade,
  constraint fk_SportArbitrer foreign key(IdSport) references Sports(IdSport) on delete cascade,
  constraint pk_Arbitrer primary key(IdSportif, IdSport));

CREATE TABLE Entrainer(
  IdSportifEntraineur INT,
  IdSport INT,
  constraint fk_SportifEntraineur foreign key(IdSportifEntraineur) references Sportifs(IdSportif) on delete cascade,
  constraint fk_SportEntrainer foreign key(IdSport) references Sports(IdSport) on delete cascade,
  constraint pk_Entrainer primary key (IdSportifEntraineur, IdSport));

CREATE TABLE Jouer(
  IdSportif INT,
  IdSport INT,
  constraint fk_SportifJouer foreign key(IdSportif) references Sportifs(IdSportif) on delete cascade,
  constraint fk_SportJouer foreign key(IdSport) references Sports(IdSport) on delete cascade,
  constraint pk_Jouer primary key (IdSportif, IdSport));

CREATE TABLE Seances(
  IdGymnase INT,
  IdSport INT,
  IdSportifEntraineur INT,
  Jour VARCHAR2(30),
  Horaire number,
  Duree INT,
  constraint ck_Jour check (Jour in ('Samedi','Dimanche','Lundi','Mardi','Mercredi','Jeudi','Vendredi')),
  constraint fk_SportifEntraineurSeances foreign key(IdSportifEntraineur) references Sportifs(IdSportif) on delete cascade,
  constraint fk_SportSeances foreign key(IdSport) references Sports(IdSport) on delete cascade,
  constraint fk_GymnaseSeances foreign key(IdGymnase) references Gymnases(IdGymnase) on delete cascade,
  constraint pk_Seances primary key (IdGymnase, IdSport, IdSportifEntraineur, Jour, Horaire));

CREATE TABLE TableErreurs(
  adresse ROWID,
  utilisateur VARCHAR2(30),
  nomTable VARCHAR2(30),
  nomContrainte VARCHAR2(30));
