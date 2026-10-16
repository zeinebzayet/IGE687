/*
-- =========================================================================== A
-- Création des routines ÉMIR pour les musées.
-- -----------------------------------------------------------------------------
Projet   : Mona
Version  : 0.0.0a
Statut   : en vigueur
-- =========================================================================== A
*/
-- ========================= Routines d'insertions
-- Insertion d'un musée
create or replace procedure api.musee_ins
  (
    _nom varchar(200),
    _acronyme varchar(20),
    _categorie varchar(60),
    _ville varchar(60),
    _pays varchar(60)
  )
  language plpgsql
  as $$
  declare
    _idPP catalogage.idPP;
  begin
    insert into catalogage.Partie_prenante(nom, ville, pays) values
      (_nom, _ville, _pays)
      returning id into _idPP;

    insert into catalogage.Musee(id, acronyme, categorie)
    values (_idPP, _acronyme, _categorie);
  end
  $$;
-- ========================= Routines d'évaluation
create or replace function api.musee_eva_acronym(_acronyme varchar(20))
  returns catalogage.idPP
  language sql
  as
  $$
  select id from catalogage.musee where acronyme = lower(_acronyme);
  $$;
-- ========================= Routines de modifications
-- Modifier la ville d'une partie prenante
create or replace procedure api.musee_mod_ville
  (
    _id catalogage.idPP,
    _ville varchar(60)
  )
  language sql
as $$
  call api.partie_prenante_mod_ville(_id, _ville);
$$;
-- Modifier l'acronyme d'un musée.
create or replace procedure api.musee_mod_acronym
  (
    _id catalogage.idPP,
    _acronyme varchar(60)
  )
begin atomic
  update catalogage.musee
  set acronyme = _acronyme
  where id = _id;
end;
-- ========================= Routines de retrait
create or replace procedure api.musee_ret(_id catalogage.idPP)
begin atomic
  delete from catalogage.musee where id = _id;
  delete from catalogage.partie_prenante where id = _id;
end;

/*
-- =========================================================================== Z
Contributeurs :
  (CK) Christina.Khnaisser@USherbrooke.ca
  (LL) Luc.Lavoie@USherbrooke.ca
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
2024-09-28 (CK) : Création
2026-10-13 (ZZ) : Corrections mineures
-- -----------------------------------------------------------------------------
-- Fin de musee_emir_cre.sql
-- =========================================================================== Z
*/
