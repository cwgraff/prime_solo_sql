
—- Which authors are represented in our store?
SELECT first_name, last_name FROM authors;


—- Which authors are also distinguished authors?
SELECT first_name, last_name FROM distinguished_authors;


—- Which authors are not distinguished authors?
SELECT authors.first_name, authors.last_name FROM authors LEFT JOIN distinguished_authors
ON authors.last_name = distinguished_authors.last_name
WHERE award IS NULL;


—- How many authors are represented in our store?
SELECT COUNT(*) FROM authors;


—- Who are the favorite authors of the employee with the first name of Michael?
SELECT authors_and_titles FROM employees JOIN favorite_authors
ON employees.id = favorite_authors.employee_id
WHERE first_name='Michael';


—- What are the titles of all the books that are in stock today?
SELECT title from books JOIN editions
ON books.id = editions.book_id
JOIN daily_inventory
ON editions.isbn = daily_inventory.isbn
WHERE is_stocked = true;


—- Insert one of your favorite books into the database. Hint: You’ll want to create data 	in at least 2 other tables to completely create this book.
INSERT INTO authors (last_name, first_name, id)
    VALUES ('Zahn', 'Timothy', 9876);

INSERT INTO books (id, title, author_id, subject_id)
    VALUES (989898, 'Heir to the Empire', 9876, 98);

INSERT INTO editions (isbn, book_id, edition)
    VALUES (0909090909, 989898, 3);


—- What authors have books that are not in stock?
SELECT first_name, last_name FROM authors JOIN books
ON authors.id = books.author_id
JOIN editions
ON books.id = editions.book_id
JOIN stock
ON editions.isbn = stock.isbn
WHERE stock.stock = 0;


—- What is the title of the book that has the most stock?
SELECT title from books JOIN editions
ON books.id = editions.book_id
JOIN stock
ON editions.isbn = stock.isbn
ORDER BY stock.stock DESC LIMIT 1;




