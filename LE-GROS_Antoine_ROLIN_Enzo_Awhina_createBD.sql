/*==============================================================*/
/* Nom de SGBD :  Sybase SQL Anywhere 12                        */
/* Date de création :  18/11/2022 14:00:04                      */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_ABSENCE_S_ABSENTE_SALARIE') then
    alter table Absence
       delete foreign key FK_ABSENCE_S_ABSENTE_SALARIE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_APPARTEN_APPARTENI_SALARIE') then
    alter table Appartenir
       delete foreign key FK_APPARTEN_APPARTENI_SALARIE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_APPARTEN_APPARTENI_ENFANT') then
    alter table Appartenir
       delete foreign key FK_APPARTEN_APPARTENI_ENFANT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DEMENAGE_ENCADRER_DOSSIER') then
    alter table Demenagement
       delete foreign key FK_DEMENAGE_ENCADRER_DOSSIER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DOSSIER_AVOIR_CLIENT') then
    alter table Dossier
       delete foreign key FK_DOSSIER_AVOIR_CLIENT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DOSSIER_COMPOSER_FORMULE') then
    alter table Dossier
       delete foreign key FK_DOSSIER_COMPOSER_FORMULE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DOSSIER_ENCADRER2_DEMENAGE') then
    alter table Dossier
       delete foreign key FK_DOSSIER_ENCADRER2_DEMENAGE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DOSSIER_S_OCCUPER_AGENCE') then
    alter table Dossier
       delete foreign key FK_DOSSIER_S_OCCUPER_AGENCE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_IMMOBILI_ETRE1_VEHICULE') then
    alter table Immobilisation
       delete foreign key FK_IMMOBILI_ETRE1_VEHICULE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_IMMOBILI_REPARER_GARAGE') then
    alter table Immobilisation
       delete foreign key FK_IMMOBILI_REPARER_GARAGE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PARCOURI_PARCOURIR_SALARIE') then
    alter table Parcourir
       delete foreign key FK_PARCOURI_PARCOURIR_SALARIE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PARCOURI_PARCOURIR_VEHICULE') then
    alter table Parcourir
       delete foreign key FK_PARCOURI_PARCOURIR_VEHICULE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PARCOURI_PARCOURIR_DOSSIER') then
    alter table Parcourir
       delete foreign key FK_PARCOURI_PARCOURIR_DOSSIER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SALARIE_CORRESPON_TYPE_SAL') then
    alter table Salarie
       delete foreign key FK_SALARIE_CORRESPON_TYPE_SAL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TRAVAILL_TRAVAILLE_AGENCE') then
    alter table Travailler
       delete foreign key FK_TRAVAILL_TRAVAILLE_AGENCE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TRAVAILL_TRAVAILLE_SALARIE') then
    alter table Travailler
       delete foreign key FK_TRAVAILL_TRAVAILLE_SALARIE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VEHICULE_DETENIR_AGENCE') then
    alter table Vehicule
       delete foreign key FK_VEHICULE_DETENIR_AGENCE
end if;

drop index if exists Absence.S_ABSENTER_FK;

drop index if exists Absence.ABSENCE_PK;

drop table if exists Absence;

drop index if exists Agence.AGENCE_PK;

drop table if exists Agence;

drop index if exists Appartenir.APPARTENIR2_FK;

drop index if exists Appartenir.APPARTENIR_FK;

drop index if exists Appartenir.APPARTENIR_PK;

drop table if exists Appartenir;

drop index if exists Client.CLIENT_PK;

drop table if exists Client;

drop index if exists Demenagement.ENCADRER_FK;

drop index if exists Demenagement.DEMENAGEMENT_PK;

drop table if exists Demenagement;

drop index if exists Dossier.COMPOSER_FK;

drop index if exists Dossier.S_OCCUPER_FK;

drop index if exists Dossier.ENCADRER2_FK;

drop index if exists Dossier.AVOIR_FK;

drop index if exists Dossier.DOSSIER_PK;

drop table if exists Dossier;

drop index if exists Enfant.ENFANT_PK;

drop table if exists Enfant;

drop index if exists Formule.FORMULE_PK;

drop table if exists Formule;

drop index if exists Garage.GARAGE_PK;

drop table if exists Garage;

