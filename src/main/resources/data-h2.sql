INSERT INTO category (id, name, created_at, updated_at) VALUES
                                                            ('11111111-1111-1111-1111-111111111111', 'FICTION', 1714000000000, 1714000000000),
                                                            ('22222222-2222-2222-2222-222222222222', 'NON_FICTION', 1714000000000, 1714000000000),
                                                            ('33333333-3333-3333-3333-333333333333', 'SCIENCE', 1714000000000, 1714000000000),
                                                            ('44444444-4444-4444-4444-444444444444', 'TECHNOLOGY', 1714000000000, 1714000000000),
                                                            ('55555555-5555-5555-5555-555555555555', 'HISTORY', 1714000000000, 1714000000000),
                                                            ('66666666-6666-6666-6666-666666666666', 'BIOGRAPHY', 1714000000000, 1714000000000),
                                                            ('77777777-7777-7777-7777-777777777777', 'FANTASY', 1714000000000, 1714000000000),
                                                            ('88888888-8888-8888-8888-888888888888', 'ROMANCE', 1714000000000, 1714000000000);

INSERT INTO authors
(id, first_name, middle_name, last_name, email, phone, date_of_birth, image_url, biography, created_at, updated_at)
VALUES
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa11', 'George', NULL, 'Orwell', 'orwell@mail.com', '9000000011', '1903-06-25', 'https://imgcdn.stablediffusionweb.com/2025/4/2/b899dce3-1718-4a41-8514-02dc5c3eeda6.jpg', 'Author of dystopian fiction.', 1714000000000, 1714000000000),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa12', 'J.R.R.', NULL, 'Tolkien', 'tolkien@mail.com', '9000000012', '1892-01-03', 'https://thewisestwords.com/wp-content/uploads/2024/12/image-5.png', 'Father of modern fantasy.', 1714000000000, 1714000000000),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa13', 'Harper', NULL, 'Lee', 'harper@mail.com', '9000000013', '1926-04-28', 'https://static.independent.co.uk/2025/03/04/14/Books_Harper_Lee_85045.jpg
', 'American novelist.', 1714000000000, 1714000000000),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa14', 'Patrick', NULL, 'Rothfuss', 'patrick@mail.com', '9000000014', '1973-06-06', 'https://tse3.mm.bing.net/th/id/OIP.Oks-uExcqX-_s_3mt-tE6gHaE7?pid=Api&P=0&h=180', 'Fantasy writer.', 1714000000000, 1714000000000),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa15', 'J.D.', NULL, 'Salinger', 'jd@mail.com', '9000000015', '1919-01-01', 'https://tse4.mm.bing.net/th/id/OIP.YVRcViCFE4kfQhici8VRsQHaFj?pid=Api&P=0&h=180', 'Known for modern literature.', 1714000000000, 1714000000000),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa16', 'Reki', NULL, 'Kawahara', 'reki@mail.com', '9000000016', '1974-08-17', 'https://tse2.mm.bing.net/th/id/OIP.syj1XnBz0Ilh-7bB9utffAAAAA?pid=Api&P=0&h=180', 'Author of Sword Art Online.', 1714000000000, 1714000000000),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa17', 'Yuu', NULL, 'Kamiya', 'yuu@mail.com', '9000000017', '1984-01-10', 'https://tse4.mm.bing.net/th/id/OIP.qTGhFyrAVlgGSl37DkqJQQAAAA?pid=Api&P=0&h=180
', 'Author of No Game No Life.', 1714000000000, 1714000000000),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa18', 'Tappei', NULL, 'Nagatsuki', 'tappei@mail.com', '9000000018', '1987-03-11', 'https://tse2.mm.bing.net/th/id/OIP.EmYdRxbbf3kGOBwFEbKK9wHaHa?pid=Api&P=0&h=180', 'Author of Re:Zero.', 1714000000000, 1714000000000),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa19', 'Fuse', NULL, '', 'fuse@mail.com', '9000000019', '1970-01-01', 'https://tse1.mm.bing.net/th/id/OIP.coficg8iNmKhTSzE4QYBMgHaHa?pid=Api&P=0&h=180', 'Author of Slime series.', 1714000000000, 1714000000000),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa20', 'Aneko', NULL, 'Yusagi', 'aneko@mail.com', '9000000020', '1980-01-01', 'https://tse2.mm.bing.net/th/id/OIP.Lim92hQ39pc8jlWkenG0dQHaL0?pid=Api&P=0&h=180', 'Author of Shield Hero.', 1714000000000, 1714000000000);

