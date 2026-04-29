
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
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa11', 'George', NULL, 'Orwell', 'orwell@mail.com', '9000000011', '1903-06-25', 'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Ftse2.mm.bing.net%2Fth%2Fid%2FOIP.CdtYy8u6G6qnSn56U25vSQHaH0%3Fpid%3DApi&sp=1777459683T6e7b3fee227ce1290b4759db74d4d22887164edba82339954b0711a8b373ad5a', 'Author of dystopian fiction.', 1714000000000, 1714000000000),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa12', 'J.R.R.', NULL, 'Tolkien', 'tolkien@mail.com', '9000000012', '1892-01-03', 'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Ftse3.mm.bing.net%2Fth%2Fid%2FOIP.yWLgwWwfQjtY6ka9QH4JswAAAA%3Fpid%3DApi&sp=1777459683T74f8736b16b9df7a6a5ae6f7d964537378f56514b9125df55275353e331ad33f', 'Father of modern fantasy.', 1714000000000, 1714000000000),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa13', 'Harper', NULL, 'Lee', 'harper@mail.com', '9000000013', '1926-04-28', 'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Ftse3.mm.bing.net%2Fth%2Fid%2FOIP.ei54EXuG4CELeq67e3nL8QHaHa%3Fpid%3DApi&sp=1777459683T335f5da2ea299fa95d4fc40bed6fd59683be9f52346909d8c2e36e82242c14b2', 'American novelist.', 1714000000000, 1714000000000),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa14', 'Patrick', NULL, 'Rothfuss', 'patrick@mail.com', '9000000014', '1973-06-06', 'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Ftse2.mm.bing.net%2Fth%2Fid%2FOIP.-vibPYBrSdU4KL0FYSIVVQHaEK%3Fr%3D0%26pid%3DApi&sp=1777459636Te634c597253676720fc03da832338d6b3c329eccad6c5ab6041991b7d6f7d801', 'Fantasy writer.', 1714000000000, 1714000000000),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa15', 'J.D.', NULL, 'Salinger', 'jd@mail.com', '9000000015', '1919-01-01', 'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Ftse2.mm.bing.net%2Fth%2Fid%2FOIP.q8pheate3zH6qwiVGvHxMAHaE8%3Fpid%3DApi&sp=1777459588Tf84e378c91719c7dbb51d0d9d61ed19e372df733d021f6af538176fcdc2b49f7', 'Known for modern literature.', 1714000000000, 1714000000000),

-- Japanese light novel authors
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa16', 'Reki', NULL, 'Kawahara', 'reki@mail.com', '9000000016', '1974-08-17', 'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Ftse4.mm.bing.net%2Fth%2Fid%2FOIP.3tYIcZLbkSZzc-lofGKR8wHaDt%3Fr%3D0%26pid%3DApi&sp=1777458827Tb70f0d604c0392975b1e2f913c681f3b1ba044e8e4a49b86de8aa0f99bf7dd54', 'Author of Sword Art Online.', 1714000000000, 1714000000000),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa17', 'Yuu', NULL, 'Kamiya', 'yuu@mail.com', '9000000017', '1984-01-10', 'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Ftse2.mm.bing.net%2Fth%2Fid%2FOIP.9why8sDfQsRiVPfjnzxQtwHaFc%3Fr%3D0%26pid%3DApi&sp=1777458827T820d4a6aba2afa16b16df540fa5bc8fde88243683340ac2de17ea58dda4ee238', 'Author of No Game No Life.', 1714000000000, 1714000000000),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa18', 'Tappei', NULL, 'Nagatsuki', 'tappei@mail.com', '9000000018', '1987-03-11', 'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Ftse4.mm.bing.net%2Fth%2Fid%2FOIP.sIoDHeP3h-DjY_YqxeCcTgHaE7%3Fr%3D0%26pid%3DApi&sp=1777458827T5e7d25b2c5c1d3ea6b71bd8fe1be6e9a67725450adea886125fafb574ac9ec73', 'Author of Re:Zero.', 1714000000000, 1714000000000),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa19', 'Fuse', NULL, '', 'fuse@mail.com', '9000000019', '1970-01-01', 'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Ftse4.mm.bing.net%2Fth%2Fid%2FOIP.L2urQbJxqlLPi4jyvVqR3gHaDt%3Fr%3D0%26pid%3DApi&sp=1777458827T3615e10bc63377dbaf49a487593947667d0f69cc05991440b76d78db7f52f923', 'Author of Slime series.', 1714000000000, 1714000000000),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaa20', 'Aneko', NULL, 'Yusagi', 'aneko@mail.com', '9000000020', '1980-01-01', 'https://www.startpage.com/av/proxy-image?piurl=http%3A%2F%2Fgood-hope.in%2Fcdn%2Fshop%2Ffiles%2Fzoro6.jpg%3Fv%3D1703835417&sp=1777457069T0548fca5e0ed21109a5949377d6aca6809c0d28c09348d1443d83916b6665dce', 'Author of Shield Hero.', 1714000000000, 1714000000000);