drop index if exists Immobilisation.REPARER_FK;

drop index if exists Immobilisation.ETRE1_FK;

drop index if exists Immobilisation.IMMOBILISATION_PK;

drop table if exists Immobilisation;

drop index if exists Parcourir.PARCOURIR3_FK;

drop index if exists Parcourir.PARCOURIR2_FK;

drop index if exists Parcourir.PARCOURIR_FK;

drop index if exists Parcourir.PARCOURIR_PK;

drop table if exists Parcourir;

drop index if exists Salarie.CORRESPONDRE_FK;

drop index if exists Salarie.SALARIE_PK;

drop table if exists Salarie;

drop index if exists Travailler.TRAVAILLER2_FK;

drop index if exists Travailler.TRAVAILLER_FK;

drop index if exists Travailler.TRAVAILLER_PK;

drop table if exists Travailler;

drop index if exists Type_salarie.TYPE_SALARIE_PK;

drop table if exists Type_salarie;

drop index if exists Vehicule.DETENIR_FK;

drop index if exists Vehicule.VEHICULE_PK;

drop table if exists Vehicule;

/*==============================================================*/
/* Table : Absence                                              */
/*==============================================================*/
create table Absence 
(
   idAbs                integer                        not null,
   refSal               integer                        not null,
   motifAbs             varchar(200)                   null,
   dateDemAbs           date                           null,
   dateRepAbs           date                           null,
   dateDebAbs           date                           null,
   dateFinAbs           date                           null,
   etatAbs              varchar(2)                     null,
   constraint PK_ABSENCE primary key (idAbs)
);

/*==============================================================*/
/* Index : ABSENCE_PK                                           */
/*==============================================================*/
create unique index ABSENCE_PK on Absence (
idAbs ASC
);

/*==============================================================*/
/* Index : S_ABSENTER_FK                                        */
/*==============================================================*/
create index S_ABSENTER_FK on Absence (
refSal ASC
);

/*==============================================================*/
/* Table : Agence                                               */
/*==============================================================*/
create table Agence 
(
   idAg                 integer                        not null,
   nomAg                varchar(200)                   null,
   rueAg                varchar(200)                   null,
   CPAg                 char(5)                        null,
   villeAg              varchar(200)                   null,
   telAg                char(10)                       null,
   mailAg               varchar(200)                   null,
   LatAg                float                          null,
   LongAg               float                          null,
   constraint PK_AGENCE primary key (idAg)
);

/*==============================================================*/
/* Index : AGENCE_PK                                            */
/*==============================================================*/
create unique index AGENCE_PK on Agence (
idAg ASC
);

/*==============================================================*/
/* Table : Appartenir                                           */
/*==============================================================*/
create table Appartenir 
(
   refSal               integer                        not null,
   idEnf                integer                        not null,
   roleParent           varchar(200)                   null,
   constraint PK_APPARTENIR primary key clustered (refSal, idEnf)
);

/*==============================================================*/
/* Index : APPARTENIR_PK                                        */
/*==============================================================*/
create unique clustered index APPARTENIR_PK on Appartenir (
refSal ASC,
idEnf ASC
);

/*==============================================================*/
/* Index : APPARTENIR_FK                                        */
/*==============================================================*/
create index APPARTENIR_FK on Appartenir (
refSal ASC
);

/*==============================================================*/
/* Index : APPARTENIR2_FK                                       */
/*==============================================================*/
create index APPARTENIR2_FK on Appartenir (
idEnf ASC
);

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client 
(
   idClt                integer                        not null,
   nomClt               varchar(200)                   null,
   PnomClt              varchar(200)                   null,
   dateNaissClt         date                           null,
   CPClt                char(5)                        null,
   rueClt               varchar(200)                   null,
   villeClt             varchar(200)                   null,
   telClt               char(10)                       null,
   mailClt              varchar(200)                   null,
   constraint PK_CLIENT primary key (idClt)
);

/*==============================================================*/
/* Index : CLIENT_PK                                            */
/*==============================================================*/
create unique index CLIENT_PK on Client (
idClt ASC
);

