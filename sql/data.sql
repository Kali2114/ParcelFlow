INSERT INTO weight_tariffs (weight_from, weight_to, price) VALUES
    (0.1, 5, 5),
    (5.01, 10, 10),
    (10.01, 20, 20),
    (20.01, 100, 30);


INSERT INTO event_types (code, title) VALUES
    ('pickup', 'Picked up from sender by courier'),
    ('arrival', 'Arrived at facility'),
    ('loading', 'Loaded onto truck'),
    ('out_for_delivery', 'Handed over to courier for delivery'),
    ('delivery', 'Parcel delivered to customer'),
    ('delivery_attempt', 'Recipient not at home'),
    ('refusal', 'Customer refused delivery'),
    ('rescheduling', 'Delivery rescheduled');


INSERT INTO facilities (hub_id, name, facility_type, street, postal_code, city) VALUES
    (NULL, 'HUB_WAW', 'hub', 'Zembaczynskiego 12', '00-321', 'Warszawa'),
    (NULL, 'HUB_LDZ', 'hub', 'Biejat 33', '91-400', 'Lodz'),
    (1, 'BR_SDE', 'branch', 'Starzynskiego 31', '08-110', 'Siedlce'),
    (1, 'BR_LBN', 'branch', 'Zukowskiej 99', '20-111', 'Lublin'),
    (1, 'BR_BIA', 'branch', 'Pilsudzkiego 99', '15-312', 'Bialystok'),
    (1, 'BR_GDA', 'branch', 'Komarowa 12', '80-172', 'Gdansk'),
    (2, 'BR_BDG', 'branch', 'Litaja 12', '85-003', 'Bydgoszcz'),
    (2, 'BR_SCZ', 'branch', 'Konopa 94', '71-813', 'Szczecin'),
    (2, 'BR_KRK', 'branch', 'Lejmana 2', '31-777', 'Krakow'),
    (2, 'BR_KAT', 'branch', 'Pisklaka 94', '40-842', 'Katowice');


INSERT INTO customers (customer_type, name, nip, email, phone, street, postal_code, city) VALUES
    ('person', 'Angjel Dust', NULL, 'angeldust@gmail.com', '+48504251809', 'Jagielly 10', '08-110', 'Siedlce'),
    ('person', 'Kamiljeg Changmil', NULL, 'chang@gmail.com', '+48504253809', 'Oginskich 66', '08-110', 'Siedlce'),
    ('person', 'Ignacy Paderewski', NULL, 'ignacy@gmail.com', '+48155321809', 'Mazowiecka 1', '00-110', 'Warszawa'),
    ('company', 'Intel Company', '1928098332', 'intel@gmail.com', '+48993212345', 'Konduktorska 84', '00-156', 'Warszawa'),
    ('company', 'Siemens Opposite Conc.', '9888732832', 'pakistanczyk@gmail.com', '+48732128888', 'Siedlecka 20', '40-777', 'Katowice'),
    ('person', 'Marta Wisniewska', NULL, 'marta.wisniewska@gmail.com', '+48601234501', 'Kwiatowa 7', '20-001', 'Lublin'),
    ('person', 'Piotr Zielinski', NULL, 'piotr.zielinski@wp.pl', '+48601234502', 'Lipowa 15', '15-001', 'Bialystok'),
    ('person', 'Anna Kaczmarek', NULL, 'anna.kaczmarek@onet.pl', '+48601234503', 'Dluga 3', '80-001', 'Gdansk'),
    ('person', 'Tomasz Lewandowski', NULL, 'tomasz.lew@gmail.com', '+48601234504', 'Polna 22', '85-001', 'Bydgoszcz'),
    ('person', 'Katarzyna Dabrowska', NULL, 'kasia.dabrowska@gmail.com', '+48601234505', 'Szkolna 9', '31-001', 'Krakow'),
    ('person', 'Michal Wojcik', NULL, 'michal.wojcik@interia.pl', '+48601234506', 'Ogrodowa 41', '40-001', 'Katowice'),
    ('person', 'Agnieszka Mazur', NULL, 'aga.mazur@gmail.com', '+48601234507', 'Lesna 12', '00-950', 'Warszawa'),
    ('person', 'Pawel Krawczyk', NULL, 'pawel.krawczyk@wp.pl', '+48601234508', 'Sloneczna 5', '08-110', 'Siedlce'),
    ('person', 'Ewa Grabowska', NULL, 'ewa.grabowska@onet.pl', '+48601234509', 'Krotka 2', '91-001', 'Lodz'),
    ('company', 'Mebloteka S.A.', '5213456781', 'biuro@mebloteka.pl', '+48223456701', 'Przemyslowa 18', '00-801', 'Warszawa'),
    ('company', 'Kowalski Transport Sp. z o.o.', '8212345672', 'kontakt@kowalskitransport.pl', '+48256321402', 'Brzeska 101', '08-110', 'Siedlce'),
    ('company', 'Bursztynowy Sklep Sp. z o.o.', '5831234563', 'sklep@bursztynowy.pl', '+48583012303', 'Mariacka 8', '80-833', 'Gdansk'),
    ('company', 'Gorska Kawa S.C.', '6751234564', 'zamowienia@gorskakawa.pl', '+48124221104', 'Florianska 30', '31-019', 'Krakow'),
    ('company', 'Elektro-Pol Sp. z o.o.', '9541234565', 'sprzedaz@elektropol.pl', '+48322001105', 'Chorzowska 150', '40-101', 'Katowice'),
    ('company', 'Agro-Lub Sp. z o.o.', '9461234566', 'biuro@agrolub.pl', '+48815321106', 'Fabryczna 4', '20-301', 'Lublin');


INSERT INTO employees (first_name, last_name, role, hire_date, facility_id, supervisor_id) VALUES
    ('Changmil', 'Changlicki', 'branch_manager', '1990-01-01', 1, NULL),  -- 1 HUB_WAW manager
    ('Robert', 'Nowicki', 'branch_manager', '2012-04-02', 2, NULL),  -- 2 HUB_LDZ manager
    ('Joanna', 'Sikora', 'shift_manager', '2015-09-01', 1, 1),  -- 3 HUB_WAW
    ('Marek', 'Baran', 'shift_manager', '2016-02-15', 2, 2),  -- 4 HUB_LDZ
    ('Krzysztof', 'Wrobel', 'driver', '2018-05-07', 1, 3),  -- 5
    ('Lukasz', 'Pietrzak', 'driver', '2020-11-16', 1, 3),  -- 6
    ('Dariusz', 'Kubiak', 'driver', '2017-03-20', 2, 4),  -- 7
    ('Grzegorz', 'Sowa', 'driver', '2022-06-01', 2, 4),  -- 8
    ('Beata', 'Michalska', 'warehouse_worker', '2019-08-12', 1, 3),  -- 9
    ('Adrian', 'Jasinski', 'warehouse_worker', '2021-01-04', 2, 4),  -- 10
    ('Monika', 'Zawadzka', 'shift_manager', '2014-10-01', 3, 1),  -- 11 BR_SDE
    ('Karolina', 'Wieczorek', 'dispatcher', '2019-03-11', 3, 11),  -- 12 claims reviewer
    ('Sebastian', 'Duda', 'dispatcher', '2023-02-20', 2, 4),  -- 13 claims reviewer
    ('Rafal', 'Olszewski', 'courier', '2020-04-14', 3, 11),  -- 14 BR_SDE
    ('Damian', 'Stepien', 'courier', '2021-07-19', 4, 3),  -- 15 BR_LBN
    ('Patryk', 'Malinowski', 'courier', '2022-09-05', 5, 3),  -- 16 BR_BIA
    ('Kamil', 'Jakubowski', 'courier', '2018-12-03', 6, 3),  -- 17 BR_GDA
    ('Bartosz', 'Kolodziej', 'courier', '2023-05-22', 7, 4),  -- 18 BR_BDG
    ('Natalia', 'Szymanska', 'courier', '2024-01-08', 9, 4),  -- 19 BR_KRK
    ('Wojciech', 'Kalinowski', 'courier', '2019-06-17', 10, 4),  -- 20 BR_KAT
    ('Iwona', 'Ostrowska', 'warehouse_worker', '2024-09-02', 10, 4),  -- 21 BR_KAT
    ('Hubert', 'Lis', 'courier', '2025-03-03', 3, 11),  -- 22 BR_SDE
    ('Szymon', 'Kurek', 'courier', '2021-10-11', 1, 3),  -- 23 HUB_WAW courier (Warsaw pickups and deliveries)
    ('Daria', 'Lasota', 'courier', '2022-03-28', 2, 4),  -- 24 HUB_LDZ courier (Lodz pickups and deliveries)
    ('Tadeusz', 'Gorecki', 'driver', '2016-08-22', 1, 3),  -- 25 HUB_WAW
    ('Kamila', 'Borowska', 'driver', '2023-04-17', 1, 3),  -- 26 HUB_WAW
    ('Henryk', 'Szulc', 'driver', '2015-01-12', 2, 4),  -- 27 HUB_LDZ
    ('Leszek', 'Wrona', 'driver', '2024-06-03', 2, 4);  -- 28 HUB_LDZ


