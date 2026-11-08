# Gestion des salles de sport (Oracle XE + Docker)

Base de donnees Oracle reproductible en une commande, realisee dans le cadre
du module BDA (USTHB, M1 HPC). Le projet couvre le LDD/LMD, les requetes,
les privileges et roles, le PL/SQL et les triggers.

## Lancer le projet

Prerequis : Docker.

    cp .env.example .env      # puis modifier les mots de passe
    ./run.sh

Connexion :

    docker exec -it gymnase-oracle sqlplus DBAGYMNASE/<mot_de_passe>@XEPDB1

## Contenu

| Fichier | Contenu |
|---|---|
| sql/01_tablespaces_users.sql | Tablespaces et utilisateur |
| sql/02_schema.sql | Creation des 8 tables et contraintes |
| sql/03_data.sql | Jeu de donnees |

## Schema relationnel

    SPORTIFS (IDSPORTIF, NOM, PRENOM, SEXE, AGE, IDSPORTIFCONSEILLER*)
    SPORTS (IDSPORT, LIBELLE)
    GYMNASES (IDGYMNASE, NOMGYMNASE, ADRESSE, VILLE, SURFACE)
    ARBITRER (IDSPORTIF*, IDSPORT*)
    ENTRAINER (IDSPORTIFENTRAINEUR*, IDSPORT*)
    JOUER (IDSPORTIF*, IDSPORT*)
    SEANCES (IDGYMNASE*, IDSPORT*, IDSPORTIFENTRAINEUR*, JOUR, HORAIRE, DUREE)

## Avancement

- [x] Schema et donnees
- [ ] Requetes et evolution du schema (TP1)
- [ ] Privileges, profils, roles (TP2)
- [ ] PL/SQL (TP4)
- [ ] Triggers (TP5)
