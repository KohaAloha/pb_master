insert into `message_transports`
(`message_attribute_id`, `message_transport_type`, `is_digest`, `letter_module`, `letter_code`)
values
(1, 'email', 0, 'circulation', 'DUE'),
(1, 'email', 1, 'circulation', 'DUEDGST'),
(1, 'sms',   0, 'circulation', 'DUE'),
(1, 'sms',   1, 'circulation', 'DUEDGST'),
(1, 'phone', 0, 'circulation', 'DUE'),
(1, 'phone', 1, 'circulation', 'DUEDGST'),
(2, 'email', 0, 'circulation', 'PREDUE'),
(2, 'email', 1, 'circulation', 'PREDUEDGST'),
(2, 'sms',   0, 'circulation', 'PREDUE'),
(2, 'sms',   1, 'circulation', 'PREDUEDGST'),
(2, 'phone', 0, 'circulation', 'PREDUE'),
(2, 'phone', 1, 'circulation', 'PREDUEDGST'),
(2, 'itiva', 0, 'circulation', 'PREDUE'),
(2, 'itiva', 1, 'circulation', 'PREDUEDGST'),
(4, 'email', 0, 'reserves',    'HOLD'),
(4, 'sms',   0, 'reserves',    'HOLD'),
(4, 'phone', 0, 'reserves',    'HOLD'),
(4, 'itiva', 0, 'reserves',    'HOLD'),
(5, 'email', 0, 'circulation', 'CHECKIN'),
(5, 'sms',   0, 'circulation', 'CHECKIN'),
(5, 'phone', 0, 'circulation', 'CHECKIN'),
(6, 'email', 0, 'circulation', 'CHECKOUT'),
(6, 'sms',   0, 'circulation', 'CHECKOUT'),
(6, 'phone', 0, 'circulation', 'CHECKOUT'),
(7, 'email', 0, 'ill', 'ILL_PICKUP_READY'),
(7, 'sms',   0, 'ill', 'ILL_PICKUP_READY'),
(7, 'phone', 0, 'ill', 'ILL_PICKUP_READY'),
(8, 'email', 0, 'ill', 'ILL_REQUEST_UNAVAIL'),
(8, 'sms',   0, 'ill', 'ILL_REQUEST_UNAVAIL'),
(8, 'phone', 0, 'ill', 'ILL_REQUEST_UNAVAIL');