INSERT INTO vehicles (plate_number, vehicle_type, model, capacity_kg, base_facility_id) VALUES
    ('WI 4821K', 'truck', 'Volvo FH 460', 18000.00, 1),       -- 1 HUB_WAW
    ('WI 7390M', 'truck', 'Scania R 450', 18000.00, 1),       -- 2 HUB_WAW
    ('EL 1257T', 'truck', 'MAN TGX 18.470', 19000.00, 2),     -- 3 HUB_LDZ
    ('EL 6634P', 'truck', 'DAF XF 480', 18500.00, 2),         -- 4 HUB_LDZ
    ('WSI 2045A', 'van', 'Mercedes Sprinter', 1200.00, 3),    -- 5 BR_SDE
    ('LU 3378C', 'van', 'Ford Transit', 1100.00, 4),          -- 6 BR_LBN
    ('GD 9012F', 'van', 'Renault Master', 1300.00, 6),        -- 7 BR_GDA
    ('KR 5541N', 'van', 'Iveco Daily', 1400.00, 9),           -- 8 BR_KRK
    ('SK 8806W', 'van', 'Volkswagen Crafter', 1200.00, 10),   -- 9 BR_KAT
    ('WI 1189R', 'truck', 'Volvo FH 500', 20000.00, 1),       -- 10 HUB_WAW
    ('WI 5520S', 'truck', 'Mercedes Actros', 18000.00, 1),    -- 11 HUB_WAW
    ('EL 2961H', 'truck', 'Scania S 500', 20000.00, 2),       -- 12 HUB_LDZ
    ('EL 8417D', 'truck', 'Renault T 480', 18000.00, 2);      -- 13 HUB_LDZ