/*==============================================================*/
/* Table : Demenagement                                         */
/*==============================================================*/
create table Demenagement 
(
   idDem                integer                        not null,
   refDos               varchar(11)                    not null,
   dateDempre           date                           null,
   rueChar              varchar(200)                   null,
   CPChar               char(5)                        null,
   villeChar            varchar(200)                   null,
   latChar              float                          null,
   longChar             float                          null,
   rueLiv               varchar(200)                   null,
   CPLiv                char(5)                        null,
   villeLiv             varchar(200)                   null,
   latLiv               float                          null,
   LongLiv              float                          null,
   telChar              char(10)                       null,
   telLiv               char(10)                       null,
   constraint PK_DEMENAGEMENT primary key (idDem)
);

/*==============================================================*/
/* Index : DEMENAGEMENT_PK                                      */
/*==============================================================*/
create unique index DEMENAGEMENT_PK on Demenagement (
idDem ASC
);

/*==============================================================*/
/* Index : ENCADRER_FK                                          */
/*==============================================================*/
create index ENCADRER_FK on Demenagement (
refDos ASC
);

/*==============================================================*/
/* Table : Dossier                                              */
/*==============================================================*/
create table Dossier 
(
   refDos               varchar(11)                    not null,
   idAg                 integer                        not null,
   idForm               integer                        not null,
   idClt                integer                        not null,
   idDem                integer                        null,
   dateDem              timestamp                      null,
   etatDos              varchar(20)                    null,
   dateVisite           date                           null,
   dateCloture          date                           null,
   volDos               float                          null,
   nbDem                smallint                       null,
   dateLiv              timestamp                      null,
   nbVhc                smallint                       null,
   rmqDos               varchar(200)                   null,
   constraint PK_DOSSIER primary key (refDos)
);

/*==============================================================*/
/* Index : DOSSIER_PK                                           */
/*==============================================================*/
create unique index DOSSIER_PK on Dossier (
refDos ASC
);

/*==============================================================*/
/* Index : AVOIR_FK                                             */
/*==============================================================*/
create index AVOIR_FK on Dossier (
idClt ASC
);

/*==============================================================*/
/* Index : ENCADRER2_FK                                         */
/*==============================================================*/
create index ENCADRER2_FK on Dossier (
idDem ASC
);

/*==============================================================*/
/* Index : S_OCCUPER_FK                                         */
/*==============================================================*/
create index S_OCCUPER_FK on Dossier (
idAg ASC
);

/*==============================================================*/
/* Index : COMPOSER_FK                                          */
/*==============================================================*/
create index COMPOSER_FK on Dossier (
idForm ASC
);

/*==============================================================*/
/* Table : Enfant                                               */
/*==============================================================*/
create table Enfant 
(
   idEnf                integer                        not null,
   nomEnf               varchar(200)                   null,
   pnomEnf              varchar(200)                   null,
   DateNaissEnf         date                           null,
   constraint PK_ENFANT primary key (idEnf)
);

/*==============================================================*/
/* Index : ENFANT_PK                                            */
/*==============================================================*/
create unique index ENFANT_PK on Enfant (
idEnf ASC
);

/*==============================================================*/
/* Table : Formule                                              */
/*==============================================================*/
create table Formule 
(
   idForm               integer                        not null,
   libForm              varchar(200)                   null,
   prixForm             float                          null,
   demForm              varchar(200)                   null,
   constraint PK_FORMULE primary key (idForm)
);

/*==============================================================*/
/* Index : FORMULE_PK                                           */
/*==============================================================*/
create unique index FORMULE_PK on Formule (
idForm ASC
);

/*==============================================================*/
/* Table : Garage                                               */
/*==============================================================*/
create table Garage 
(
   idGar                integer                        not null,
   nomGar               varchar(200)                   null,
   telGar               char(10)                       null,
   rueGar               varchar(200)                   null,
   CPGar                char(5)                        null,
   villeGar             varchar(200)                   null,
   constraint PK_GARAGE primary key (idGar)
);

/*==============================================================*/
/* Index : GARAGE_PK                                            */
/*==============================================================*/
create unique index GARAGE_PK on Garage (
idGar ASC
);

