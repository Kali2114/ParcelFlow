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
    ('Hubert', 'Lis', 'courier', '2025-03-03', 3, 11);  -- 22 BR_SDE


INSERT INTO vehicles (plate_number, vehicle_type, model, capacity_kg, base_facility_id) VALUES
    ('WI 4821K', 'truck', 'Volvo FH 460', 18000.00, 1),       -- 1 HUB_WAW
    ('WI 7390M', 'truck', 'Scania R 450', 18000.00, 1),       -- 2 HUB_WAW
    ('EL 1257T', 'truck', 'MAN TGX 18.470', 19000.00, 2),     -- 3 HUB_LDZ
    ('EL 6634P', 'truck', 'DAF XF 480', 18500.00, 2),         -- 4 HUB_LDZ
    ('WSI 2045A', 'van', 'Mercedes Sprinter', 1200.00, 3),    -- 5 BR_SDE
    ('LU 3378C', 'van', 'Ford Transit', 1100.00, 4),          -- 6 BR_LBN
    ('GD 9012F', 'van', 'Renault Master', 1300.00, 6),        -- 7 BR_GDA
    ('KR 5541N', 'van', 'Iveco Daily', 1400.00, 9),           -- 8 BR_KRK
    ('SK 8806W', 'van', 'Volkswagen Crafter', 1200.00, 10);   -- 9 BR_KAT


