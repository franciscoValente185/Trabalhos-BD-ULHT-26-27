USE ULHT_DB26;
GO

SELECT country_id, country_name, region_id
FROM HR.COUNTRIES;

SELECT TOP 10 location_id, state_province, country_id
FROM HR.LOCATIONS;

SELECT TOP 10 empno, ename, job, sal
FROM SCOTT.EMP;

SELECT deptno, dname, loc
FROM SCOTT.DEPT;

/* HR E SCOTT são esquemas diferentes, 
   mas pertencem à mesma base de dados ULHT_DB26 */

SELECT TOP 10
employee_id, first_name, last_name, email, salary
FROM HR.EMPLOYEES 
ORDER BY salary DESC;

--Ordenar do maior para o menor salário

USE BikeStores;
GO

SELECT DB_NAME() AS BaseDeDados;

SELECT category_id, category_name 
FROM production.categories;

SELECT brand_id, brand_name
FROM production.brands;

SELECT TOP 10
product_id, product_name, model_year, list_price
FROM production.products;

SELECT TOP 10
customer_id, first_name, last_name, email, city
FROM sales.customers;

SELECT store_id, store_name, phone, email
FROM sales.stores;

SELECT TOP 10
product_id, product_name, brand_id, list_price
FROM production.products
ORDER BY list_price DESC;

--Ordenar do maior para o menor preço de venda