/*==============================================================*/
/* Table : Immobilisation                                       */
/*==============================================================*/
create table Immobilisation 
(
   idImmo               integer                        not null,
   idGar                integer                        not null,
   idVhc                integer                        not null,
   tpImmo               varchar(200)                   null,
   kmImmo               integer                        null,
   debImmo              date                           null,
   finImmo              date                           null,
   infImmo              varchar(200)                   null,
   constraint PK_IMMOBILISATION primary key (idImmo)
);

/*==============================================================*/
/* Index : IMMOBILISATION_PK                                    */
/*==============================================================*/
create unique index IMMOBILISATION_PK on Immobilisation (
idImmo ASC
);

/*==============================================================*/
/* Index : ETRE1_FK                                             */
/*==============================================================*/
create index ETRE1_FK on Immobilisation (
idVhc ASC
);

/*==============================================================*/
/* Index : REPARER_FK                                           */
/*==============================================================*/
create index REPARER_FK on Immobilisation (
idGar ASC
);

/*==============================================================*/
/* Table : Parcourir                                            */
/*==============================================================*/
create table Parcourir 
(
   refSal               integer                        not null,
   idVhc                integer                        not null,
   refDos               varchar(11)                    not null,
   nbkm                 integer                        null,
   constraint PK_PARCOURIR primary key clustered (refSal, idVhc, refDos)
);

/*==============================================================*/
/* Index : PARCOURIR_PK                                         */
/*==============================================================*/
create unique clustered index PARCOURIR_PK on Parcourir (
refSal ASC,
idVhc ASC,
refDos ASC
);

/*==============================================================*/
/* Index : PARCOURIR_FK                                         */
/*==============================================================*/
create index PARCOURIR_FK on Parcourir (
refSal ASC
);

/*==============================================================*/
/* Index : PARCOURIR2_FK                                        */
/*==============================================================*/
create index PARCOURIR2_FK on Parcourir (
idVhc ASC
);

/*==============================================================*/
/* Index : PARCOURIR3_FK                                        */
/*==============================================================*/
create index PARCOURIR3_FK on Parcourir (
refDos ASC
);

/*==============================================================*/
/* Table : Salarie                                              */
/*==============================================================*/
create table Salarie 
(
   refSal               integer                        not null,
   idTpSal              integer                        not null,
   nomSal               varchar(200)                   null,
   pnomSal              varchar(200)                   null,
   dateNaissSal         date                           null,
   sexeSal              char(1)                        null,
   numPerm              varchar(12)                    null,
   telSal               char(10)                       null,
   rueSal               varchar(200)                   null,
   CPSal                integer                        null,
   villeSal             varchar(200)                   null,
   capMener             integer                        null,
   dateEmb              date                           null,
   constraint PK_SALARIE primary key (refSal)
);

/*==============================================================*/
/* Index : SALARIE_PK                                           */
/*==============================================================*/
create unique index SALARIE_PK on Salarie (
refSal ASC
);

/*==============================================================*/
/* Index : CORRESPONDRE_FK                                      */
/*==============================================================*/
create index CORRESPONDRE_FK on Salarie (
idTpSal ASC
);

/*==============================================================*/
/* Table : Travailler                                           */
/*==============================================================*/
create table Travailler 
(
   idAg                 integer                        not null,
   refSal               integer                        not null,
   tauxPresence         float                          null,
   constraint PK_TRAVAILLER primary key clustered (idAg, refSal)
);

/*==============================================================*/
/* Index : TRAVAILLER_PK                                        */
/*==============================================================*/
create unique clustered index TRAVAILLER_PK on Travailler (
idAg ASC,
refSal ASC
);

/*==============================================================*/
/* Index : TRAVAILLER_FK                                        */
/*==============================================================*/
create index TRAVAILLER_FK on Travailler (
idAg ASC
);

/*==============================================================*/
/* Index : TRAVAILLER2_FK                                       */
/*==============================================================*/
create index TRAVAILLER2_FK on Travailler (
refSal ASC
);

/*==============================================================*/
/* Table : Type_salarie                                         */
/*==============================================================*/
create table Type_salarie 
(
   idTpSal              integer                        not null,
   libTpSal             varchar(200)                   null,
   constraint PK_TYPE_SALARIE primary key (idTpSal)
);

/*==============================================================*/
/* Index : TYPE_SALARIE_PK                                      */
/*==============================================================*/
create unique index TYPE_SALARIE_PK on Type_salarie (
idTpSal ASC
);

