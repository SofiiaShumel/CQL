from cassandra.cluster import Cluster


cluster = Cluster()
session = cluster.connect('MessageKey')

query1 = session.execute("""
                        SELECT * FROM "MessageKey"."UserMessages"
                        """)

for row in query1:
    print(row)

print(" ")

query2 = session.execute("""
                        SELECT * FROM "MessageKey"."Users" 
                        """)
for row in query2:
    print(row)
print(" ")

session.execute("""
                BEGIN BATCH
                
                INSERT INTO "MessageKey"."UserMessages"
                    JSON '{ "messenger_id": "W1", 
                            "username": "12gamer21", 
                            "sender": "Moo", 
                            "messeges": {"2019-09-20":["We have a big problem"], "2018-09-18": ["Dont worry! U will die!"] },
                            "messenger_name": "WhatsApp",
                            "messenger_user_id": "122",
                            "real_name": {"first_name": "Dan", "second_name": "Bukovsky"}
                }';


                INSERT INTO "MessageKey"."Users" 
                JSON '{"username": "Moo", 
                        "password": "111", 
                        "real_name": {"first_name": "Moo", "second_name": "M"} }';

                APPLY BATCH;
                """)

print("AFTER BATCH")

query3 = session.execute("""
                        SELECT * FROM "MessageKey"."UserMessages"
                        """)

for row in query3:
    print(row)

print(" ")

query4 = session.execute("""
                        SELECT * FROM "MessageKey"."Users" 
                        """)
for row in query4:
    print(row)
print(" ")