INSERT INTO shipments (receiver_first_name, receiver_last_name, receiver_phone_number, receiver_street, receiver_postal_code, receiver_city, tracking_number, sender_id, destination_facility_id, origin_facility_id, weight_kg, price, cod, shipping_date) VALUES
    ('Oskar', 'Pawlak', '+48799010119', 'Szkolna 9', '20-474', 'Lublin', '794600000001', 16, 4, 3, 5.01, (SELECT price FROM weight_tariffs WHERE 5.01 BETWEEN weight_from AND weight_to), 49.99, '2026-10-03 11:00:00'),  -- 1 SDE -> LBN
    ('Igor', 'Zajac', '+48668941402', 'Lipowa 96', '15-936', 'Bialystok', '794600000002', 15, 5, 1, 5.00, (SELECT price FROM weight_tariffs WHERE 5.00 BETWEEN weight_from AND weight_to), 250.0, '2026-10-03 15:15:00'),  -- 2 HUB_WAW -> BIA
    ('Ola', 'Kowalczyk', '+48714426514', 'Lesna 20', '80-765', 'Gdansk', '794600000003', 16, 6, 3, 9.50, (SELECT price FROM weight_tariffs WHERE 9.50 BETWEEN weight_from AND weight_to), NULL, '2026-10-03 10:55:00'),  -- 3 SDE -> GDA
    ('Szymon', 'Majewski', '+48726645405', 'Klonowa 111', '08-110', 'Siedlce', '794600000004', 18, 3, 9, 78.00, (SELECT price FROM weight_tariffs WHERE 78.00 BETWEEN weight_from AND weight_to), NULL, '2026-10-07 14:55:00'),  -- 4 KRK -> SDE
    ('Natalia', 'Krol', '+48788283750', 'Spacerowa 1', '00-697', 'Warszawa', '794600000005', 6, 1, 4, 6.40, (SELECT price FROM weight_tariffs WHERE 6.40 BETWEEN weight_from AND weight_to), 120.5, '2026-10-07 09:30:00'),  -- 5 LBN -> HUB_WAW
    ('Marcin', 'Nowakowski', '+48595912998', 'Ogrodowa 70', '15-996', 'Bialystok', '794600000006', 5, 5, 10, 22.50, (SELECT price FROM weight_tariffs WHERE 22.50 BETWEEN weight_from AND weight_to), 640.0, '2026-10-07 12:25:00'),  -- 6 KAT -> BIA
    ('Maja', 'Ostrowski', '+48510456496', 'Lesna 11', '00-614', 'Warszawa', '794600000007', 11, 1, 10, 2.50, (SELECT price FROM weight_tariffs WHERE 2.50 BETWEEN weight_from AND weight_to), 120.5, '2026-10-11 11:00:00'),  -- 7 KAT -> HUB_WAW
    ('Igor', 'Rutkowski', NULL, 'Parkowa 55', '40-836', 'Katowice', '794600000008', 16, 10, 3, 35.00, (SELECT price FROM weight_tariffs WHERE 35.00 BETWEEN weight_from AND weight_to), 89.0, '2026-10-11 15:15:00'),  -- 8 SDE -> KAT
    ('Szymon', 'Walczak', '+48607992155', 'Lesna 32', '15-952', 'Bialystok', '794600000009', 15, 5, 1, 7.30, (SELECT price FROM weight_tariffs WHERE 7.30 BETWEEN weight_from AND weight_to), NULL, '2026-10-11 13:55:00'),  -- 9 HUB_WAW -> BIA
    ('Adam', 'Jablonski', '+48797384352', 'Lesna 116', '15-066', 'Bialystok', '794600000010', 13, 5, 3, 5.01, (SELECT price FROM weight_tariffs WHERE 5.01 BETWEEN weight_from AND weight_to), NULL, '2026-10-15 08:10:00'),  -- 10 SDE -> BIA
    ('Wiktoria', 'Zajac', '+48776035466', 'Sosnowa 120', '90-881', 'Lodz', '794600000011', 4, 2, 1, 5.01, (SELECT price FROM weight_tariffs WHERE 5.01 BETWEEN weight_from AND weight_to), NULL, '2026-10-15 15:25:00'),  -- 11 HUB_WAW -> HUB_LDZ
    ('Natalia', 'Witkowski', '+48718538654', 'Spacerowa 111', '40-249', 'Katowice', '794600000012', 10, 10, 9, 5.00, (SELECT price FROM weight_tariffs WHERE 5.00 BETWEEN weight_from AND weight_to), NULL, '2026-10-15 14:40:00'),  -- 12 KRK -> KAT
    ('Maja', 'Wieczorek', '+48552837693', 'Lipowa 69', '00-690', 'Warszawa', '794600000013', 5, 1, 10, 0.80, (SELECT price FROM weight_tariffs WHERE 0.80 BETWEEN weight_from AND weight_to), NULL, '2026-10-19 13:10:00'),  -- 13 KAT -> HUB_WAW
    ('Wiktoria', 'Kaminski', '+48649542787', 'Polna 84', '40-144', 'Katowice', '794600000014', 2, 10, 3, 18.60, (SELECT price FROM weight_tariffs WHERE 18.60 BETWEEN weight_from AND weight_to), NULL, '2026-10-19 09:55:00'),  -- 14 SDE -> KAT
    ('Julia', 'Pawlak', NULL, 'Polna 22', '00-993', 'Warszawa', '794600000015', 19, 1, 10, 5.01, (SELECT price FROM weight_tariffs WHERE 5.01 BETWEEN weight_from AND weight_to), NULL, '2026-10-19 15:55:00'),  -- 15 KAT -> HUB_WAW
    ('Marcin', 'Wieczorek', '+48642379807', 'Szkolna 28', '30-003', 'Krakow', '794600000016', 17, 9, 6, 18.60, (SELECT price FROM weight_tariffs WHERE 18.60 BETWEEN weight_from AND weight_to), NULL, '2026-10-23 16:55:00'),  -- 16 GDA -> KRK
    ('Szymon', 'Rutkowski', '+48532726345', 'Ogrodowa 8', '00-594', 'Warszawa', '794600000017', 17, 1, 6, 8.80, (SELECT price FROM weight_tariffs WHERE 8.80 BETWEEN weight_from AND weight_to), NULL, '2026-10-23 17:55:00'),  -- 17 GDA -> HUB_WAW
    ('Zofia', 'Ostrowski', NULL, 'Lipowa 75', '90-872', 'Lodz', '794600000018', 8, 2, 6, 78.00, (SELECT price FROM weight_tariffs WHERE 78.00 BETWEEN weight_from AND weight_to), NULL, '2026-10-23 11:45:00'),  -- 18 GDA -> HUB_LDZ
    ('Julia', 'Dudek', NULL, 'Lipowa 34', '00-635', 'Warszawa', '794600000019', 19, 1, 10, 52.00, (SELECT price FROM weight_tariffs WHERE 52.00 BETWEEN weight_from AND weight_to), NULL, '2026-10-27 13:30:00'),  -- 19 KAT -> HUB_WAW
    ('Jakub', 'Tomaszewski', '+48661059704', 'Parkowa 13', '30-135', 'Krakow', '794600000020', 4, 9, 1, 18.60, (SELECT price FROM weight_tariffs WHERE 18.60 BETWEEN weight_from AND weight_to), NULL, '2026-10-27 09:00:00'),  -- 20 HUB_WAW -> KRK
    ('Maja', 'Nowakowski', '+48771594777', 'Szkolna 21', '08-110', 'Siedlce', '794600000021', 3, 3, 1, 6.40, (SELECT price FROM weight_tariffs WHERE 6.40 BETWEEN weight_from AND weight_to), NULL, '2026-10-27 13:10:00'),  -- 21 HUB_WAW -> SDE
    ('Wiktoria', 'Adamczyk', '+48662412652', 'Akacjowa 14', '40-854', 'Katowice', '794600000022', 12, 10, 1, 78.00, (SELECT price FROM weight_tariffs WHERE 78.00 BETWEEN weight_from AND weight_to), 640.0, '2026-10-31 16:00:00'),  -- 22 HUB_WAW -> KAT
    ('Oskar', 'Wieczorek', '+48557464501', 'Akacjowa 82', '08-110', 'Siedlce', '794600000023', 18, 3, 9, 35.00, (SELECT price FROM weight_tariffs WHERE 35.00 BETWEEN weight_from AND weight_to), NULL, '2026-10-31 12:25:00'),  -- 23 KRK -> SDE
    ('Jan', 'Dudek', '+48527272449', 'Ogrodowa 82', '15-518', 'Bialystok', '794600000024', 10, 5, 9, 1.20, (SELECT price FROM weight_tariffs WHERE 1.20 BETWEEN weight_from AND weight_to), NULL, '2026-10-31 12:00:00'),  -- 24 KRK -> BIA
    ('Marcin', 'Michalak', '+48796181171', 'Polna 107', '80-166', 'Gdansk', '794600000025', 2, 6, 3, 14.20, (SELECT price FROM weight_tariffs WHERE 14.20 BETWEEN weight_from AND weight_to), NULL, '2026-11-04 09:10:00'),  -- 25 SDE -> GDA
    ('Hanna', 'Wieczorek', '+48730739986', 'Akacjowa 32', '80-597', 'Gdansk', '794600000026', 19, 6, 10, 3.90, (SELECT price FROM weight_tariffs WHERE 3.90 BETWEEN weight_from AND weight_to), NULL, '2026-11-04 13:00:00'),  -- 26 KAT -> GDA
    ('Natalia', 'Nowak', '+48718172199', 'Ogrodowa 95', '90-363', 'Lodz', '794600000027', 20, 2, 4, 78.00, (SELECT price FROM weight_tariffs WHERE 78.00 BETWEEN weight_from AND weight_to), 89.0, '2026-11-04 10:15:00'),  -- 27 LBN -> HUB_LDZ
    ('Adam', 'Sikorski', '+48633233772', 'Lipowa 26', '85-802', 'Bydgoszcz', '794600000028', 13, 7, 3, 6.40, (SELECT price FROM weight_tariffs WHERE 6.40 BETWEEN weight_from AND weight_to), NULL, '2026-11-08 09:45:00'),  -- 28 SDE -> BDG
    ('Oskar', 'Majewski', '+48622189399', 'Lesna 99', '40-359', 'Katowice', '794600000029', 15, 10, 1, 5.01, (SELECT price FROM weight_tariffs WHERE 5.01 BETWEEN weight_from AND weight_to), NULL, '2026-11-08 11:45:00'),  -- 29 HUB_WAW -> KAT
    ('Igor', 'Krol', '+48714575699', 'Parkowa 34', '80-360', 'Gdansk', '794600000030', 15, 6, 1, 35.00, (SELECT price FROM weight_tariffs WHERE 35.00 BETWEEN weight_from AND weight_to), NULL, '2026-11-08 08:10:00'),  -- 30 HUB_WAW -> GDA
    ('Filip', 'Ostrowski', '+48685589352', 'Lipowa 33', '00-112', 'Warszawa', '794600000031', 20, 1, 4, 8.80, (SELECT price FROM weight_tariffs WHERE 8.80 BETWEEN weight_from AND weight_to), NULL, '2026-11-12 16:10:00'),  -- 31 LBN -> HUB_WAW
    ('Natalia', 'Wozniak', '+48779130110', 'Akacjowa 118', '00-726', 'Warszawa', '794600000032', 9, 1, 7, 35.00, (SELECT price FROM weight_tariffs WHERE 35.00 BETWEEN weight_from AND weight_to), 640.0, '2026-11-12 11:40:00'),  -- 32 BDG -> HUB_WAW
    ('Filip', 'Adamczyk', '+48566907706', 'Klonowa 17', '85-639', 'Bydgoszcz', '794600000033', 15, 7, 1, 7.30, (SELECT price FROM weight_tariffs WHERE 7.30 BETWEEN weight_from AND weight_to), NULL, '2026-11-12 14:40:00'),  -- 33 HUB_WAW -> BDG
    ('Wiktoria', 'Nowak', '+48703552071', 'Szkolna 37', '15-431', 'Bialystok', '794600000034', 16, 5, 3, 4.99, (SELECT price FROM weight_tariffs WHERE 4.99 BETWEEN weight_from AND weight_to), NULL, '2026-11-16 12:45:00'),  -- 34 SDE -> BIA
    ('Kacper', 'Wozniak', '+48673006239', 'Szkolna 66', '15-441', 'Bialystok', '794600000035', 16, 5, 3, 18.60, (SELECT price FROM weight_tariffs WHERE 18.60 BETWEEN weight_from AND weight_to), NULL, '2026-11-16 11:55:00'),  -- 35 SDE -> BIA
    ('Jan', 'Kowalczyk', '+48626094117', 'Lipowa 61', '80-096', 'Gdansk', '794600000036', 19, 6, 10, 7.30, (SELECT price FROM weight_tariffs WHERE 7.30 BETWEEN weight_from AND weight_to), NULL, '2026-11-16 11:15:00'),  -- 36 KAT -> GDA
    ('Jan', 'Kaminski', '+48604386621', 'Brzozowa 29', '90-467', 'Lodz', '794600000037', 19, 2, 10, 11.00, (SELECT price FROM weight_tariffs WHERE 11.00 BETWEEN weight_from AND weight_to), NULL, '2026-11-20 11:15:00'),  -- 37 KAT -> HUB_LDZ
    ('Jakub', 'Zajac', '+48778076450', 'Spacerowa 86', '20-824', 'Lublin', '794600000038', 1, 4, 3, 18.60, (SELECT price FROM weight_tariffs WHERE 18.60 BETWEEN weight_from AND weight_to), NULL, '2026-11-20 11:10:00'),  -- 38 SDE -> LBN
    ('Kacper', 'Sikorski', '+48737604798', 'Spacerowa 34', '85-973', 'Bydgoszcz', '794600000039', 15, 7, 1, 78.00, (SELECT price FROM weight_tariffs WHERE 78.00 BETWEEN weight_from AND weight_to), 399.99, '2026-11-20 14:55:00'),  -- 39 HUB_WAW -> BDG
    ('Ola', 'Adamczyk', '+48779870706', 'Lipowa 35', '15-861', 'Bialystok', '794600000040', 16, 5, 3, 20.00, (SELECT price FROM weight_tariffs WHERE 20.00 BETWEEN weight_from AND weight_to), NULL, '2026-11-25 12:55:00');  -- 40 SDE -> BIA


