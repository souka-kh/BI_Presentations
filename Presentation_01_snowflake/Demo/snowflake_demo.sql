-- ===============================================
-- SNOWFLAKE DEMO - Architecture et Fonctionnalités
-- Présenté par: Hamza Aouni & El Hamdouni Yassine
-- ===============================================

-- ========================================
-- 1. CONFIGURATION INITIALE
-- ========================================

-- Créer une base de données de démonstration
CREATE DATABASE IF NOT EXISTS SNOWFLAKE_DEMO;
USE DATABASE SNOWFLAKE_DEMO;

-- Créer un schéma
CREATE SCHEMA IF NOT EXISTS DEMO_SCHEMA;
USE SCHEMA DEMO_SCHEMA;

-- Créer un entrepôt virtuel (Virtual Warehouse)
CREATE WAREHOUSE IF NOT EXISTS DEMO_WAREHOUSE 
WITH WAREHOUSE_SIZE = 'X-SMALL' 
AUTO_SUSPEND = 60 
AUTO_RESUME = TRUE;

USE WAREHOUSE DEMO_WAREHOUSE;

-- ========================================
-- 2. CRÉATION DES TABLES DE DÉMONSTRATION  
-- ========================================

-- Table des clients
CREATE TABLE customers (
    customer_id INT AUTOINCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(200),
    city VARCHAR(50),
    country VARCHAR(50),
    registration_date DATE,
    customer_segment VARCHAR(20)
);

-- Table des produits
CREATE TABLE products (
    product_id INT AUTOINCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    unit_price DECIMAL(10,2),
    cost DECIMAL(10,2),
    supplier VARCHAR(50)
);

-- Table des commandes
CREATE TABLE orders (
    order_id INT AUTOINCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2),
    product_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ========================================
-- 3. INSERTION DES DONNÉES D'EXEMPLE
-- ========================================

-- Insertion des clients
INSERT INTO customers (first_name, last_name, email, phone, address, city, country, registration_date, customer_segment)
VALUES 
    ('John', 'Doe', 'john.doe@email.com', '+1-555-0101', '123 Main St', 'New York', 'USA', '2023-01-15', 'Consumer'),
    ('Jane', 'Smith', 'jane.smith@email.com', '+1-555-0102', '456 Oak Ave', 'Los Angeles', 'USA', '2023-02-20', 'Corporate'),
    ('Mohammed', 'Alami', 'm.alami@email.com', '+212-555-0103', '789 Hassan II Blvd', 'Casablanca', 'Morocco', '2023-03-10', 'Consumer'),
    ('Sarah', 'Johnson', 's.johnson@email.com', '+1-555-0104', '321 Pine St', 'Chicago', 'USA', '2023-01-25', 'Home Office'),
    ('Ahmed', 'Bennani', 'a.bennani@email.com', '+212-555-0105', '654 Mohammed V Ave', 'Rabat', 'Morocco', '2023-04-05', 'Corporate');

-- Insertion des produits
INSERT INTO products (product_name, category, subcategory, unit_price, cost, supplier)
VALUES 
    ('Dell Laptop Pro 15"', 'Technology', 'Computers', 899.99, 650.00, 'Dell Inc'),
    ('Office Chair Executive', 'Furniture', 'Chairs', 299.99, 180.00, 'Herman Miller'),
    ('Stapler Heavy Duty', 'Office Supplies', 'Fasteners', 24.99, 12.00, 'Staples'),
    ('Samsung Monitor 24"', 'Technology', 'Accessories', 199.99, 120.00, 'Samsung'),
    ('Bookshelf Oak Wood', 'Furniture', 'Bookcases', 149.99, 85.00, 'IKEA');

-- Insertion des commandes
INSERT INTO orders (customer_id, order_date, ship_date, ship_mode, sales, quantity, discount, profit, product_id)
VALUES 
    (1, '2024-01-15', '2024-01-20', 'Standard Class', 899.99, 1, 0.00, 249.99, 1),
    (2, '2024-01-18', '2024-01-22', 'First Class', 299.99, 1, 0.10, 89.99, 2),
    (3, '2024-01-20', '2024-01-25', 'Second Class', 24.99, 2, 0.05, 11.24, 3),
    (1, '2024-02-01', '2024-02-05', 'First Class', 199.99, 1, 0.00, 79.99, 4),
    (4, '2024-02-10', '2024-02-15', 'Standard Class', 149.99, 1, 0.15, 42.49, 5),
    (5, '2024-02-12', '2024-02-17', 'First Class', 1799.98, 2, 0.05, 469.98, 1),
    (2, '2024-03-01', '2024-03-06', 'Second Class', 74.97, 3, 0.00, 33.73, 3);

