CREATE TABLE books (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title TEXT NOT NULL,
  author VARCHAR(60) NOT NULL,
  bookshelve_id INTEGER NOT NULL
);

CREATE TABLE bookshelves (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  code VARCHAR(6) NOT NULL,
  category_id INTEGER NOT NULL
);

CREATE TABLE categories (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(20)
);

CREATE TABLE borrowing (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  book_id INTEGER NOT NULL,
  member_id INTEGER NOT NULL,
  librarian_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT current_timestamp NOT NULL
);

CREATE TABLE members (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);

CREATE TABLE librarians (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(60) NOT NULL
);


ALTER TABLE "books" ADD FOREIGN KEY ("bookshelve_id") REFERENCES "bookshelves" ("id");

ALTER TABLE "bookshelves" ADD FOREIGN key ("category_id") REFERENCES "categories" ("id")

ALTER TABLE "borrowing" ADD FOREIGN KEY ("librarian_id") REFERENCES "librarians" ("id")

ALTER TABLE "borrowing" ADD FOREIGN KEY ("member_id") REFERENCES "members" ("id")

ALTER TABLE "borrowing" ADD FOREIGN KEY ("book_id") REFERENCES "books" ("id")


-- categories
INSERT INTO categories (name) VALUES
('Fiksi'),
('Non-Fiksi'),
('Sejarah'),
('Biografi'),
('Sastra');

-- bookshelves
INSERT INTO bookshelves (code, category_id) VALUES
('FIK-01', 1),
('FIK-02', 1),
('NF-01', 2),
('SEJ-01', 3),
('BIO-01', 4),
('SAS-01', 5);

-- books
INSERT INTO books (title, author, bookshelve_id) VALUES
('Laskar Pelangi', 'Andrea Hirata', 1),
('Sang Pemimpi', 'Andrea Hirata', 1),
('Negeri 5 Menara', 'Ahmad Fuadi', 2),
('Ranah 3 Warna', 'Ahmad Fuadi', 2),
('Bumi Manusia', 'Pramoedya Ananta Toer', 6),
('Anak Semua Bangsa', 'Pramoedya Ananta Toer', 6),
('Sejarah Indonesia Modern', 'Sartono Kartodirdjo', 4),
('Indonesia Menggugat', 'Soekarno', 4),
('Habibie dan Ainun', 'B.J. Habibie', 5),
('Catatan Najwa', 'Najwa Shihab', 3);

-- members
INSERT INTO members (name) VALUES
('Rina Andriani'),
('Budi Santoso'),
('Agus Pratama'),
('Siti Nurhaliza'),
('Dewi Lestari');

-- librarians
INSERT INTO librarians (name) VALUES
('Yuli Setiawan'),
('Darmawan Putra');

-- borrowing
INSERT INTO borrowing (book_id, member_id, librarian_id, created_at) VALUES
(1, 1, 1, '2025-08-20 10:15:00'),
(3, 2, 2, '2025-08-21 14:00:00'),
(5, 3, 1, '2025-08-22 09:30:00'),
(9, 4, 2, '2025-08-23 11:00:00'),
(2, 5, 1, '2025-08-24 15:45:00');