-- trips: one row per truck run; ids follow insert order
INSERT INTO trips (vehicle_id, driver_id, origin_facility_id, destination_facility_id, departure_date, arrival_date) VALUES
    (1, 5, 3, 1, '2026-10-03 19:00:00', '2026-10-03 21:00:00'),  -- 1 SDE -> HUB_WAW
    (2, 6, 1, 4, '2026-10-04 03:30:00', '2026-10-04 06:00:00'),  -- 2 HUB_WAW -> LBN
    (10, 25, 1, 5, '2026-10-04 03:30:00', '2026-10-04 06:00:00'),  -- 3 HUB_WAW -> BIA
    (11, 26, 1, 6, '2026-10-04 03:30:00', '2026-10-04 06:00:00'),  -- 4 HUB_WAW -> GDA
    (3, 7, 9, 2, '2026-10-07 19:00:00', '2026-10-07 21:00:00'),  -- 5 KRK -> HUB_LDZ
    (3, 7, 2, 1, '2026-10-07 23:00:00', '2026-10-08 01:30:00'),  -- 6 HUB_LDZ -> HUB_WAW
    (2, 6, 1, 3, '2026-10-08 03:30:00', '2026-10-08 06:00:00'),  -- 7 HUB_WAW -> SDE
    (1, 5, 4, 1, '2026-10-07 19:00:00', '2026-10-07 21:00:00'),  -- 8 LBN -> HUB_WAW
    (4, 8, 10, 2, '2026-10-07 19:00:00', '2026-10-07 21:00:00'),  -- 9 KAT -> HUB_LDZ
    (10, 25, 1, 5, '2026-10-08 03:30:00', '2026-10-08 06:00:00'),  -- 10 HUB_WAW -> BIA
    (3, 7, 10, 2, '2026-10-11 19:00:00', '2026-10-11 21:00:00'),  -- 11 KAT -> HUB_LDZ
    (3, 7, 2, 1, '2026-10-11 23:00:00', '2026-10-12 01:30:00'),  -- 12 HUB_LDZ -> HUB_WAW
    (1, 5, 3, 1, '2026-10-11 19:00:00', '2026-10-11 21:00:00'),  -- 13 SDE -> HUB_WAW
    (1, 5, 1, 2, '2026-10-11 23:00:00', '2026-10-12 01:30:00'),  -- 14 HUB_WAW -> HUB_LDZ
    (4, 8, 2, 10, '2026-10-12 03:30:00', '2026-10-12 06:00:00'),  -- 15 HUB_LDZ -> KAT
    (2, 6, 1, 5, '2026-10-12 03:30:00', '2026-10-12 06:00:00'),  -- 16 HUB_WAW -> BIA
    (1, 5, 3, 1, '2026-10-15 19:00:00', '2026-10-15 21:00:00'),  -- 17 SDE -> HUB_WAW
    (2, 6, 1, 5, '2026-10-16 03:30:00', '2026-10-16 06:00:00'),  -- 18 HUB_WAW -> BIA
    (1, 5, 1, 2, '2026-10-15 23:00:00', '2026-10-16 01:30:00'),  -- 19 HUB_WAW -> HUB_LDZ
    (3, 7, 9, 2, '2026-10-15 19:00:00', '2026-10-15 21:00:00'),  -- 20 KRK -> HUB_LDZ
    (4, 8, 2, 10, '2026-10-16 03:30:00', '2026-10-16 06:00:00'),  -- 21 HUB_LDZ -> KAT
    (3, 7, 10, 2, '2026-10-19 19:00:00', '2026-10-19 21:00:00'),  -- 22 KAT -> HUB_LDZ
    (3, 7, 2, 1, '2026-10-19 23:00:00', '2026-10-20 01:30:00'),  -- 23 HUB_LDZ -> HUB_WAW
    (1, 5, 3, 1, '2026-10-19 19:00:00', '2026-10-19 21:00:00'),  -- 24 SDE -> HUB_WAW
    (1, 5, 1, 2, '2026-10-19 23:00:00', '2026-10-20 01:30:00'),  -- 25 HUB_WAW -> HUB_LDZ
    (4, 8, 2, 10, '2026-10-20 03:30:00', '2026-10-20 06:00:00'),  -- 26 HUB_LDZ -> KAT
    (1, 5, 6, 1, '2026-10-23 19:00:00', '2026-10-23 21:00:00'),  -- 27 GDA -> HUB_WAW
    (1, 5, 1, 2, '2026-10-23 23:00:00', '2026-10-24 01:30:00'),  -- 28 HUB_WAW -> HUB_LDZ
    (4, 8, 2, 9, '2026-10-24 03:30:00', '2026-10-24 06:00:00'),  -- 29 HUB_LDZ -> KRK
    (3, 7, 10, 2, '2026-10-27 19:00:00', '2026-10-27 21:00:00'),  -- 30 KAT -> HUB_LDZ
    (3, 7, 2, 1, '2026-10-27 23:00:00', '2026-10-28 01:30:00'),  -- 31 HUB_LDZ -> HUB_WAW
    (1, 5, 1, 2, '2026-10-27 23:00:00', '2026-10-28 01:30:00'),  -- 32 HUB_WAW -> HUB_LDZ
    (4, 8, 2, 9, '2026-10-28 03:30:00', '2026-10-28 06:00:00'),  -- 33 HUB_LDZ -> KRK
    (2, 6, 1, 3, '2026-10-28 03:30:00', '2026-10-28 06:00:00'),  -- 34 HUB_WAW -> SDE
    (1, 5, 1, 2, '2026-10-31 23:00:00', '2026-11-01 01:30:00'),  -- 35 HUB_WAW -> HUB_LDZ
    (4, 8, 2, 10, '2026-11-01 03:30:00', '2026-11-01 06:00:00'),  -- 36 HUB_LDZ -> KAT
    (3, 7, 9, 2, '2026-10-31 19:00:00', '2026-10-31 21:00:00'),  -- 37 KRK -> HUB_LDZ
    (3, 7, 2, 1, '2026-10-31 23:00:00', '2026-11-01 01:30:00'),  -- 38 HUB_LDZ -> HUB_WAW
    (2, 6, 1, 3, '2026-11-01 03:30:00', '2026-11-01 06:00:00'),  -- 39 HUB_WAW -> SDE
    (10, 25, 1, 5, '2026-11-01 03:30:00', '2026-11-01 06:00:00'),  -- 40 HUB_WAW -> BIA
    (1, 5, 3, 1, '2026-11-04 19:00:00', '2026-11-04 21:00:00'),  -- 41 SDE -> HUB_WAW
    (2, 6, 1, 6, '2026-11-05 03:30:00', '2026-11-05 06:00:00'),  -- 42 HUB_WAW -> GDA
    (3, 7, 10, 2, '2026-11-04 19:00:00', '2026-11-04 21:00:00'),  -- 43 KAT -> HUB_LDZ
    (3, 7, 2, 1, '2026-11-04 23:00:00', '2026-11-05 01:30:00'),  -- 44 HUB_LDZ -> HUB_WAW
    (2, 6, 4, 1, '2026-11-04 19:00:00', '2026-11-04 21:00:00'),  -- 45 LBN -> HUB_WAW
    (1, 5, 1, 2, '2026-11-04 23:00:00', '2026-11-05 01:30:00'),  -- 46 HUB_WAW -> HUB_LDZ
    (1, 5, 3, 1, '2026-11-08 19:00:00', '2026-11-08 21:00:00'),  -- 47 SDE -> HUB_WAW
    (1, 5, 1, 2, '2026-11-08 23:00:00', '2026-11-09 01:30:00'),  -- 48 HUB_WAW -> HUB_LDZ
    (4, 8, 2, 7, '2026-11-09 03:30:00', '2026-11-09 06:00:00'),  -- 49 HUB_LDZ -> BDG
    (12, 27, 2, 10, '2026-11-09 03:30:00', '2026-11-09 06:00:00'),  -- 50 HUB_LDZ -> KAT
    (2, 6, 1, 6, '2026-11-09 03:30:00', '2026-11-09 06:00:00'),  -- 51 HUB_WAW -> GDA
    (1, 5, 4, 1, '2026-11-12 19:00:00', '2026-11-12 21:00:00'),  -- 52 LBN -> HUB_WAW
    (3, 7, 7, 2, '2026-11-12 19:00:00', '2026-11-12 21:00:00'),  -- 53 BDG -> HUB_LDZ
    (3, 7, 2, 1, '2026-11-12 23:00:00', '2026-11-13 01:30:00'),  -- 54 HUB_LDZ -> HUB_WAW
    (1, 5, 1, 2, '2026-11-12 23:00:00', '2026-11-13 01:30:00'),  -- 55 HUB_WAW -> HUB_LDZ
    (4, 8, 2, 7, '2026-11-13 03:30:00', '2026-11-13 06:00:00'),  -- 56 HUB_LDZ -> BDG
    (1, 5, 3, 1, '2026-11-16 19:00:00', '2026-11-16 21:00:00'),  -- 57 SDE -> HUB_WAW
    (2, 6, 1, 5, '2026-11-17 03:30:00', '2026-11-17 06:00:00'),  -- 58 HUB_WAW -> BIA
    (3, 7, 10, 2, '2026-11-16 19:00:00', '2026-11-16 21:00:00'),  -- 59 KAT -> HUB_LDZ
    (3, 7, 10, 2, '2026-11-20 19:00:00', '2026-11-20 21:00:00'),  -- 60 KAT -> HUB_LDZ
    (1, 5, 3, 1, '2026-11-20 19:00:00', '2026-11-20 21:00:00'),  -- 61 SDE -> HUB_WAW
    (2, 6, 1, 4, '2026-11-21 03:30:00', '2026-11-21 06:00:00'),  -- 62 HUB_WAW -> LBN
    (1, 5, 1, 2, '2026-11-20 23:00:00', '2026-11-21 01:30:00'),  -- 63 HUB_WAW -> HUB_LDZ
    (4, 8, 2, 7, '2026-11-21 03:30:00', '2026-11-21 06:00:00'),  -- 64 HUB_LDZ -> BDG
    (2, 6, 3, 1, '2026-11-25 19:00:00', '2026-11-25 21:00:00'),  -- 65 SDE -> HUB_WAW
    (10, 25, 1, 5, '2026-11-26 03:30:00', NULL);  -- 66 HUB_WAW -> BIA


