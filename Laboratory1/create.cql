CREATE keyspace IF NOT EXISTS "MessageKey" WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};


CREATE TYPE "MessageKey"."PersonNameType" (
	first_name text,
	second_name text
);

CREATE TABLE IF NOT EXISTS "MessageKey"."UserMessages"(
	username text,
	real_name FROZEN<"PersonNameType">,
	sender text,
	messenger_name text,
	messenger_id text,
	messenger_user_id text,
	messeges map<date, FROZEN<list<text>>>,
	PRIMARY KEY ((messenger_id), username, sender)
);

CREATE TABLE IF NOT EXISTS "MessageKey"."Messengers"(
	messenger_id text,
	messenger_name text,
	messenger_logo blob,
	PRIMARY KEY (messenger_id)
);

CREATE TABLE IF NOT EXISTS "MessageKey"."Category"(
	category_name text,
	category_population int,
	people_list set<text>,
	PRIMARY KEY (category_name)		
);

CREATE TABLE IF NOT EXISTS "MessageKey"."Users"(
	username text,
	password text,
	real_name FROZEN<"PersonNameType">,
	PRIMARY KEY (username)
)

