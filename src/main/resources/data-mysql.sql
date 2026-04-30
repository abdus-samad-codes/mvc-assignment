SET @now = 1714000000000;

INSERT INTO category (id, name, created_at, updated_at) VALUES
                                                            (UUID_TO_BIN('11111111-1111-1111-1111-111111111111'), 'FICTION', @now, @now),
                                                            (UUID_TO_BIN('22222222-2222-2222-2222-222222222222'), 'NON_FICTION', @now, @now),
                                                            (UUID_TO_BIN('33333333-3333-3333-3333-333333333333'), 'SCIENCE', @now, @now),
                                                            (UUID_TO_BIN('44444444-4444-4444-4444-444444444444'), 'TECHNOLOGY', @now, @now),
                                                            (UUID_TO_BIN('55555555-5555-5555-5555-555555555555'), 'HISTORY', @now, @now),
                                                            (UUID_TO_BIN('66666666-6666-6666-6666-666666666666'), 'BIOGRAPHY', @now, @now),
                                                            (UUID_TO_BIN('77777777-7777-7777-7777-777777777777'), 'FANTASY', @now, @now),
                                                            (UUID_TO_BIN('88888888-8888-8888-8888-888888888888'), 'ROMANCE', @now, @now);

INSERT INTO authors
(id, first_name, middle_name, last_name, email, phone, date_of_birth, image_url, biography, created_at, updated_at)
VALUES
    (UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa11'), 'George', NULL, 'Orwell', 'orwell@mail.com', '9000000011', '1903-06-25', 'https://example.com/orwell.jpg', 'Author of dystopian fiction.', @now, @now),
    (UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa12'), 'J.R.R.', NULL, 'Tolkien', 'tolkien@mail.com', '9000000012', '1892-01-03', 'https://example.com/tolkien.jpg', 'Father of modern fantasy.', @now, @now),
    (UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa13'), 'Harper', NULL, 'Lee', 'harper@mail.com', '9000000013', '1926-04-28', 'https://example.com/harper.jpg', 'American novelist.', @now, @now),
    (UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa14'), 'Patrick', NULL, 'Rothfuss', 'patrick@mail.com', '9000000014', '1973-06-06', 'https://example.com/patrick.jpg', 'Fantasy writer.', @now, @now),
    (UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa15'), 'J.D.', NULL, 'Salinger', 'jd@mail.com', '9000000015', '1919-01-01', 'https://example.com/salinger.jpg', 'Known for modern literature.', @now, @now),
    (UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa16'), 'Reki', NULL, 'Kawahara', 'reki@mail.com', '9000000016', '1974-08-17', 'https://example.com/reki.jpg', 'Author of Sword Art Online.', @now, @now),
    (UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa17'), 'Yuu', NULL, 'Kamiya', 'yuu@mail.com', '9000000017', '1984-01-10', 'https://example.com/yuu.jpg', 'Author of No Game No Life.', @now, @now),
    (UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa18'), 'Tappei', NULL, 'Nagatsuki', 'tappei@mail.com', '9000000018', '1987-03-11', 'https://example.com/tappei.jpg', 'Author of Re:Zero.', @now, @now),
    (UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa19'), 'Fuse', NULL, '', 'fuse@mail.com', '9000000019', '1970-01-01', 'https://example.com/fuse.jpg', 'Author of Slime series.', @now, @now),
    (UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa20'), 'Aneko', NULL, 'Yusagi', 'aneko@mail.com', '9000000020', '1980-01-01', 'https://example.com/aneko.jpg', 'Author of Shield Hero.', @now, @now);

INSERT INTO books
(id, title, isbn, category_id, publisher, publish_date, description, total_copies, available_copies, shelf_location, pages, image_url, created_at, updated_at)
VALUES
    (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc01'), '1984', 'ISBN-2001', UUID_TO_BIN('11111111-1111-1111-1111-111111111111'), 'Secker & Warburg', '1949-06-08', 'Dystopian novel.', 10, 7, 'F1', 328, 'https://example.com/1984.jpg', @now, @now),
    (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc02'), 'The Hobbit', 'ISBN-2002', UUID_TO_BIN('77777777-7777-7777-7777-777777777777'), 'Allen & Unwin', '1937-09-21', 'Fantasy adventure.', 8, 5, 'F2', 310, 'https://example.com/hobbit.jpg', @now, @now),
    (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc03'), 'To Kill a Mockingbird', 'ISBN-2003', UUID_TO_BIN('11111111-1111-1111-1111-111111111111'), 'J.B. Lippincott', '1960-07-11', 'Classic novel.', 9, 6, 'F3', 281, 'https://example.com/mockingbird.jpg', @now, @now),
    (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc04'), 'The Name of the Wind', 'ISBN-2004', UUID_TO_BIN('77777777-7777-7777-7777-777777777777'), 'DAW Books', '2007-03-27', 'Epic fantasy.', 7, 4, 'F4', 662, 'https://example.com/name-of-the-wind.jpg', @now, @now),
    (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc05'), 'The Catcher in the Rye', 'ISBN-2005', UUID_TO_BIN('11111111-1111-1111-1111-111111111111'), 'Little Brown', '1951-07-16', 'Coming-of-age.', 6, 3, 'F5', 277, 'https://example.com/catcher.jpg', @now, @now),
    (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc06'), 'Sword Art Online', 'ISBN-2006', UUID_TO_BIN('77777777-7777-7777-7777-777777777777'), 'ASCII Media Works', '2009-04-10', 'VR game survival.', 12, 9, 'LN1', 250, 'https://example.com/sao.jpg', @now, @now),
    (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc07'), 'No Game No Life', 'ISBN-2007', UUID_TO_BIN('77777777-7777-7777-7777-777777777777'), 'Media Factory', '2012-04-25', 'Game-based world.', 10, 8, 'LN2', 230, 'https://example.com/ngnl.jpg', @now, @now),
    (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc08'), 'Re:Zero', 'ISBN-2008', UUID_TO_BIN('77777777-7777-7777-7777-777777777777'), 'Media Factory', '2014-01-23', 'Time loop fantasy.', 9, 6, 'LN3', 300, 'https://example.com/rezero.jpg', @now, @now),
    (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc09'), 'That Time I Got Reincarnated as a Slime', 'ISBN-2009', UUID_TO_BIN('77777777-7777-7777-7777-777777777777'), 'Micro Magazine', '2014-05-30', 'Reincarnation fantasy.', 11, 7, 'LN4', 280, 'https://example.com/slime.jpg', @now, @now),
    (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc10'), 'The Rising of the Shield Hero', 'ISBN-2010', UUID_TO_BIN('77777777-7777-7777-7777-777777777777'), 'Media Factory', '2013-08-22', 'Underdog hero story.', 8, 5, 'LN5', 290, 'https://example.com/shield-hero.jpg', @now, @now);

INSERT INTO book_author (book_id, author_id) VALUES
                                                 (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc01'), UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa11')),
                                                 (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc02'), UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa12')),
                                                 (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc03'), UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa13')),
                                                 (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc04'), UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa14')),
                                                 (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc05'), UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa15')),
                                                 (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc06'), UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa16')),
                                                 (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc07'), UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa17')),
                                                 (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc08'), UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa18')),
                                                 (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc09'), UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa19')),
                                                 (UUID_TO_BIN('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc10'), UUID_TO_BIN('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa20'));