INSERT INTO trip_shipments (trip_id, shipment_id) VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (1, 3),
    (4, 3),
    (5, 4),
    (6, 4),
    (7, 4),
    (8, 5),
    (9, 6),
    (6, 6),
    (10, 6),
    (11, 7),
    (12, 7),
    (13, 8),
    (14, 8),
    (15, 8),
    (16, 9),
    (17, 10),
    (18, 10),
    (19, 11),
    (20, 12),
    (21, 12),
    (22, 13),
    (23, 13),
    (24, 14),
    (25, 14),
    (26, 14),
    (22, 15),
    (23, 15),
    (27, 16),
    (28, 16),
    (29, 16),
    (27, 17),
    (27, 18),
    (28, 18),
    (30, 19),
    (31, 19),
    (32, 20),
    (33, 20),
    (34, 21),
    (35, 22),
    (36, 22),
    (37, 23),
    (38, 23),
    (39, 23),
    (37, 24),
    (38, 24),
    (40, 24),
    (41, 25),
    (42, 25),
    (43, 26),
    (44, 26),
    (42, 26),
    (45, 27),
    (46, 27),
    (47, 28),
    (48, 28),
    (49, 28),
    (48, 29),
    (50, 29),
    (51, 30),
    (52, 31),
    (53, 32),
    (54, 32),
    (55, 33),
    (56, 33),
    (57, 34),
    (58, 34),
    (57, 35),
    (58, 35),
    (59, 36),
    (60, 37),
    (61, 38),
    (62, 38),
    (63, 39),
    (64, 39),
    (65, 40),
    (66, 40);


