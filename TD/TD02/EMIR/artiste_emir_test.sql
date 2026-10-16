/*
============================================================================== A
-- Test unitaire pour la création des routines ÉMIR
--------------------------------------------------------------------------------
Projet   : Mona
Version  : 0.0.0a
Statut   : en vigueur
============================================================================== A
 */
-- Insertion d'un artiste
CALL api.artiste_ins ('Doe', 'John', '1980-01-01');

-- Vérification de l'insertion
SELECT
    CASE
        WHEN EXISTS (
            SELECT
                1
            FROM
                catalogage.artiste
            WHERE
                nomArtiste = 'Doe'
                AND prenomArtiste = 'John'
        )
        THEN 'Succès : Insertion effectuée'
        ELSE 'Échec : L''insertion de l''artiste a échoué'
    END AS resultat;

-- Test de la fonction d’évaluation
SELECT
    CASE
        WHEN api.artiste_eva_nom_prenom ('Doe', 'John') IS NOT NULL THEN 'Succès : Évaluation correcte'
        ELSE 'Échec : Évaluation incorrecte'
    END AS resultat;

-- Modification du nom
CALL api.artiste_mod_nom (3, 'Williams');

-- Vérification de la modification
SELECT
    CASE
        WHEN EXISTS (
            SELECT
                1
            FROM
                catalogage.artiste
            WHERE
                prenomArtiste = 'John'
                AND nomArtiste = 'Williams'
        ) THEN 'Succès : Nom modifié'
        ELSE 'Échec : Modification du nom échouée'
    END AS resultat;

-- Suppression de l'artiste
CALL api.artiste_ret (3);

-- Vérification de la suppression
SELECT
    CASE
        WHEN NOT EXISTS (
            SELECT
                1
            FROM
                catalogage.artiste
            WHERE
                nomArtiste = 'Williams'
                AND prenomArtiste = 'John'
        ) THEN 'Succès : Artiste supprimé'
        ELSE 'Échec : Suppression de l''artiste échouée'
    END AS resultat;

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
2024-09-28 (CK) : Création
2026-10-13 (ZZ) : Corrections mineures
--------------------------------------------------------------------------------
-- Fin de artisre_emir_test.sql
============================================================================== Z
 */