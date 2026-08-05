-- Module 1 : SQL Fundamentals

-- Création de la table livres
CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(100) NOT NULL,
    auteur VARCHAR(100) NOT NULL,
    annee_publication INT
);

-- Insertion de données
INSERT INTO livres (titre, auteur, annee_publication)
VALUES ('Dune', 'Frank Herbert', 1965);

INSERT INTO livres (titre, auteur, annee_publication)
VALUES 
    ('1984', 'George Orwell', 1949),
    ('Fondation', 'Isaac Asimov', 1951),
    ('Le Meilleur des mondes', 'Aldous Huxley', 1932);

-- Vérification
SELECT * FROM livres;

-- =========================================
-- Module 1 : SQL Fundamentals (suite)
-- =========================================

-- --- WHERE : filtrer des lignes ---

-- Livres publiés après 1950
SELECT * FROM livres WHERE annee_publication > 1950;

-- --- ORDER BY : trier des résultats ---

-- Tri croissant (ASC) par année
SELECT * FROM livres ORDER BY annee_publication ASC;

-- Combinaison WHERE + ORDER BY
SELECT titre, auteur FROM livres 
WHERE annee_publication > 1940 
ORDER BY annee_publication DESC;

-- Livres publiés avant 1960, du plus récent au plus ancien
SELECT titre, auteur FROM livres 
WHERE annee_publication < 1960 
ORDER BY annee_publication DESC;

-- --- Fonctions d'agrégation ---

-- Nombre total de livres, année la plus ancienne et la plus récente
SELECT COUNT(*), MIN(annee_publication), MAX(annee_publication) FROM livres;

-- Version avec alias plus lisibles
SELECT COUNT(*) AS nombre_livres, 
       MIN(annee_publication) AS plus_ancien, 
       MAX(annee_publication) AS plus_recent 
FROM livres;

-- --- GROUP BY : regrouper par catégorie ---

-- Ajout d'un 2e livre pour Isaac Asimov (pour illustrer le regroupement)
INSERT INTO livres (titre, auteur, annee_publication)
VALUES ('Le Meurtre de Roger Ackroyd', 'Isaac Asimov', 1926);

-- Nombre de livres par auteur
SELECT auteur, COUNT(*) 
FROM livres 
GROUP BY auteur;

-- --- Erreur classique à connaître ---
-- Ceci génère une erreur : une colonne hors GROUP BY doit être dans une fonction d'agrégation
-- SELECT titre, auteur, COUNT(*) FROM livres GROUP BY auteur;
-- ERROR: column "livres.titre" must appear in the GROUP BY clause or be used in an aggregate function

-- --- HAVING : filtrer des groupes (après le GROUP BY) ---

-- Auteurs ayant écrit plus d'un livre
SELECT auteur, COUNT(*) 
FROM livres 
GROUP BY auteur
HAVING COUNT(*) > 1;