INSERT INTO scan_events (shipment_id, event_type_id, employee_id, facility_id, scan_date, comments) VALUES
    (1, 1, 14, NULL, '2026-10-03 11:00:00', NULL),  -- pickup
    (1, 2, 22, 3, '2026-10-03 12:00:00', NULL),  -- arrival
    (1, 3, 22, 3, '2026-10-03 18:30:00', NULL),  -- loading
    (1, 2, 9, 1, '2026-10-03 21:15:00', NULL),  -- arrival
    (1, 3, 9, 1, '2026-10-04 03:00:00', NULL),  -- loading
    (1, 2, 15, 4, '2026-10-04 06:15:00', NULL),  -- arrival
    (1, 4, 15, 4, '2026-10-04 08:00:00', NULL),  -- out_for_delivery
    (1, 5, 15, NULL, '2026-10-04 11:10:00', NULL),  -- delivery
    (2, 1, 23, NULL, '2026-10-03 15:15:00', NULL),  -- pickup
    (2, 2, 9, 1, '2026-10-03 16:15:00', NULL),  -- arrival
    (2, 3, 9, 1, '2026-10-04 03:00:00', NULL),  -- loading
    (2, 2, 16, 5, '2026-10-04 06:15:00', NULL),  -- arrival
    (2, 4, 16, 5, '2026-10-04 08:00:00', NULL),  -- out_for_delivery
    (2, 5, 16, NULL, '2026-10-04 12:10:00', NULL),  -- delivery
    (3, 1, 14, NULL, '2026-10-03 10:55:00', NULL),  -- pickup
    (3, 2, 22, 3, '2026-10-03 11:55:00', NULL),  -- arrival
    (3, 3, 22, 3, '2026-10-03 18:30:00', NULL),  -- loading
    (3, 2, 9, 1, '2026-10-03 21:15:00', NULL),  -- arrival
    (3, 3, 9, 1, '2026-10-04 03:00:00', NULL),  -- loading
    (3, 2, 17, 6, '2026-10-04 06:15:00', NULL),  -- arrival
    (3, 4, 17, 6, '2026-10-04 08:00:00', NULL),  -- out_for_delivery
    (3, 5, 17, NULL, '2026-10-04 13:10:00', NULL),  -- delivery
    (4, 1, 19, NULL, '2026-10-07 14:55:00', NULL),  -- pickup
    (4, 2, 19, 9, '2026-10-07 15:55:00', NULL),  -- arrival
    (4, 3, 19, 9, '2026-10-07 18:30:00', NULL),  -- loading
    (4, 2, 10, 2, '2026-10-07 21:15:00', NULL),  -- arrival
    (4, 3, 10, 2, '2026-10-07 22:30:00', NULL),  -- loading
    (4, 2, 9, 1, '2026-10-08 01:45:00', NULL),  -- arrival
    (4, 3, 9, 1, '2026-10-08 03:00:00', NULL),  -- loading
    (4, 2, 22, 3, '2026-10-08 06:15:00', NULL),  -- arrival
    (4, 4, 14, 3, '2026-10-08 08:00:00', NULL),  -- out_for_delivery
    (4, 5, 14, NULL, '2026-10-08 14:10:00', NULL),  -- delivery
    (5, 1, 15, NULL, '2026-10-07 09:30:00', NULL),  -- pickup
    (5, 2, 15, 4, '2026-10-07 10:30:00', NULL),  -- arrival
    (5, 3, 15, 4, '2026-10-07 18:30:00', NULL),  -- loading
    (5, 2, 9, 1, '2026-10-07 21:15:00', NULL),  -- arrival
    (5, 4, 23, 1, '2026-10-08 08:00:00', NULL),  -- out_for_delivery
    (5, 5, 23, NULL, '2026-10-08 10:10:00', NULL),  -- delivery
    (6, 1, 20, NULL, '2026-10-07 12:25:00', NULL),  -- pickup
    (6, 2, 21, 10, '2026-10-07 13:25:00', NULL),  -- arrival
    (6, 3, 21, 10, '2026-10-07 18:30:00', NULL),  -- loading
    (6, 2, 10, 2, '2026-10-07 21:15:00', NULL),  -- arrival
    (6, 3, 10, 2, '2026-10-07 22:30:00', NULL),  -- loading
    (6, 2, 9, 1, '2026-10-08 01:45:00', NULL),  -- arrival
    (6, 3, 9, 1, '2026-10-08 03:00:00', NULL),  -- loading
    (6, 2, 16, 5, '2026-10-08 06:15:00', NULL),  -- arrival
    (6, 4, 16, 5, '2026-10-08 08:00:00', NULL),  -- out_for_delivery
    (6, 6, 16, NULL, '2026-10-08 11:00:00', 'Recipient not at home, notice left'),  -- delivery_attempt
    (6, 8, 16, 5, '2026-10-08 17:00:00', 'Recipient asked for next day delivery'),  -- rescheduling
    (6, 4, 16, 5, '2026-10-09 08:00:00', NULL),  -- out_for_delivery
    (6, 5, 16, NULL, '2026-10-09 11:10:00', NULL),  -- delivery
    (7, 1, 20, NULL, '2026-10-11 11:00:00', NULL),  -- pickup
    (7, 2, 21, 10, '2026-10-11 12:00:00', NULL),  -- arrival
    (7, 3, 21, 10, '2026-10-11 18:30:00', NULL),  -- loading
    (7, 2, 10, 2, '2026-10-11 21:15:00', NULL),  -- arrival
    (7, 3, 10, 2, '2026-10-11 22:30:00', NULL),  -- loading
    (7, 2, 9, 1, '2026-10-12 01:45:00', NULL),  -- arrival
    (7, 4, 23, 1, '2026-10-12 08:00:00', NULL),  -- out_for_delivery
    (7, 5, 23, NULL, '2026-10-12 12:10:00', NULL),  -- delivery
    (8, 1, 14, NULL, '2026-10-11 15:15:00', NULL),  -- pickup
    (8, 2, 22, 3, '2026-10-11 16:15:00', NULL),  -- arrival
    (8, 3, 22, 3, '2026-10-11 18:30:00', NULL),  -- loading
    (8, 2, 9, 1, '2026-10-11 21:15:00', NULL),  -- arrival
    (8, 3, 9, 1, '2026-10-11 22:30:00', NULL),  -- loading
    (8, 2, 10, 2, '2026-10-12 01:45:00', NULL),  -- arrival
    (8, 3, 10, 2, '2026-10-12 03:00:00', NULL),  -- loading
    (8, 2, 21, 10, '2026-10-12 06:15:00', NULL),  -- arrival
    (8, 4, 20, 10, '2026-10-12 08:00:00', NULL),  -- out_for_delivery
    (8, 5, 20, NULL, '2026-10-12 13:10:00', NULL),  -- delivery
    (9, 1, 23, NULL, '2026-10-11 13:55:00', NULL),  -- pickup
    (9, 2, 9, 1, '2026-10-11 14:55:00', NULL),  -- arrival
    (9, 3, 9, 1, '2026-10-12 03:00:00', NULL),  -- loading
    (9, 2, 16, 5, '2026-10-12 06:15:00', NULL),  -- arrival
    (9, 4, 16, 5, '2026-10-12 08:00:00', NULL),  -- out_for_delivery
    (9, 5, 16, NULL, '2026-10-12 14:10:00', NULL),  -- delivery
    (10, 1, 14, NULL, '2026-10-15 08:10:00', NULL),  -- pickup
    (10, 2, 22, 3, '2026-10-15 09:10:00', NULL),  -- arrival
    (10, 3, 22, 3, '2026-10-15 18:30:00', NULL),  -- loading
    (10, 2, 9, 1, '2026-10-15 21:15:00', NULL),  -- arrival
    (10, 3, 9, 1, '2026-10-16 03:00:00', NULL),  -- loading
    (10, 2, 16, 5, '2026-10-16 06:15:00', NULL),  -- arrival
    (10, 4, 16, 5, '2026-10-16 08:00:00', NULL),  -- out_for_delivery
    (10, 5, 16, NULL, '2026-10-16 10:10:00', NULL),  -- delivery
    (11, 1, 23, NULL, '2026-10-15 15:25:00', NULL),  -- pickup
    (11, 2, 9, 1, '2026-10-15 16:25:00', NULL),  -- arrival
    (11, 3, 9, 1, '2026-10-15 22:30:00', NULL),  -- loading
    (11, 2, 10, 2, '2026-10-16 01:45:00', NULL),  -- arrival
    (11, 4, 24, 2, '2026-10-16 08:00:00', NULL),  -- out_for_delivery
    (11, 5, 24, NULL, '2026-10-16 11:10:00', NULL),  -- delivery
    (12, 1, 19, NULL, '2026-10-15 14:40:00', NULL),  -- pickup
    (12, 2, 19, 9, '2026-10-15 15:40:00', NULL),  -- arrival
    (12, 3, 19, 9, '2026-10-15 18:30:00', NULL),  -- loading
    (12, 2, 10, 2, '2026-10-15 21:15:00', NULL),  -- arrival
    (12, 3, 10, 2, '2026-10-16 03:00:00', NULL),  -- loading
    (12, 2, 21, 10, '2026-10-16 06:15:00', NULL),  -- arrival
    (12, 4, 20, 10, '2026-10-16 08:00:00', NULL),  -- out_for_delivery
    (12, 5, 20, NULL, '2026-10-16 12:10:00', NULL),  -- delivery
    (13, 1, 20, NULL, '2026-10-19 13:10:00', NULL),  -- pickup
    (13, 2, 21, 10, '2026-10-19 14:10:00', NULL),  -- arrival
    (13, 3, 21, 10, '2026-10-19 18:30:00', NULL),  -- loading
    (13, 2, 10, 2, '2026-10-19 21:15:00', NULL),  -- arrival
    (13, 3, 10, 2, '2026-10-19 22:30:00', NULL),  -- loading
    (13, 2, 9, 1, '2026-10-20 01:45:00', NULL),  -- arrival
    (13, 4, 23, 1, '2026-10-20 08:00:00', NULL),  -- out_for_delivery
    (13, 5, 23, NULL, '2026-10-20 13:10:00', NULL),  -- delivery
    (14, 1, 14, NULL, '2026-10-19 09:55:00', NULL),  -- pickup
    (14, 2, 22, 3, '2026-10-19 10:55:00', NULL),  -- arrival
    (14, 3, 22, 3, '2026-10-19 18:30:00', NULL),  -- loading
    (14, 2, 9, 1, '2026-10-19 21:15:00', NULL),  -- arrival
    (14, 3, 9, 1, '2026-10-19 22:30:00', NULL),  -- loading
    (14, 2, 10, 2, '2026-10-20 01:45:00', NULL),  -- arrival
    (14, 3, 10, 2, '2026-10-20 03:00:00', NULL),  -- loading
    (14, 2, 21, 10, '2026-10-20 06:15:00', NULL),  -- arrival
    (14, 4, 20, 10, '2026-10-20 08:00:00', NULL),  -- out_for_delivery
    (14, 5, 20, NULL, '2026-10-20 14:10:00', NULL),  -- delivery
    (15, 1, 20, NULL, '2026-10-19 15:55:00', NULL),  -- pickup
    (15, 2, 21, 10, '2026-10-19 16:55:00', NULL),  -- arrival
    (15, 3, 21, 10, '2026-10-19 18:30:00', NULL),  -- loading
    (15, 2, 10, 2, '2026-10-19 21:15:00', NULL),  -- arrival
    (15, 3, 10, 2, '2026-10-19 22:30:00', NULL),  -- loading
    (15, 2, 9, 1, '2026-10-20 01:45:00', NULL),  -- arrival
    (15, 4, 23, 1, '2026-10-20 08:00:00', NULL),  -- out_for_delivery
    (15, 5, 23, NULL, '2026-10-20 10:10:00', NULL),  -- delivery
    (16, 1, 17, NULL, '2026-10-23 16:55:00', NULL),  -- pickup
    (16, 2, 17, 6, '2026-10-23 17:55:00', NULL),  -- arrival
    (16, 3, 17, 6, '2026-10-23 18:30:00', NULL),  -- loading
    (16, 2, 9, 1, '2026-10-23 21:15:00', NULL),  -- arrival
    (16, 3, 9, 1, '2026-10-23 22:30:00', NULL),  -- loading
    (16, 2, 10, 2, '2026-10-24 01:45:00', NULL),  -- arrival
    (16, 3, 10, 2, '2026-10-24 03:00:00', NULL),  -- loading
    (16, 2, 19, 9, '2026-10-24 06:15:00', NULL),  -- arrival
    (16, 4, 19, 9, '2026-10-24 08:00:00', NULL),  -- out_for_delivery
    (16, 5, 19, NULL, '2026-10-24 11:10:00', NULL),  -- delivery
    (17, 1, 17, NULL, '2026-10-23 17:55:00', NULL),  -- pickup
    (17, 3, 17, 6, '2026-10-23 18:30:00', NULL),  -- loading
    (17, 2, 17, 6, '2026-10-23 18:55:00', NULL),  -- arrival
    (17, 2, 9, 1, '2026-10-23 21:15:00', NULL),  -- arrival
    (17, 4, 23, 1, '2026-10-24 08:00:00', NULL),  -- out_for_delivery
    (17, 5, 23, NULL, '2026-10-24 12:10:00', NULL),  -- delivery
    (18, 1, 17, NULL, '2026-10-23 11:45:00', NULL),  -- pickup
    (18, 2, 17, 6, '2026-10-23 12:45:00', NULL),  -- arrival
    (18, 3, 17, 6, '2026-10-23 18:30:00', NULL),  -- loading
    (18, 2, 9, 1, '2026-10-23 21:15:00', NULL),  -- arrival
    (18, 3, 9, 1, '2026-10-23 22:30:00', NULL),  -- loading
    (18, 2, 10, 2, '2026-10-24 01:45:00', NULL),  -- arrival
    (18, 4, 24, 2, '2026-10-24 08:00:00', NULL),  -- out_for_delivery
    (18, 5, 24, NULL, '2026-10-24 13:10:00', NULL),  -- delivery
    (19, 1, 20, NULL, '2026-10-27 13:30:00', NULL),  -- pickup
    (19, 2, 21, 10, '2026-10-27 14:30:00', NULL),  -- arrival
    (19, 3, 21, 10, '2026-10-27 18:30:00', NULL),  -- loading
    (19, 2, 10, 2, '2026-10-27 21:15:00', NULL),  -- arrival
    (19, 3, 10, 2, '2026-10-27 22:30:00', NULL),  -- loading
    (19, 2, 9, 1, '2026-10-28 01:45:00', NULL),  -- arrival
    (19, 4, 23, 1, '2026-10-28 08:00:00', NULL),  -- out_for_delivery
    (19, 5, 23, NULL, '2026-10-28 14:10:00', NULL),  -- delivery
    (20, 1, 23, NULL, '2026-10-27 09:00:00', NULL),  -- pickup
    (20, 2, 9, 1, '2026-10-27 10:00:00', NULL),  -- arrival
    (20, 3, 9, 1, '2026-10-27 22:30:00', NULL),  -- loading
    (20, 2, 10, 2, '2026-10-28 01:45:00', NULL),  -- arrival
    (20, 3, 10, 2, '2026-10-28 03:00:00', NULL),  -- loading
    (20, 2, 19, 9, '2026-10-28 06:15:00', NULL),  -- arrival
    (20, 4, 19, 9, '2026-10-28 08:00:00', NULL),  -- out_for_delivery
    (20, 5, 19, NULL, '2026-10-28 10:10:00', NULL),  -- delivery
    (21, 1, 23, NULL, '2026-10-27 13:10:00', NULL),  -- pickup
    (21, 2, 9, 1, '2026-10-27 14:10:00', NULL),  -- arrival
    (21, 3, 9, 1, '2026-10-28 03:00:00', NULL),  -- loading
    (21, 2, 22, 3, '2026-10-28 06:15:00', NULL),  -- arrival
    (21, 4, 14, 3, '2026-10-28 08:00:00', NULL),  -- out_for_delivery
    (21, 5, 14, NULL, '2026-10-28 11:10:00', NULL),  -- delivery
    (22, 1, 23, NULL, '2026-10-31 16:00:00', NULL),  -- pickup
    (22, 2, 9, 1, '2026-10-31 17:00:00', NULL),  -- arrival
    (22, 3, 9, 1, '2026-10-31 22:30:00', NULL),  -- loading
    (22, 2, 10, 2, '2026-11-01 01:45:00', NULL),  -- arrival
    (22, 3, 10, 2, '2026-11-01 03:00:00', NULL),  -- loading
    (22, 2, 21, 10, '2026-11-01 06:15:00', NULL),  -- arrival
    (22, 4, 20, 10, '2026-11-01 08:00:00', NULL),  -- out_for_delivery
    (22, 6, 20, NULL, '2026-11-01 12:00:00', 'Recipient not at home, notice left'),  -- delivery_attempt
    (22, 8, 21, 10, '2026-11-01 17:00:00', 'Recipient asked for next day delivery'),  -- rescheduling
    (22, 4, 20, 10, '2026-11-02 08:00:00', NULL),  -- out_for_delivery
    (22, 5, 20, NULL, '2026-11-02 12:10:00', NULL),  -- delivery
    (23, 1, 19, NULL, '2026-10-31 12:25:00', NULL),  -- pickup
    (23, 2, 19, 9, '2026-10-31 13:25:00', NULL),  -- arrival
    (23, 3, 19, 9, '2026-10-31 18:30:00', NULL),  -- loading
    (23, 2, 10, 2, '2026-10-31 21:15:00', NULL),  -- arrival
    (23, 3, 10, 2, '2026-10-31 22:30:00', NULL),  -- loading
    (23, 2, 9, 1, '2026-11-01 01:45:00', NULL),  -- arrival
    (23, 3, 9, 1, '2026-11-01 03:00:00', NULL),  -- loading
    (23, 2, 22, 3, '2026-11-01 06:15:00', NULL),  -- arrival
    (23, 4, 14, 3, '2026-11-01 08:00:00', NULL),  -- out_for_delivery
    (23, 5, 14, NULL, '2026-11-01 13:10:00', NULL),  -- delivery
    (24, 1, 19, NULL, '2026-10-31 12:00:00', NULL),  -- pickup
    (24, 2, 19, 9, '2026-10-31 13:00:00', NULL),  -- arrival
    (24, 3, 19, 9, '2026-10-31 18:30:00', NULL),  -- loading
    (24, 2, 10, 2, '2026-10-31 21:15:00', NULL),  -- arrival
    (24, 3, 10, 2, '2026-10-31 22:30:00', NULL),  -- loading
    (24, 2, 9, 1, '2026-11-01 01:45:00', NULL),  -- arrival
    (24, 3, 9, 1, '2026-11-01 03:00:00', NULL),  -- loading
    (24, 2, 16, 5, '2026-11-01 06:15:00', NULL),  -- arrival
    (24, 4, 16, 5, '2026-11-01 08:00:00', NULL),  -- out_for_delivery
    (24, 5, 16, NULL, '2026-11-01 14:10:00', NULL),  -- delivery
    (25, 1, 14, NULL, '2026-11-04 09:10:00', NULL),  -- pickup
    (25, 2, 22, 3, '2026-11-04 10:10:00', NULL),  -- arrival
    (25, 3, 22, 3, '2026-11-04 18:30:00', NULL),  -- loading
    (25, 2, 9, 1, '2026-11-04 21:15:00', NULL),  -- arrival
    (25, 3, 9, 1, '2026-11-05 03:00:00', NULL),  -- loading
    (25, 2, 17, 6, '2026-11-05 06:15:00', NULL),  -- arrival
    (25, 4, 17, 6, '2026-11-05 08:00:00', NULL),  -- out_for_delivery
    (25, 5, 17, NULL, '2026-11-05 10:10:00', NULL),  -- delivery
    (26, 1, 20, NULL, '2026-11-04 13:00:00', NULL),  -- pickup
    (26, 2, 21, 10, '2026-11-04 14:00:00', NULL),  -- arrival
    (26, 3, 21, 10, '2026-11-04 18:30:00', NULL),  -- loading
    (26, 2, 10, 2, '2026-11-04 21:15:00', NULL),  -- arrival
    (26, 3, 10, 2, '2026-11-04 22:30:00', NULL),  -- loading
    (26, 2, 9, 1, '2026-11-05 01:45:00', NULL),  -- arrival
    (26, 3, 9, 1, '2026-11-05 03:00:00', NULL),  -- loading
    (26, 2, 17, 6, '2026-11-05 06:15:00', NULL),  -- arrival
    (26, 4, 17, 6, '2026-11-05 08:00:00', NULL),  -- out_for_delivery
    (26, 5, 17, NULL, '2026-11-05 11:10:00', NULL),  -- delivery
    (27, 1, 15, NULL, '2026-11-04 10:15:00', NULL),  -- pickup
    (27, 2, 15, 4, '2026-11-04 11:15:00', NULL),  -- arrival
    (27, 3, 15, 4, '2026-11-04 18:30:00', NULL),  -- loading
    (27, 2, 9, 1, '2026-11-04 21:15:00', NULL),  -- arrival
    (27, 3, 9, 1, '2026-11-04 22:30:00', NULL),  -- loading
    (27, 2, 10, 2, '2026-11-05 01:45:00', NULL),  -- arrival
    (27, 4, 24, 2, '2026-11-05 08:00:00', NULL),  -- out_for_delivery
    (27, 5, 24, NULL, '2026-11-05 12:10:00', NULL),  -- delivery
    (28, 1, 14, NULL, '2026-11-08 09:45:00', NULL),  -- pickup
    (28, 2, 22, 3, '2026-11-08 10:45:00', NULL),  -- arrival
    (28, 3, 22, 3, '2026-11-08 18:30:00', NULL),  -- loading
    (28, 2, 9, 1, '2026-11-08 21:15:00', NULL),  -- arrival
    (28, 3, 9, 1, '2026-11-08 22:30:00', NULL),  -- loading
    (28, 2, 10, 2, '2026-11-09 01:45:00', NULL),  -- arrival
    (28, 3, 10, 2, '2026-11-09 03:00:00', NULL),  -- loading
    (28, 2, 18, 7, '2026-11-09 06:15:00', NULL),  -- arrival
    (28, 4, 18, 7, '2026-11-09 08:00:00', NULL),  -- out_for_delivery
    (28, 5, 18, NULL, '2026-11-09 13:10:00', NULL),  -- delivery
    (29, 1, 23, NULL, '2026-11-08 11:45:00', NULL),  -- pickup
    (29, 2, 9, 1, '2026-11-08 12:45:00', NULL),  -- arrival
    (29, 3, 9, 1, '2026-11-08 22:30:00', NULL),  -- loading
    (29, 2, 10, 2, '2026-11-09 01:45:00', NULL),  -- arrival
    (29, 3, 10, 2, '2026-11-09 03:00:00', NULL),  -- loading
    (29, 2, 21, 10, '2026-11-09 06:15:00', NULL),  -- arrival
    (29, 4, 20, 10, '2026-11-09 08:00:00', NULL),  -- out_for_delivery
    (29, 5, 20, NULL, '2026-11-09 14:10:00', NULL),  -- delivery
    (30, 1, 23, NULL, '2026-11-08 08:10:00', NULL),  -- pickup
    (30, 2, 9, 1, '2026-11-08 09:10:00', NULL),  -- arrival
    (30, 3, 9, 1, '2026-11-09 03:00:00', NULL),  -- loading
    (30, 2, 17, 6, '2026-11-09 06:15:00', NULL),  -- arrival
    (30, 4, 17, 6, '2026-11-09 08:00:00', NULL),  -- out_for_delivery
    (30, 5, 17, NULL, '2026-11-09 10:10:00', NULL),  -- delivery
    (31, 1, 15, NULL, '2026-11-12 16:10:00', NULL),  -- pickup
    (31, 2, 15, 4, '2026-11-12 17:10:00', NULL),  -- arrival
    (31, 3, 15, 4, '2026-11-12 18:30:00', NULL),  -- loading
    (31, 2, 9, 1, '2026-11-12 21:15:00', NULL),  -- arrival
    (31, 4, 23, 1, '2026-11-13 08:00:00', NULL),  -- out_for_delivery
    (31, 5, 23, NULL, '2026-11-13 11:10:00', NULL),  -- delivery
    (32, 1, 18, NULL, '2026-11-12 11:40:00', NULL),  -- pickup
    (32, 2, 18, 7, '2026-11-12 12:40:00', NULL),  -- arrival
    (32, 3, 18, 7, '2026-11-12 18:30:00', NULL),  -- loading
    (32, 2, 10, 2, '2026-11-12 21:15:00', NULL),  -- arrival
    (32, 3, 10, 2, '2026-11-12 22:30:00', NULL),  -- loading
    (32, 2, 9, 1, '2026-11-13 01:45:00', NULL),  -- arrival
    (32, 4, 23, 1, '2026-11-13 08:00:00', NULL),  -- out_for_delivery
    (32, 7, 23, NULL, '2026-11-13 12:00:00', 'Recipient refused to pay COD'),  -- refusal
    (33, 1, 23, NULL, '2026-11-12 14:40:00', NULL),  -- pickup
    (33, 2, 9, 1, '2026-11-12 15:40:00', NULL),  -- arrival
    (33, 3, 9, 1, '2026-11-12 22:30:00', NULL),  -- loading
    (33, 2, 10, 2, '2026-11-13 01:45:00', NULL),  -- arrival
    (33, 3, 10, 2, '2026-11-13 03:00:00', NULL),  -- loading
    (33, 2, 18, 7, '2026-11-13 06:15:00', NULL),  -- arrival
    (33, 4, 18, 7, '2026-11-13 08:00:00', NULL),  -- out_for_delivery
    (33, 5, 18, NULL, '2026-11-13 13:10:00', NULL),  -- delivery
    (34, 1, 14, NULL, '2026-11-16 12:45:00', NULL),  -- pickup
    (34, 2, 22, 3, '2026-11-16 13:45:00', NULL),  -- arrival
    (34, 3, 22, 3, '2026-11-16 18:30:00', NULL),  -- loading
    (34, 2, 9, 1, '2026-11-16 21:15:00', NULL),  -- arrival
    (34, 3, 9, 1, '2026-11-17 03:00:00', NULL),  -- loading
    (34, 2, 16, 5, '2026-11-17 06:15:00', NULL),  -- arrival
    (34, 4, 16, 5, '2026-11-17 08:00:00', NULL),  -- out_for_delivery
    (34, 5, 16, NULL, '2026-11-17 14:10:00', NULL),  -- delivery
    (35, 1, 14, NULL, '2026-11-16 11:55:00', NULL),  -- pickup
    (35, 2, 22, 3, '2026-11-16 12:55:00', NULL),  -- arrival
    (35, 3, 22, 3, '2026-11-16 18:30:00', NULL),  -- loading
    (35, 2, 9, 1, '2026-11-16 21:15:00', NULL),  -- arrival
    (35, 3, 9, 1, '2026-11-17 03:00:00', NULL),  -- loading
    (35, 2, 16, 5, '2026-11-17 06:15:00', NULL),  -- arrival
    (35, 4, 16, 5, '2026-11-17 08:00:00', NULL),  -- out_for_delivery
    (35, 5, 16, NULL, '2026-11-17 10:10:00', NULL),  -- delivery
    (36, 1, 20, NULL, '2026-11-16 11:15:00', NULL),  -- pickup
    (36, 2, 21, 10, '2026-11-16 12:15:00', NULL),  -- arrival
    (36, 3, 21, 10, '2026-11-16 18:30:00', NULL),  -- loading
    (36, 2, 10, 2, '2026-11-16 21:15:00', NULL),  -- arrival
    (37, 1, 20, NULL, '2026-11-20 11:15:00', NULL),  -- pickup
    (37, 2, 21, 10, '2026-11-20 12:15:00', NULL),  -- arrival
    (37, 3, 21, 10, '2026-11-20 18:30:00', NULL),  -- loading
    (37, 2, 10, 2, '2026-11-20 21:15:00', NULL),  -- arrival
    (37, 4, 24, 2, '2026-11-21 08:00:00', NULL),  -- out_for_delivery
    (37, 5, 24, NULL, '2026-11-21 12:10:00', NULL),  -- delivery
    (38, 1, 14, NULL, '2026-11-20 11:10:00', NULL),  -- pickup
    (38, 2, 22, 3, '2026-11-20 12:10:00', NULL),  -- arrival
    (38, 3, 22, 3, '2026-11-20 18:30:00', NULL),  -- loading
    (38, 2, 9, 1, '2026-11-20 21:15:00', NULL),  -- arrival
    (38, 3, 9, 1, '2026-11-21 03:00:00', NULL),  -- loading
    (38, 2, 15, 4, '2026-11-21 06:15:00', NULL),  -- arrival
    (38, 4, 15, 4, '2026-11-21 08:00:00', NULL),  -- out_for_delivery
    (38, 5, 15, NULL, '2026-11-21 13:10:00', NULL),  -- delivery
    (39, 1, 23, NULL, '2026-11-20 14:55:00', NULL),  -- pickup
    (39, 2, 9, 1, '2026-11-20 15:55:00', NULL),  -- arrival
    (39, 3, 9, 1, '2026-11-20 22:30:00', NULL),  -- loading
    (39, 2, 10, 2, '2026-11-21 01:45:00', NULL),  -- arrival
    (39, 3, 10, 2, '2026-11-21 03:00:00', NULL),  -- loading
    (39, 2, 18, 7, '2026-11-21 06:15:00', NULL),  -- arrival
    (39, 4, 18, 7, '2026-11-21 08:00:00', NULL),  -- out_for_delivery
    (39, 5, 18, NULL, '2026-11-21 14:10:00', NULL),  -- delivery
    (40, 1, 14, NULL, '2026-11-25 12:55:00', NULL),  -- pickup
    (40, 2, 22, 3, '2026-11-25 13:55:00', NULL),  -- arrival
    (40, 3, 22, 3, '2026-11-25 18:30:00', NULL),  -- loading
    (40, 2, 9, 1, '2026-11-25 21:15:00', NULL),  -- arrival
    (40, 3, 9, 1, '2026-11-26 03:00:00', NULL);  -- loading


