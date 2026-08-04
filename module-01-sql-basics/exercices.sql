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