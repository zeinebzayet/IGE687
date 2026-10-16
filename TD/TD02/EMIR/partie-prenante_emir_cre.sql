/*
-- =========================================================================== A
-- Création des routines ÉMIR pour les parties prenantes
-- -----------------------------------------------------------------------------
Projet   : Mona
Version  : 0.0.0a
Statut   : en vigueur
-- =========================================================================== A
*/
-- ========================= Routines d'insertions
-- voir insertion d'un musée
-- ========================= Routines d'évaluation
-- ========================= Routines de modifications
-- Modifier la ville d'une partie prenante
create or replace procedure api.partie_prenante_mod_ville
  (
    _id catalogage.idPP,
    _ville varchar(60)
  )
begin atomic
  update catalogage.partie_prenante
  set ville = _ville
  where id = _id;
end;
-- ========================= Routines de retrait
--
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
-- Fin de partie-prenante_emir_cre.sql
-- =========================================================================== Z
*/