INSERT INTO claims (shipment_id, claim_type, status, filed_date, resolved_date, claimed_amount, compensation_amount, reviewer_id, description) VALUES
    (4, 'damage', 'accepted', '2026-10-09 10:00:00', '2026-10-14 10:00:00', 450.00, 300.00, 12, 'Furniture box crushed, one table leg broken'),
    (18, 'damage', 'rejected', '2026-10-26 10:00:00', '2026-11-02 10:00:00', 600.00, 0.00, 13, 'Scratches on the casing, packaging was not reinforced'),
    (8, 'delay', 'rejected', '2026-10-15 10:00:00', '2026-10-20 10:00:00', 30.00, 0.00, 12, 'Parcel arrived one day later than expected'),
    (36, 'loss', 'accepted', '2026-11-23 10:00:00', '2026-11-26 14:00:00', 800.00, 800.00, 13, 'Parcel never arrived, last scan at HUB_LDZ'),
    (12, 'delay', 'accepted', '2026-10-17 10:00:00', '2026-10-20 10:00:00', 5.00, 5.00, 13, 'Late delivery, refund of the shipping fee'),
    (22, 'delay', 'pending', '2026-11-03 10:00:00', NULL, 640.00, NULL, 13, 'Delivery postponed, customer lost a sale'),
    (34, 'damage', 'pending', '2026-11-18 10:00:00', NULL, 120.00, NULL, 12, 'Wet cardboard, contents partly damaged'),
    (33, 'damage', 'new', '2026-11-15 10:00:00', NULL, 200.00, NULL, NULL, 'Dented corner of the box'),
    (26, 'damage', 'new', '2026-11-08 10:00:00', NULL, 75.50, NULL, NULL, 'Glass item cracked inside');
