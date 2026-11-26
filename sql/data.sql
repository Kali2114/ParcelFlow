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