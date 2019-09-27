INSERT INTO "UserMessages" JSON
'{ "user": {
        "username": "Maria",
        "password": "123456"
        },
    "sender": "Bob",
    "messenger_user_id":"FG1234",
    "messenger_name": "WhatsApp",
    "messenger_id": "WA123",
    "message": ["01.09.2010": ["Hello!", "What's going?"], "05.09.2019": ["Why did you not answer me"]],
    "catagory": ["sport", "travel"]
}';

SELECT JSON * FROM "UserMessages";

INSERT INTO "UserMessages" JSON
'{ "user": {
        "username": "Bob",
        "password": "654321"
        },
    "sender": "Maria",
    "messenger_user_id":"FG1234",
    "messenger_name": "WhatsApp",
    "messenger_id": "WA123",
    "message": ["05.09.2019": ["Because"]],
    "catagory": ["travel"]
}';

SELECT JSON * FROM "UserMessages";

INSERT INTO "UserMessages" JSON
'{ "user": {
        "username": "Petya",
        "password": "qwerty"
        },
    "sender": "Bob",
    "messenger_user_id":"FG1234",
    "messenger_name": "Telegram",
    "messenger_id": "T4",
    "message": ["01.09.2010": ["Hello!"], "05.09.2019": ["Hello!"], "06.09.2019": ["Hi!", "Hello"]],
    "catagory": ["sport", "travel"]
}';

SELECT JSON * FROM "UserMessages";


ALTER TYPE user_info_type ADD birthday date;

UPDATE "UserMessages" SET messenger_name = "Telegram", sender = 'Mike'
WHERE user = ('Bob', '654321');

SELECT * FROM "UserMessages";

UPDATE "UserMessages" SET sender = 'Viki'
WHERE messenger_id = 'T4';

SELECT * FROM "UserMessages";



SELECT JSON message
FROM "UserMessages"
WHERE user = ('Bob', '654321');

SELECT JSON message
FROM "UserMessages"
WHERE user = ('Bob', '654321') AND messenger_id = "T4";

SELECT JSON catagory 
FROM "UserMessages"
WHERE user = ('Bob', '654321');

SELECT JSON sender
FROM "UserMessages"
WHERE user = ('Bob', '654321');


DELETE FROM "UserMessages" 
WHERE user = ('Bob', '654321');

DELETE FROM "UserMessages"
WHERE messenger_id = 'T4';

DELETE FROM "UserMessages"
WHERE sender = "Maria";






