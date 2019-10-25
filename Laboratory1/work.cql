
//3 insert in table 'Messengers'
INSERT INTO "MessageKey"."Messengers"
	JSON '{"messenger_id": "T1", "messenger_name": "Telegram" }';

INSERT INTO "MessageKey"."Messengers"
	JSON '{"messenger_id": "W1", "messenger_name": "WhatsApp" }';
	
INSERT INTO "MessageKey"."Messengers"
	JSON '{"messenger_id": "V1", "messenger_name": "Viber" }';

	
SELECT JSON * FROM "MessageKey"."Messengers";






//3 insert in table 'Users'
INSERT INTO "MessageKey"."Users"
	JSON '{"username": "mike14", "password": "123456", "real_name": {"first_name": "Mike", "second_name": "Mikus"} }';

INSERT INTO "MessageKey"."Users"
	JSON '{"username": "12gamer21", "password": "12gamer21", "real_name": {"first_name": "Carl", "second_name": "Bukovsky"} }';
	
INSERT INTO "MessageKey"."Users"
	JSON '{"username": "maria", "password": "qwerty", "real_name": {"first_name": "Maria"} }';
	
SELECT JSON * FROM "MessageKey"."Users";


//4 insert in table 'UserMessages'
INSERT INTO "MessageKey"."UserMessages"
	JSON '{ "messenger_id": "T1", 
			"username": "mike14", 
			"sender": "maria", 
			"messeges": {"2018-09-20":["Hello","How are you?"], "2018-02-02": ["No"] },
			"messenger_name": "Telegram",
			"messenger_user_id": "111",
			"real_name": {"first_name": "Mike", "second_name": "Mikus"}
		
}';

INSERT INTO "MessageKey"."UserMessages"
	JSON '{ "messenger_id": "T1", 
			"username": "12gamer21", 
			"sender": "maria", 
			"messeges": {"2018-08-21":["Hello"], "2018-09-22": ["Hello"] },
			"messenger_name": "Telegram",
			"messenger_user_id": "112",
			"real_name": {"first_name": "Carl", "second_name": "Bukovsky"}
}';

INSERT INTO "MessageKey"."UserMessages"
	JSON '{ "messenger_id": "W1", 
			"username": "12gamer21", 
			"sender": "misteruser", 
			"messeges": {"2019-09-20":["We have a big problem"], "2018-09-18": ["Dont worry! U will die!"] },
			"messenger_name": "WhatsApp",
			"messenger_user_id": "122",
			"real_name": {"first_name": "Carl", "second_name": "Bukovsky"}
}';

INSERT INTO "MessageKey"."UserMessages"
	JSON '{ "messenger_id": "W1", 
			"username": "12gamer21", 
			"sender": "hala", 
			"messeges": {"2019-09-20":["We have a big problem"], "2018-09-18": ["Dont worry! U will die!"] },
			"messenger_name": "WhatsApp",
			"messenger_user_id": "122",
			"real_name": {"first_name": "Dan", "second_name": "Bukovsky"}
}';

SELECT JSON * FROM "MessageKey"."UserMessages";



SELECT people_list, category_population
FROM "MessageKey"."Category"
WHERE category_name = 'Sport'
ALLOW FILTERING; 

SELECT messenger_user_id, username
FROM "MessageKey"."UserMessages"
WHERE messenger_id = 'T1'
ALLOW FILTERING;




UPDATE "MessageKey"."Users"
SET real_name = {
		first_name: 'Maria',
		second_name: 'Ivanova'
}
WHERE username = 'maria';

SELECT JSON * FROM "MessageKey"."Users"
WHERE username = 'maria' ;				 

					 
UPDATE "MessageKey"."UserMessages" 
SET real_name ={
				first_name: 'update',
				second_name: 'Bukovsky'
				}, 
	messenger_user_id = '122'
WHERE username ='12gamer21' AND messenger_id ='W1' AND sender = 'misteruser';

SELECT JSON * FROM "MessageKey"."UserMessages" 		
WHERE username ='12gamer21'
ALLOW FILTERING; 
//it's bad style!!! 
//Changing Carl to Dan happened not everywhere. FIX IT!!!
//проблема заключается в том, что Static field сохраняется только на узле, а у меня данные одного чела хранятся на разных узлах, если на одном меняется, то на другом не факт
//скорее всего, нужно именить структуру - модель					


UPDATE "MessageKey"."Users"
SET password = 'ytrewq'
WHERE username = 'maria';

SELECT JSON * FROM "MessageKey"."Users"
WHERE username = 'maria';




// запросы
SELECT sender, messeges
FROM "MessageKey"."UserMessages"
WHERE username = 'mike14'
ALLOW FILTERING; 

SELECT sender, messeges
FROM "MessageKey"."UserMessages"
WHERE messenger_id = 'W1' and username = '12gamer21'
ALLOW FILTERING; 


SELECT people_list, category_population
FROM "MessageKey"."Category"
WHERE category_name = 'Sport'
ALLOW FILTERING; 

SELECT messenger_user_id, username
FROM "MessageKey"."UserMessages"
WHERE messenger_id = 'T1'
ALLOW FILTERING;





DELETE FROM "MessageKey"."UserMessages" 
WHERE messenger_id = 'W1' AND username = '12gamer21' AND sender = 'hala';

SELECT * FROM "MessageKey"."Users";

DELETE FROM "MessageKey"."Users"
WHERE username='maria';

DELETE FROM "MessageKey"."UserMessages"
WHERE messenger_id = 'W1';

DELETE FROM "MessageKey"."UserMessages"
WHERE messenger_id = 'T1' and username = '12gamer21';