INSERT INTO books
(id, title, isbn, category_id, publisher, publish_date, description, total_copies, available_copies, shelf_location, pages, image_url, created_at, updated_at)
VALUES
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc01', '1984', 'ISBN-2001', '11111111-1111-1111-1111-111111111111', 'Secker & Warburg', '1949-06-08', 'Dystopian novel.', 10, 7, 'F1', 328, 'https://upload.wikimedia.org/wikipedia/commons/5/51/1984_first_edition_cover.jpg', 1714000000000, 1714000000000),

('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc02', 'The Hobbit', 'ISBN-2002', '77777777-7777-7777-7777-777777777777', 'Allen & Unwin', '1937-09-21', 'Fantasy adventure.', 8, 5, 'F2', 310, 'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Fwww.themoviedb.org%2Ft%2Fp%2Fw600_and_h900_bestv2%2FoAWcjYgMTRulnhpphuqvKnRwKOG.jpg&sp=1777458827T0806baf0949bb686ed541190f0fefad1bb6e92e03f8e4d1f9bff820add089d7c', 1714000000000, 1714000000000),

('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc03', 'To Kill a Mockingbird', 'ISBN-2003', '11111111-1111-1111-1111-111111111111', 'J.B. Lippincott', '1960-07-11', 'Classic novel.', 9, 6, 'F3', 281, 'https://en.wikipedia.org/wiki/File:To_Kill_a_Mockingbird_(first_edition_cover).jpg', 1714000000000, 1714000000000),

('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc04', 'The Name of the Wind', 'ISBN-2004', '77777777-7777-7777-7777-777777777777', 'DAW Books', '2007-03-27', 'Epic fantasy.', 7, 4, 'F4', 662, 'https://en.wikipedia.org/wiki/File:TheNameoftheWind_cover.jpg', 1714000000000, 1714000000000),

('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc05', 'The Catcher in the Rye', 'ISBN-2005', '11111111-1111-1111-1111-111111111111', 'Little Brown', '1951-07-16', 'Coming-of-age.', 6, 3, 'F5', 277, 'https://en.wikipedia.org/wiki/File:The_Catcher_in_the_Rye_(1951,_first_edition_cover).jpg', 1714000000000, 1714000000000),

-- Light novels
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc06', 'Sword Art Online', 'ISBN-2006', '77777777-7777-7777-7777-777777777777', 'ASCII Media Works', '2009-04-10', 'VR game survival.', 12, 9, 'LN1', 250, 'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Fwallpapers.com%2Fimages%2Fhd%2Fsword-art-online-wallpaper-javjk4u0ar7tbyeu.jpg&sp=1777459012T23c02657373dd0c0afcd144b44c55af581289eeec579b0787b66b286250be6fd', 1714000000000, 1714000000000),

('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc07', 'No Game No Life', 'ISBN-2007', '77777777-7777-7777-7777-777777777777', 'Media Factory', '2012-04-25', 'Game-based world.', 10, 8, 'LN2', 230, 'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Ftse2.mm.bing.net%2Fth%2Fid%2FOIP.UaBMFzijpTPA1hY85FT7RAHaEK%3Fr%3D0%26pid%3DApi&sp=1777459050T076a5b672f0e090efdcf57770cff6840dd2356ee8ba2f41f2f195f6c302b358b', 1714000000000, 1714000000000),

('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc08', 'Re:Zero', 'ISBN-2008', '77777777-7777-7777-7777-777777777777', 'Media Factory', '2014-01-23', 'Time loop fantasy.', 9, 6, 'LN3', 300, 'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Ftse4.mm.bing.net%2Fth%2Fid%2FOIP.1Pnf5hzRXHO9SpQ18g0qtwHaFj%3Fr%3D0%26pid%3DApi&sp=1777459093Tf607553fa9050fb98e36884881dcd518f85ddebe63d13a4c57b9a7693e36eeb9', 1714000000000, 1714000000000),

('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc09', 'That Time I Got Reincarnated as a Slime', 'ISBN-2009', '77777777-7777-7777-7777-777777777777', 'Micro Magazine', '2014-05-30', 'Reincarnation fantasy.', 11, 7, 'LN4', 280, 'https://shield-hero.fandom.com/wiki/File:LNv22illus.jpg', 1714000000000, 1714000000000),

('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc10', 'The Rising of the Shield Hero', 'ISBN-2010', '77777777-7777-7777-7777-777777777777', 'Media Factory', '2013-08-22', 'Underdog hero story.', 8, 5, 'LN5', 290, 'https://shield-hero.fandom.com/wiki/File:LNv22chara.jpg', 1714000000000, 1714000000000);


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