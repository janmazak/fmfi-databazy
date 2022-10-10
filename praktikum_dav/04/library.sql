DROP TABLE IF EXISTS borrowing;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS reader;

CREATE TABLE reader (
	id_r INTEGER PRIMARY KEY,
	name TEXT,
	registration DATE
);

CREATE TABLE book (
	id_b INTEGER PRIMARY KEY,
	title TEXT,
	author TEXT
);

CREATE TABLE borrowing (
	id_b INTEGER,
	id_r INTEGER,
	borrowingDate DATE,
	returnDate DATE
);

/* Advice for adding data:

Do not use long meaningless names for TEXT fields.

Use meaningful names for entries with specific properties, e.g. 'readerThatNeverBorrowed' instead of some name you are familiar with, but does not hint at properties relevant to the database.

Alternatively, use short artificial names for both people and books, e.g. 'r01' and 'r02' for readers and 'b01' for a book. It would be easier to extend the dataset later.

*/

