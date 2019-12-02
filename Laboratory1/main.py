from cassandra.cluster import Cluster
from cassandra import ConsistencyLevel
from cassandra.query import SimpleStatement


cluster = Cluster()
session = cluster.connect('MessageKey')



def print_query(mou):
    for m in mou:
        print(m)





query1 = SimpleStatement("""
                            SELECT sender, messeges
                            FROM "MessageKey"."UserMessages"
                            WHERE username = 'mike14'
                            ALLOW FILTERING;
                        """,
                         consistency_level=ConsistencyLevel.QUORUM
                         )

Q1 = session.execute(query1)


query2 = SimpleStatement("""
                                SELECT sender, messeges
                                FROM "MessageKey"."UserMessages"
                                WHERE messenger_id = 'W1' and username = '12gamer21'
                                ALLOW FILTERING;
                        """,
                         consistency_level=ConsistencyLevel.QUORUM
                         )

Q2 = session.execute(query2)


query3 = SimpleStatement("""
                            SELECT people_list, category_population
                            FROM "MessageKey"."Category"
                            WHERE category_name = 'Sport'
                            ALLOW FILTERING;
                        """,
                         consistency_level=ConsistencyLevel.QUORUM)

Q3 = session.execute(query3)

query4 = SimpleStatement("""
                            SELECT messenger_user_id, username
                            FROM "MessageKey"."UserMessages"
                            WHERE messenger_id = 'T1'
                            ALLOW FILTERING;
                        """,
                         consistency_level=ConsistencyLevel.QUORUM)

Q4 = session.execute(query4)
print("ЗАПРОС 1")
print_query(Q1)
print("")
print("ЗАПРОС 2")
print_query(Q2)
print("")
print("ЗАПРОС 3")
print_query(Q3)
print("")
print("ЗАПРОС 4")
print_query(Q4)