-- ========================================
-- 4. DÉMONSTRATION DES FONCTIONNALITÉS SNOWFLAKE
-- ========================================

-- A. Architecture de stockage colonnaire
SELECT 'Architecture de stockage colonnaire démontrée par la compression automatique';

-- B. Séparation du stockage et du calcul
-- Mise à l'échelle de l'entrepôt sans affecter les données
ALTER WAREHOUSE DEMO_WAREHOUSE SET WAREHOUSE_SIZE = 'SMALL';
ALTER WAREHOUSE DEMO_WAREHOUSE SET WAREHOUSE_SIZE = 'X-SMALL';

-- C. Requêtes analytiques démontrant les performances
-- Analyse des ventes par segment de client
SELECT 
    c.customer_segment,
    COUNT(*) as nombre_commandes,
    AVG(o.sales) as vente_moyenne,
    SUM(o.sales) as ventes_totales,
    AVG(o.profit) as profit_moyen
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_segment
ORDER BY ventes_totales DESC;

-- Analyse des ventes par catégorie et mois
SELECT 
    p.category,
    MONTH(o.order_date) as mois,
    COUNT(*) as nombre_commandes,
    SUM(o.sales) as ventes_mensuelles,
    ROUND(AVG(o.discount), 3) as remise_moyenne
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category, MONTH(o.order_date)
ORDER BY mois, ventes_mensuelles DESC;

-- ========================================
-- 5. TIME TRAVEL (Voyage dans le temps)
-- ========================================

-- Créer une sauvegarde avec Time Travel
CREATE TABLE customers_backup CLONE customers;

-- Simuler une modification
UPDATE customers SET city = 'Updated City' WHERE customer_id = 1;

-- Restaurer depuis Time Travel (dans les dernières 24h par défaut)
CREATE OR REPLACE TABLE customers_restored AS 
SELECT * FROM customers AT(OFFSET => -60*5); -- Il y a 5 minutes

-- ========================================
-- 6. PARTAGE DE DONNÉES (Data Sharing)
-- ========================================

-- Créer une vue sécurisée pour le partage
CREATE SECURE VIEW sales_summary AS
SELECT 
    YEAR(order_date) as annee,
    MONTH(order_date) as mois,
    COUNT(*) as total_commandes,
    SUM(sales) as chiffre_affaires,
    SUM(profit) as profit_total
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date);

-- ========================================
-- 7. FONCTIONS ANALYTIQUES AVANCÉES
-- ========================================

-- Analyse de cohorts avec des fonctions de fenêtre
WITH customer_cohorts AS (
    SELECT 
        customer_id,
        MIN(order_date) as premiere_commande,
        COUNT(*) as nombre_commandes_total,
        SUM(sales) as valeur_vie_client
    FROM orders
    GROUP BY customer_id
)
SELECT 
    MONTH(premiere_commande) as mois_acquisition,
    COUNT(*) as nouveaux_clients,
    AVG(valeur_vie_client) as valeur_moyenne_client,
    AVG(nombre_commandes_total) as commandes_moyennes_par_client
FROM customer_cohorts
GROUP BY MONTH(premiere_commande)
ORDER BY mois_acquisition;

-- Analyse des tendances avec fonctions de fenêtre
SELECT 
    order_date,
    sales,
    AVG(sales) OVER (ORDER BY order_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as moyenne_mobile_3j,
    LAG(sales, 1) OVER (ORDER BY order_date) as vente_precedente,
    sales - LAG(sales, 1) OVER (ORDER BY order_date) as variation
FROM orders
ORDER BY order_date;

-- ========================================
-- 8. OPTIMISATION ET PERFORMANCE
-- ========================================

-- Utilisation du cache de résultats
-- Cette requête utilisera le cache si exécutée à nouveau dans les 24h
SELECT COUNT(*) as total_commandes, SUM(sales) as total_ventes 
FROM orders;

-- Démonstration du clustering automatique
-- Snowflake gère automatiquement le clustering pour optimiser les performances

-- ========================================
-- 9. SÉCURITÉ ET GOUVERNANCE
-- ========================================

-- Créer un rôle pour la démonstration
CREATE ROLE IF NOT EXISTS DEMO_ANALYST;
GRANT USAGE ON DATABASE SNOWFLAKE_DEMO TO ROLE DEMO_ANALYST;
GRANT USAGE ON SCHEMA DEMO_SCHEMA TO ROLE DEMO_ANALYST;
GRANT SELECT ON ALL TABLES IN SCHEMA DEMO_SCHEMA TO ROLE DEMO_ANALYST;
