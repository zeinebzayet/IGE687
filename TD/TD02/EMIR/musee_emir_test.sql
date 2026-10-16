/*
-- =========================================================================== A
-- Test unitaire pour la création des routines ÉMIR
-- -----------------------------------------------------------------------------
Projet   : Mona
Version  : 0.0.0a
Statut   : en vigueur
-- =========================================================================== A
*/
-- Insertion d'un musée
call api.musee_ins('Musée des beaux-arts de Montréal',
                   'mbam',
                   'Beaux arts',
                   'Montréal',
                   'Canada');
select count(*) = 1 from catalogage.musee;
select count(*) = 1 from catalogage.partie_prenante;
-- Évaluation de l'acronyme
select api.musee_eva_acronym('mbam') = 1;
-- Modification de l'acronyme
call api.musee_mod_acronym(1,'beauxarts_mtl');
select api.musee_eva_acronym('mbam') is null;
-- Retrait d'un musée
call api.musee_ret(1);
select count(*) = 0 from catalogage.musee;
select count(*) = 0 from catalogage.partie_prenante;
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
-- Fin de musee_emir_test.sql
-- =========================================================================== Z
*/