INSERT INTO shipments (receiver_first_name, receiver_last_name, receiver_phone_number, receiver_street, receiver_postal_code, receiver_city, tracking_number, sender_id, destination_facility_id, origin_facility_id, weight_kg, price, cod, shipping_date) VALUES
    ('Oskar', 'Pawlak', '+48799010119', 'Szkolna 9', '20-474', 'Lublin', '794600000001', 16, 4, 3, 5.01, (SELECT price FROM weight_tariffs WHERE 5.01 BETWEEN weight_from AND weight_to), 49.99, '2026-10-03 11:00:00'),  -- 1 SDE -> LBN
    ('Igor', 'Zajac', '+48668941402', 'Lipowa 96', '15-936', 'Bialystok', '794600000002', 15, 5, 1, 5.00, (SELECT price FROM weight_tariffs WHERE 5.00 BETWEEN weight_from AND weight_to), 250.0, '2026-10-04 15:15:00'),  -- 2 HUB_WAW -> BIA
    ('Ola', 'Kowalczyk', '+48714426514', 'Lesna 20', '80-765', 'Gdansk', '794600000003', 16, 6, 3, 9.50, (SELECT price FROM weight_tariffs WHERE 9.50 BETWEEN weight_from AND weight_to), NULL, '2026-10-05 10:55:00'),  -- 3 SDE -> GDA
    ('Szymon', 'Majewski', '+48726645405', 'Klonowa 111', '08-110', 'Siedlce', '794600000004', 18, 3, 9, 78.00, (SELECT price FROM weight_tariffs WHERE 78.00 BETWEEN weight_from AND weight_to), NULL, '2026-10-06 14:55:00'),  -- 4 KRK -> SDE
    ('Natalia', 'Krol', '+48788283750', 'Spacerowa 1', '00-697', 'Warszawa', '794600000005', 6, 1, 4, 6.40, (SELECT price FROM weight_tariffs WHERE 6.40 BETWEEN weight_from AND weight_to), 120.5, '2026-10-07 09:30:00'),  -- 5 LBN -> HUB_WAW
    ('Marcin', 'Nowakowski', '+48595912998', 'Ogrodowa 70', '15-996', 'Bialystok', '794600000006', 5, 5, 10, 22.50, (SELECT price FROM weight_tariffs WHERE 22.50 BETWEEN weight_from AND weight_to), 640.0, '2026-10-08 12:25:00'),  -- 6 KAT -> BIA
    ('Maja', 'Ostrowski', '+48510456496', 'Lesna 11', '00-614', 'Warszawa', '794600000007', 11, 1, 10, 2.50, (SELECT price FROM weight_tariffs WHERE 2.50 BETWEEN weight_from AND weight_to), 120.5, '2026-10-09 11:00:00'),  -- 7 KAT -> HUB_WAW
    ('Igor', 'Rutkowski', NULL, 'Parkowa 55', '40-836', 'Katowice', '794600000008', 16, 10, 3, 35.00, (SELECT price FROM weight_tariffs WHERE 35.00 BETWEEN weight_from AND weight_to), 89.0, '2026-10-12 15:15:00'),  -- 8 SDE -> KAT
    ('Szymon', 'Walczak', '+48607992155', 'Lesna 32', '15-952', 'Bialystok', '794600000009', 15, 5, 1, 7.30, (SELECT price FROM weight_tariffs WHERE 7.30 BETWEEN weight_from AND weight_to), NULL, '2026-10-13 13:55:00'),  -- 9 HUB_WAW -> BIA
    ('Adam', 'Jablonski', '+48797384352', 'Lesna 116', '15-066', 'Bialystok', '794600000010', 13, 5, 3, 5.01, (SELECT price FROM weight_tariffs WHERE 5.01 BETWEEN weight_from AND weight_to), NULL, '2026-10-15 08:10:00'),  -- 10 SDE -> BIA
    ('Wiktoria', 'Zajac', '+48776035466', 'Sosnowa 120', '90-881', 'Lodz', '794600000011', 4, 2, 1, 5.01, (SELECT price FROM weight_tariffs WHERE 5.01 BETWEEN weight_from AND weight_to), NULL, '2026-10-17 15:25:00'),  -- 11 HUB_WAW -> HUB_LDZ
    ('Natalia', 'Witkowski', '+48718538654', 'Spacerowa 111', '40-249', 'Katowice', '794600000012', 10, 10, 9, 5.00, (SELECT price FROM weight_tariffs WHERE 5.00 BETWEEN weight_from AND weight_to), NULL, '2026-10-19 14:40:00'),  -- 12 KRK -> KAT
    ('Maja', 'Wieczorek', '+48552837693', 'Lipowa 69', '00-690', 'Warszawa', '794600000013', 5, 1, 10, 0.80, (SELECT price FROM weight_tariffs WHERE 0.80 BETWEEN weight_from AND weight_to), NULL, '2026-10-21 13:10:00'),  -- 13 KAT -> HUB_WAW
    ('Wiktoria', 'Kaminski', '+48649542787', 'Polna 84', '40-144', 'Katowice', '794600000014', 2, 10, 3, 18.60, (SELECT price FROM weight_tariffs WHERE 18.60 BETWEEN weight_from AND weight_to), NULL, '2026-10-23 09:55:00'),  -- 14 SDE -> KAT
    ('Julia', 'Pawlak', NULL, 'Polna 22', '00-993', 'Warszawa', '794600000015', 19, 1, 10, 5.01, (SELECT price FROM weight_tariffs WHERE 5.01 BETWEEN weight_from AND weight_to), NULL, '2026-10-24 15:55:00'),  -- 15 KAT -> HUB_WAW
    ('Marcin', 'Wieczorek', '+48642379807', 'Szkolna 28', '30-003', 'Krakow', '794600000016', 17, 9, 6, 18.60, (SELECT price FROM weight_tariffs WHERE 18.60 BETWEEN weight_from AND weight_to), NULL, '2026-10-25 16:55:00'),  -- 16 GDA -> KRK
    ('Szymon', 'Rutkowski', '+48532726345', 'Ogrodowa 8', '00-594', 'Warszawa', '794600000017', 17, 1, 6, 8.80, (SELECT price FROM weight_tariffs WHERE 8.80 BETWEEN weight_from AND weight_to), NULL, '2026-10-28 17:55:00'),  -- 17 GDA -> HUB_WAW
    ('Zofia', 'Ostrowski', NULL, 'Lipowa 75', '90-872', 'Lodz', '794600000018', 8, 2, 6, 78.00, (SELECT price FROM weight_tariffs WHERE 78.00 BETWEEN weight_from AND weight_to), NULL, '2026-10-30 11:45:00'),  -- 18 GDA -> HUB_LDZ
    ('Julia', 'Dudek', NULL, 'Lipowa 34', '00-635', 'Warszawa', '794600000019', 19, 1, 10, 52.00, (SELECT price FROM weight_tariffs WHERE 52.00 BETWEEN weight_from AND weight_to), NULL, '2026-10-31 13:30:00'),  -- 19 KAT -> HUB_WAW
    ('Jakub', 'Tomaszewski', '+48661059704', 'Parkowa 13', '30-135', 'Krakow', '794600000020', 4, 9, 1, 18.60, (SELECT price FROM weight_tariffs WHERE 18.60 BETWEEN weight_from AND weight_to), NULL, '2026-11-01 09:00:00'),  -- 20 HUB_WAW -> KRK
    ('Maja', 'Nowakowski', '+48771594777', 'Szkolna 21', '08-110', 'Siedlce', '794600000021', 3, 3, 1, 6.40, (SELECT price FROM weight_tariffs WHERE 6.40 BETWEEN weight_from AND weight_to), NULL, '2026-11-02 13:10:00'),  -- 21 HUB_WAW -> SDE
    ('Wiktoria', 'Adamczyk', '+48662412652', 'Akacjowa 14', '40-854', 'Katowice', '794600000022', 12, 10, 1, 78.00, (SELECT price FROM weight_tariffs WHERE 78.00 BETWEEN weight_from AND weight_to), 640.0, '2026-11-04 16:00:00'),  -- 22 HUB_WAW -> KAT
    ('Oskar', 'Wieczorek', '+48557464501', 'Akacjowa 82', '08-110', 'Siedlce', '794600000023', 18, 3, 9, 35.00, (SELECT price FROM weight_tariffs WHERE 35.00 BETWEEN weight_from AND weight_to), NULL, '2026-11-05 12:25:00'),  -- 23 KRK -> SDE
    ('Jan', 'Dudek', '+48527272449', 'Ogrodowa 82', '15-518', 'Bialystok', '794600000024', 10, 5, 9, 1.20, (SELECT price FROM weight_tariffs WHERE 1.20 BETWEEN weight_from AND weight_to), NULL, '2026-11-06 12:00:00'),  -- 24 KRK -> BIA
    ('Marcin', 'Michalak', '+48796181171', 'Polna 107', '80-166', 'Gdansk', '794600000025', 2, 6, 3, 14.20, (SELECT price FROM weight_tariffs WHERE 14.20 BETWEEN weight_from AND weight_to), NULL, '2026-11-07 09:10:00'),  -- 25 SDE -> GDA
    ('Hanna', 'Wieczorek', '+48730739986', 'Akacjowa 32', '80-597', 'Gdansk', '794600000026', 19, 6, 10, 3.90, (SELECT price FROM weight_tariffs WHERE 3.90 BETWEEN weight_from AND weight_to), NULL, '2026-11-08 13:00:00'),  -- 26 KAT -> GDA
    ('Natalia', 'Nowak', '+48718172199', 'Ogrodowa 95', '90-363', 'Lodz', '794600000027', 20, 2, 4, 78.00, (SELECT price FROM weight_tariffs WHERE 78.00 BETWEEN weight_from AND weight_to), 89.0, '2026-11-09 10:15:00'),  -- 27 LBN -> HUB_LDZ
    ('Adam', 'Sikorski', '+48633233772', 'Lipowa 26', '85-802', 'Bydgoszcz', '794600000028', 13, 7, 3, 6.40, (SELECT price FROM weight_tariffs WHERE 6.40 BETWEEN weight_from AND weight_to), NULL, '2026-11-10 09:45:00'),  -- 28 SDE -> BDG
    ('Oskar', 'Majewski', '+48622189399', 'Lesna 99', '40-359', 'Katowice', '794600000029', 15, 10, 1, 5.01, (SELECT price FROM weight_tariffs WHERE 5.01 BETWEEN weight_from AND weight_to), NULL, '2026-11-11 11:45:00'),  -- 29 HUB_WAW -> KAT
    ('Igor', 'Krol', '+48714575699', 'Parkowa 34', '80-360', 'Gdansk', '794600000030', 15, 6, 1, 35.00, (SELECT price FROM weight_tariffs WHERE 35.00 BETWEEN weight_from AND weight_to), NULL, '2026-11-12 08:10:00'),  -- 30 HUB_WAW -> GDA
    ('Filip', 'Ostrowski', '+48685589352', 'Lipowa 33', '00-112', 'Warszawa', '794600000031', 20, 1, 4, 8.80, (SELECT price FROM weight_tariffs WHERE 8.80 BETWEEN weight_from AND weight_to), NULL, '2026-11-13 16:10:00'),  -- 31 LBN -> HUB_WAW
    ('Natalia', 'Wozniak', '+48779130110', 'Akacjowa 118', '00-726', 'Warszawa', '794600000032', 9, 1, 7, 35.00, (SELECT price FROM weight_tariffs WHERE 35.00 BETWEEN weight_from AND weight_to), 640.0, '2026-11-14 11:40:00'),  -- 32 BDG -> HUB_WAW
    ('Filip', 'Adamczyk', '+48566907706', 'Klonowa 17', '85-639', 'Bydgoszcz', '794600000033', 15, 7, 1, 7.30, (SELECT price FROM weight_tariffs WHERE 7.30 BETWEEN weight_from AND weight_to), NULL, '2026-11-15 14:40:00'),  -- 33 HUB_WAW -> BDG
    ('Wiktoria', 'Nowak', '+48703552071', 'Szkolna 37', '15-431', 'Bialystok', '794600000034', 16, 5, 3, 4.99, (SELECT price FROM weight_tariffs WHERE 4.99 BETWEEN weight_from AND weight_to), NULL, '2026-11-16 12:45:00'),  -- 34 SDE -> BIA
    ('Kacper', 'Wozniak', '+48673006239', 'Szkolna 66', '15-441', 'Bialystok', '794600000035', 16, 5, 3, 18.60, (SELECT price FROM weight_tariffs WHERE 18.60 BETWEEN weight_from AND weight_to), NULL, '2026-11-17 11:55:00'),  -- 35 SDE -> BIA
    ('Jan', 'Kowalczyk', '+48626094117', 'Lipowa 61', '80-096', 'Gdansk', '794600000036', 19, 6, 10, 7.30, (SELECT price FROM weight_tariffs WHERE 7.30 BETWEEN weight_from AND weight_to), NULL, '2026-11-19 11:15:00'),  -- 36 KAT -> GDA
    ('Jan', 'Kaminski', '+48604386621', 'Brzozowa 29', '90-467', 'Lodz', '794600000037', 19, 2, 10, 11.00, (SELECT price FROM weight_tariffs WHERE 11.00 BETWEEN weight_from AND weight_to), NULL, '2026-11-20 11:15:00'),  -- 37 KAT -> HUB_LDZ
    ('Jakub', 'Zajac', '+48778076450', 'Spacerowa 86', '20-824', 'Lublin', '794600000038', 1, 4, 3, 18.60, (SELECT price FROM weight_tariffs WHERE 18.60 BETWEEN weight_from AND weight_to), NULL, '2026-11-23 11:10:00'),  -- 38 SDE -> LBN
    ('Kacper', 'Sikorski', '+48737604798', 'Spacerowa 34', '85-973', 'Bydgoszcz', '794600000039', 15, 7, 1, 78.00, (SELECT price FROM weight_tariffs WHERE 78.00 BETWEEN weight_from AND weight_to), 399.99, '2026-11-24 14:55:00'),  -- 39 HUB_WAW -> BDG
    ('Ola', 'Adamczyk', '+48779870706', 'Lipowa 35', '15-861', 'Bialystok', '794600000040', 16, 5, 3, 20.00, (SELECT price FROM weight_tariffs WHERE 20.00 BETWEEN weight_from AND weight_to), NULL, '2026-11-25 12:55:00');  -- 40 SDE -> BIA
