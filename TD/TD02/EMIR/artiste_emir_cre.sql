/*
============================================================================== A
-- Création des routines ÉMIR pour les artistes.
--------------------------------------------------------------------------------
Projet   : Mona
Version  : 1.0.0a
Statut   : en vigueur
============================================================================== A
*/
-- ========================= Routine d'insertion
CREATE OR REPLACE PROCEDURE api.artiste_ins(
    _nomArtiste TEXT,
    _prenomArtiste TEXT,
    _dateNaissance DATE
)
    LANGUAGE plpgsql
AS $$
begin
    INSERT INTO catalogage.artiste(nomArtiste, prenomArtiste, dateNaissance)
    VALUES (_nomArtiste, _prenomArtiste, _dateNaissance);
end;
$$;

-- ========================= Routine d'évaluation
CREATE OR REPLACE FUNCTION api.artiste_eva_nom_prenom(nom TEXT, prenom TEXT)
    RETURNS INTEGER
    language sql
as
$$
SELECT idartiste FROM catalogage.artiste WHERE nomartiste = nom AND prenomartiste = prenom;
$$;
-- ========================= Routines de modification
-- Modifier le nom d'un artiste
create or replace procedure api.artiste_mod_nom
(
    _idArtiste INTEGER,
    _nomArtiste varchar(200)
)
    language plpgsql
as $$
begin
    update catalogage.artiste
    set nomArtiste = _nomArtiste
    where idArtiste = _idArtiste;
end;
$$;
-- Modifier le prenom d'un artiste
create or replace procedure api.artiste_mod_prenom
(
    _idArtiste INTEGER,
    _prenomArtiste varchar(200)
)
    language plpgsql
as $$
begin
    update catalogage.artiste
    set prenomArtiste = _prenomArtiste
    where idArtiste = _idArtiste;
end;
$$;
-- Modifier la date de naissance d'un artiste
create or replace procedure api.artiste_mod_datenaissance
(
    _idArtiste INTEGER,
    _dateNaissance date
)
    language plpgsql
as $$
begin
    update catalogage.artiste
    set datenaissance = _dateNaissance
    where idArtiste = _idArtiste;
end;
$$;

-- ========================= Routine de retrait
CREATE OR REPLACE PROCEDURE api.artiste_ret(
    _idArtiste INTEGER
)
    LANGUAGE plpgsql
AS $$
BEGIN

    DELETE FROM catalogage.creation
    WHERE idArtiste = _idArtiste;

    DELETE FROM catalogage.artiste
    WHERE idArtiste = _idArtiste;

END;
$$;

/*
============================================================================== Z
Contributeurs :
  (CK) Christina.Khnaisser@USherbrooke.ca
  (LL) Luc.Lavoie@USherbrooke.ca
  (KN) Kevin.Vaneck.Nana.Nana@USherbrooke.ca
  (ZZ) Zeineb.Zaiet@USherbrooke.ca

Adresse, droits d'auteur et copyright :
  Groupe Metis
  Département d'informatique
  Faculté des sciences
  Université de Sherbrooke
  Sherbrooke (Québec) J1K 2R1
  Canada

Tâches projetées :

Tâches réalisées :
2024-10-25 (CK) : Création
2026-10-13 (ZZ) : Corrections mineures
--------------------------------------------------------------------------------
-- Fin de artiste_emir_cre.sql
============================================================================== Z
*/