INSERT INTO books
(id, title, isbn, category_id, publisher, publish_date, description, total_copies, available_copies, shelf_location, pages, image_url, created_at, updated_at)
VALUES
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc01', '1984', 'ISBN-2001', '11111111-1111-1111-1111-111111111111', 'Secker & Warburg', '1949-06-08', 'Dystopian novel.', 10, 7, 'F1', 328, 'https://i.pinimg.com/originals/34/32/7b/34327bb6b076b56f11bfe8d72361b99a.jpg?nii=t', 1714000000000, 1714000000000),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc02', 'The Hobbit', 'ISBN-2002', '77777777-7777-7777-7777-777777777777', 'Allen & Unwin', '1937-09-21', 'Fantasy adventure.', 8, 5, 'F2', 310, 'https://tse2.mm.bing.net/th/id/OIP.XQvQw1SzR-G9UkhTRfavaQHaEn?pid=Api&P=0&h=180', 1714000000000, 1714000000000),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc03', 'To Kill a Mockingbird', 'ISBN-2003', '11111111-1111-1111-1111-111111111111', 'J.B. Lippincott', '1960-07-11', 'Classic novel.', 9, 6, 'F3', 281, 'https://tse1.mm.bing.net/th/id/OIP.1_UkQGNtw3auXivgSFr3XwHaKo?pid=Api&P=0&h=180', 1714000000000, 1714000000000),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc04', 'The Name of the Wind', 'ISBN-2004', '77777777-7777-7777-7777-777777777777', 'DAW Books', '2007-03-27', 'Epic fantasy.', 7, 4, 'F4', 662, 'https://tse3.mm.bing.net/th/id/OIP.6k7SbJrwTBPLn81-7nOksgHaLH?pid=Api&P=0&h=180', 1714000000000, 1714000000000),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc05', 'The Catcher in the Rye', 'ISBN-2005', '11111111-1111-1111-1111-111111111111', 'Little Brown', '1951-07-16', 'Coming-of-age.', 6, 3, 'F5', 277, 'https://tse2.mm.bing.net/th/id/OIP.2WwofUigvAOE5ra4QibF5wHaLw?pid=Api&P=0&h=180', 1714000000000, 1714000000000),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc06', 'Sword Art Online', 'ISBN-2006', '77777777-7777-7777-7777-777777777777', 'ASCII Media Works', '2009-04-10', 'VR game survival.', 12, 9, 'LN1', 250, 'https://i5.walmartimages.com/asr/2c7438e0-2ca1-4d52-9f2a-f14055fbf83a_1.6bd937e185722704f8405f8ddf2d11fe.jpeg', 1714000000000, 1714000000000),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc07', 'No Game No Life', 'ISBN-2007', '77777777-7777-7777-7777-777777777777', 'Media Factory', '2012-04-25', 'Game-based world.', 10, 8, 'LN2', 230, 'https://image.tmdb.org/t/p/original/cCBB6BGRj5nCTaEgogDtkHfjOLK.jpg', 1714000000000, 1714000000000),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc08', 'Re:Zero', 'ISBN-2008', '77777777-7777-7777-7777-777777777777', 'Media Factory', '2014-01-23', 'Time loop fantasy.', 9, 6, 'LN3', 300, 'https://tse3.mm.bing.net/th/id/OIP.giTwKSSQgBkCskegf-1DrwHaLH?pid=Api&P=0&h=180', 1714000000000, 1714000000000),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc09', 'That Time I Got Reincarnated as a Slime', 'ISBN-2009', '77777777-7777-7777-7777-777777777777', 'Micro Magazine', '2014-05-30', 'Reincarnation fantasy.', 11, 7, 'LN4', 280, 'https://englishlightnovels.com/wp-content/uploads/2020/05/that-time-i-got-reincarnated-as-a-slime-volume-8.jpg', 1714000000000, 1714000000000),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc10', 'The Rising of the Shield Hero', 'ISBN-2010', '77777777-7777-7777-7777-777777777777', 'Media Factory', '2013-08-22', 'Underdog hero story.', 8, 5, 'LN5', 290, 'https://tse4.mm.bing.net/th/id/OIP.4_r_W7rGY0UeuvGD5FpuZAHaHa?pid=Api&P=0&h=180', 1714000000000, 1714000000000);

INSERT INTO book_author (book_id, author_id) VALUES
                                                 ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc01', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa11'),
                                                 ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc02', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa12'),
                                                 ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc03', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa13'),
                                                 ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc04', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa14'),
                                                 ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc05', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa15'),
                                                 ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc06', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa16'),
                                                 ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc07', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa17'),
                                                 ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc08', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa18'),
                                                 ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc09', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa19'),
                                                 ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc10', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa20');