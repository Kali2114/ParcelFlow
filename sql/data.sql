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