/*==============================================================*/
/* Table : Vehicule                                             */
/*==============================================================*/
create table Vehicule 
(
   idVhc                integer                        not null,
   idAg                 integer                        not null,
   immVhc               varchar(9)                     null,
   dateCircu            date                           null,
   tpCarosserie         varchar(200)                   null,
   nbPlaceVhc           integer                        null,
   tpVhc                varchar(200)                   null,
   marqVhc              varchar(200)                   null,
   PTACVhc              integer                        null,
   freqEntrVhc          integer                        null,
   coutKm               float                          null,
   constraint PK_VEHICULE primary key (idVhc)
);

/*==============================================================*/
/* Index : VEHICULE_PK                                          */
/*==============================================================*/
create unique index VEHICULE_PK on Vehicule (
idVhc ASC
);

/*==============================================================*/
/* Index : DETENIR_FK                                           */
/*==============================================================*/
create index DETENIR_FK on Vehicule (
idAg ASC
);

alter table Absence
   add constraint FK_ABSENCE_S_ABSENTE_SALARIE foreign key (refSal)
      references Salarie (refSal)
      on update restrict
      on delete restrict;

alter table Appartenir
   add constraint FK_APPARTEN_APPARTENI_SALARIE foreign key (refSal)
      references Salarie (refSal)
      on update restrict
      on delete restrict;

alter table Appartenir
   add constraint FK_APPARTEN_APPARTENI_ENFANT foreign key (idEnf)
      references Enfant (idEnf)
      on update restrict
      on delete restrict;

alter table Demenagement
   add constraint FK_DEMENAGE_ENCADRER_DOSSIER foreign key (refDos)
      references Dossier (refDos)
      on update restrict
      on delete restrict;

alter table Dossier
   add constraint FK_DOSSIER_AVOIR_CLIENT foreign key (idClt)
      references Client (idClt)
      on update restrict
      on delete restrict;

alter table Dossier
   add constraint FK_DOSSIER_COMPOSER_FORMULE foreign key (idForm)
      references Formule (idForm)
      on update restrict
      on delete restrict;

alter table Dossier
   add constraint FK_DOSSIER_ENCADRER2_DEMENAGE foreign key (idDem)
      references Demenagement (idDem)
      on update restrict
      on delete restrict;

alter table Dossier
   add constraint FK_DOSSIER_S_OCCUPER_AGENCE foreign key (idAg)
      references Agence (idAg)
      on update restrict
      on delete restrict;

alter table Immobilisation
   add constraint FK_IMMOBILI_ETRE1_VEHICULE foreign key (idVhc)
      references Vehicule (idVhc)
      on update restrict
      on delete restrict;

alter table Immobilisation
   add constraint FK_IMMOBILI_REPARER_GARAGE foreign key (idGar)
      references Garage (idGar)
      on update restrict
      on delete restrict;

alter table Parcourir
   add constraint FK_PARCOURI_PARCOURIR_SALARIE foreign key (refSal)
      references Salarie (refSal)
      on update restrict
      on delete restrict;

alter table Parcourir
   add constraint FK_PARCOURI_PARCOURIR_VEHICULE foreign key (idVhc)
      references Vehicule (idVhc)
      on update restrict
      on delete restrict;

alter table Parcourir
   add constraint FK_PARCOURI_PARCOURIR_DOSSIER foreign key (refDos)
      references Dossier (refDos)
      on update restrict
      on delete restrict;

alter table Salarie
   add constraint FK_SALARIE_CORRESPON_TYPE_SAL foreign key (idTpSal)
      references Type_salarie (idTpSal)
      on update restrict
      on delete restrict;

alter table Travailler
   add constraint FK_TRAVAILL_TRAVAILLE_AGENCE foreign key (idAg)
      references Agence (idAg)
      on update restrict
      on delete restrict;

alter table Travailler
   add constraint FK_TRAVAILL_TRAVAILLE_SALARIE foreign key (refSal)
      references Salarie (refSal)
      on update restrict
      on delete restrict;

alter table Vehicule
   add constraint FK_VEHICULE_DETENIR_AGENCE foreign key (idAg)
      references Agence (idAg)
      on update restrict
      on delete restrict;

