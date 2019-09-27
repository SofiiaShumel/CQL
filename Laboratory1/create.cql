CREATE KEYSPACE
IF NOT EXISTS messagekey
WITH replication ={
	'class': 'SimpleStrategy',
	'replication_factor':1
};



DROP TYPE IF EXISTS user_info_type;
CREATE TYPE IF NOT EXISTS user_info_type(
	username text,
	password text,
	photo blob
);



CREATE TABLE IF NOT EXISTS "UserMessages"(
	user user_info_type STATIC,
	sender text,
	messenger_user_id text STATIC,
	messenger_name text STATIC,
	messenger_id text,
	message map<date, list_messeges List<text>>,
	catagory set<text>,
	PRIMARY KEY ((messenger_user_id), sender)
);

