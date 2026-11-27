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
