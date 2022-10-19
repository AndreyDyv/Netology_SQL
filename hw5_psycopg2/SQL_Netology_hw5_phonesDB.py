from pprint import pprint

import psycopg2


def create_db(conn):
    with conn.cursor() as cur:
        cur.execute("""
        CREATE TABLE IF NOT EXISTS clients(
            id SERIAL PRIMARY KEY,
            first_name VARCHAR(60) NOT NULL,
            last_name VARCHAR(90) NOT NULL,
            email VARCHAR(90) NOT NULL
        );
        """)

        cur.execute(""" 
        CREATE TABLE IF NOT EXISTS phones(
            id SERIAL PRIMARY KEY,
            client_id INTEGER NOT NULL REFERENCES clients(id),
            phone_number VARCHAR(15)
        );
        """)
        conn.commit()


def new_client(conn, first_name, last_name, email, phone_number=None):
    with conn.cursor() as cur:
        cur.execute(f"""
        WITH proc AS 
        (INSERT INTO clients 
            (first_name, last_name, email) 
        VALUES 
            (%s, %s, %s) 
        RETURNING id)
        INSERT INTO phones 
            (client_id, phone_number) 
        VALUES((SELECT id FROM proc), %s);
        """, ((f'{first_name}'), (f'{last_name}'), (f'{email}'), (f'{phone_number}')))
        conn.commit()
        return print(f'Created new client: {first_name}  {last_name}, email: {email} , phone number: {phone_number}')


def add_phone_number(conn, client_id, phone_number):
    with conn.cursor() as cur:
        cur.execute(f"""
            INSERT INTO phones 
                (client_id, phone_number)
            VALUES 
                (%s, %s);
            """, ((f'{client_id}'), (f'{phone_number}')))
        conn.commit()
        return print(f'Phone number: {phone_number} added to client id {client_id}')


def update_client(conn, client_id, first_name=None, last_name=None, email=None, phone_number=None):
    with conn.cursor() as cur:
        def update_first_name():
            cur.execute(f"""
                UPDATE clients
                SET first_name =%s
                WHERE id =%s;
            """, ((f'{first_name}'), (f'{client_id}')))
            conn.commit()
            return print(f'Client\'s first name changed on {first_name}')

        def update_last_name():
            cur.execute(f"""
                UPDATE clients
                SET last_name =%s 
                WHERE id =%s;
            """, ((f'{last_name}'), (f'{client_id}')))
            conn.commit()
            return print(f'Client\'s last name changed on {last_name}')

        def update_email():
            cur.execute(f"""
                UPDATE clients
                SET email =%s 
                WHERE id =%s;
                """, ((f'{email}'), (f'{client_id}')))
            conn.commit()
            return print(f'Client\'s email changed on {email}')

        def update_phone_number():
            cur.execute(f"""
                UPDATE phones 
                SET phone_number =%s 
                WHERE client_id =%s;
            """, ((f'{phone_number}'), (f'{client_id}')))
            conn.commit()
            return print(f'Client\'s phone number changed on {phone_number}')

        if first_name is None and last_name is None and email is None and phone_number is None:  # 1
            return print('Client\'s information is not updated. Please, check your input')
        if last_name is None and email is None and phone_number is None:  # 2
            update_first_name()
            return
        if first_name is None and email is None and phone_number is None:  # 3
            update_last_name()
            return
        if first_name is None and last_name is None and phone_number is None:  # 4
            update_email()
            return
        if first_name is None and last_name is None and email is None:  # 5
            update_phone_number()
            return
        if last_name is None and email is None:  # 6  - 2 item
            update_first_name()
            update_phone_number()
            return
        if last_name is None and phone_number is None:  # 7
            update_first_name()
            update_email()
            return
        if first_name is None and last_name is None:  # 8
            update_email()
            update_phone_number()
            return
        if first_name is None and email is None:  # 9
            update_last_name()
            update_phone_number()
            return
        if first_name is None and phone_number is None:  # 10
            update_last_name()
            update_email()
            return
        if email is None and phone_number is None:  # 11
            update_first_name()
            update_last_name()
            return
        if first_name is None:  # 12
            update_last_name()
            update_email()
            update_phone_number()
            return
        if last_name is None:  # 13
            update_first_name()
            update_email()
            update_phone_number()
            return
        if email is None:  # 14
            update_first_name()
            update_last_name()
            update_phone_number()
            return
        if phone_number is None:  # 15
            update_first_name()
            update_last_name()
            update_email()
            return
        else:  # 16
            update_first_name()
            update_last_name()
            update_email()
            update_phone_number()
            return print(f'All data on client id {client_id} is updated')


def delete_phone(conn, client_id, phone_number):
    with conn.cursor() as cur:
        cur.execute(f"""
            DELETE FROM phones 
            WHERE client_id =%s 
            AND phone_number =%s;
        """, ((f'{client_id}'), (f'{phone_number}')))
        conn.commit()
        return print(f'Phone number {phone_number} is deleted')


def delete_client(conn, client_id):
    with conn.cursor() as cur:
        cur.execute(f"""
            DELETE FROM phones
            WHERE client_id =%s;
        """, (f'{client_id}',))
        cur.execute(f"""
            DELETE FROM clients 
            WHERE id =%s;
        """, (f'{client_id}',))
        conn.commit()
        return print('Client is deleted')


def find_client(conn, first_name=None, last_name=None, email=None, phone_number=None):
    with conn.cursor() as cur:
        if first_name is None and last_name is None and email is None and phone_number is None:  # 1
            return print('Client\'s information is not find. Please, check your input')
        if last_name is None and email is None and phone_number is None:  # 2
            cur.execute(f""" 
                        SELECT c.id, c.first_name,  c.last_name, c.email, p.phone_number  
                        FROM clients AS c
                        LEFT JOIN phones AS p 
                        ON c.id = p.client_id 
                        WHERE c.first_name =%s 
                        ORDER BY c.id;
                    """, (f'{first_name}',))
            return print(cur.fetchall())
        if first_name is None and email is None and phone_number is None:  # 3
            cur.execute(f""" 
                        SELECT c.id, c.first_name,  c.last_name, c.email, p.phone_number  
                        FROM clients AS c
                        LEFT JOIN phones AS p 
                        ON c.id = p.client_id 
                        WHERE c.last_name =%s 
                        ORDER BY c.id;
                    """, (f'{last_name}',))
            return print(cur.fetchall())
        if first_name is None and last_name is None and phone_number is None:  # 4
            cur.execute(f""" 
                        SELECT c.id, c.first_name,  c.last_name, c.email, p.phone_number  
                        FROM clients AS c
                        LEFT JOIN phones AS p 
                        ON c.id = p.client_id 
                        WHERE c.email =%s  
                        ORDER BY c.id;
                    """, (f'{email}',))
            return print(cur.fetchall())
        if first_name is None and last_name is None and email is None:  # 5
            cur.execute(f""" 
                        SELECT c.id, c.first_name,  c.last_name, c.email, p.phone_number  
                        FROM clients AS c
                        LEFT JOIN phones AS p 
                        ON c.id = p.client_id 
                        WHERE p.phone_number =%s 
                        ORDER BY c.id;
                    """, (f'{phone_number}',))
            return print(cur.fetchall())
        if last_name is None and email is None:  # 6
            cur.execute(f""" 
                        SELECT c.id, c.first_name, c.last_name, c.email, p.phone_number  
                        FROM clients AS c
                        LEFT JOIN phones AS p 
                        ON c.id = p.client_id 
                        WHERE c.first_name =%s  
                        AND p.phone_number =%s 
                        ORDER BY c.id;
                    """, ((f'{first_name}'), (f'{phone_number}')))
            return print(cur.fetchall())
        if last_name is None and phone_number is None:  # 7
            cur.execute(f""" 
                        SELECT c.id, c.first_name,  c.last_name, c.email, p.phone_number  
                        FROM clients AS c
                        LEFT JOIN phones AS p 
                        ON c.id = p.client_id 
                        WHERE c.first_name =%s  
                        AND c.email =%s 
                        ORDER BY c.id;
                    """, ((f'{first_name}'), (f'{email}')))
            return print(cur.fetchall())
        if first_name is None and last_name is None:  # 8
            cur.execute(f""" 
                        SELECT c.id, c.first_name,  c.last_name, c.email, p.phone_number  
                        FROM clients AS c
                        LEFT JOIN phones AS p 
                        ON c.id = p.client_id 
                        WHERE c.email =%s  
                        AND p.phone_number =%s 
                        ORDER BY c.id;
                    """, ((f'{email}'), (f'{phone_number}')))
            return print(cur.fetchall())
        if first_name is None and email is None:  # 9
            cur.execute(f""" 
                        SELECT c.id, c.first_name,  c.last_name, c.email, p.phone_number  
                        FROM clients AS c
                        LEFT JOIN phones AS p 
                        ON c.id = p.client_id 
                        WHERE c.last_name =%s  
                        AND p.phone_number =%s 
                        ORDER BY c.id;
                    """, ((f'{last_name}'), (f'{phone_number}')))
            return print(cur.fetchall())
        if first_name is None and phone_number is None:  # 10
            cur.execute(f""" 
                        SELECT c.id, c.first_name,  c.last_name, c.email, p.phone_number  
                        FROM clients AS c
                        LEFT JOIN phones AS p 
                        ON c.id = p.client_id 
                        WHERE c.last_name =%s  
                        AND c.email =%s 
                        ORDER BY c.id;
                    """, ((f'{last_name}'), (f'{email}')))
            return print(cur.fetchall())
        if email is None and phone_number is None:  # 11
            cur.execute(f""" 
                        SELECT c.id, c.first_name,  c.last_name, c.email, p.phone_number  
                        FROM clients AS c
                        LEFT JOIN phones AS p 
                        ON c.id = p.client_id 
                        WHERE c.first_name =%s  
                        AND c.last_name =%s
                        ORDER BY c.id;
                    """, ((f'{first_name}'), (f'{last_name}')))
            return print(cur.fetchall())
        if first_name is None:  # 12
            cur.execute(f""" 
                        SELECT c.id, c.first_name,  c.last_name, c.email, p.phone_number  
                        FROM clients AS c
                        LEFT JOIN phones AS p 
                        ON c.id = p.client_id 
                        WHERE c.last_name =%s  
                        AND c.email =%s 
                        AND p.phone_number =%s 
                        ORDER BY c.id;
                    """, ((f'{last_name}'), (f'{email}'), (f'{phone_number}')))
            return print(cur.fetchall())
        if last_name is None:  # 13
            cur.execute(f""" 
                        SELECT c.id, c.first_name,  c.last_name, c.email, p.phone_number  
                        FROM clients AS c
                        LEFT JOIN phones AS p 
                        ON c.id = p.client_id 
                        WHERE c.first_name =%s  
                        AND c.email =%s 
                        AND p.phone_number =%s 
                        ORDER BY c.id;
                    """, ((f'{first_name}'), (f'{email}'), (f'{phone_number}')))
            return print(cur.fetchall())
        if email is None:  # 14
            cur.execute(f""" 
                        SELECT c.id, c.first_name,  c.last_name, c.email, p.phone_number  
                        FROM clients AS c
                        LEFT JOIN phones AS p 
                        ON c.id = p.client_id 
                        WHERE c.first_name =%s  
                        AND c.last_name =%s  
                        AND p.phone_number =%s 
                        ORDER BY c.id;
                    """, ((f'{first_name}'), (f'{last_name}'), (f'{phone_number}')))
            return print(cur.fetchall())
        if phone_number is None:  # 15
            cur.execute(f""" 
                        SELECT c.id, c.first_name,  c.last_name, c.email, p.phone_number  
                        FROM clients AS c
                        LEFT JOIN phones AS p 
                        ON c.id = p.client_id 
                        WHERE c.first_name =%s  
                        AND c.last_name =%s  
                        AND c.email =%s 
                        ORDER BY c.id;
                    """, ((f'{first_name}'), (f'{last_name}'), (f'{email}')))
            return print(cur.fetchall())
        else:  # 16
            cur.execute(f""" 
                        SELECT c.id, c.first_name,  c.last_name, c.email, p.phone_number  
                        FROM clients AS c
                        LEFT JOIN phones AS p 
                        ON c.id = p.client_id 
                        WHERE c.first_name =%s  
                        AND c.last_name =%s 
                        AND c.email =%s 
                        AND p.phone_number =%s 
                        ORDER BY c.id;
                    """, ((f'{first_name}'), (f'{last_name}'), (f'{email}'), (f'{phone_number}')))
            return print(cur.fetchall())


if __name__ == '__main__':
    with psycopg2.connect(database='clients_db', user='postgres', password='postgres') as conn:
        with conn.cursor() as cur:
            cur.execute("""
            DROP TABLE phones, clients;
            """)

            # 1
            create_db(conn)

            cur.execute("""
            INSERT INTO clients 
                (first_name, last_name, email)
            VALUES
                ('Иван', 'Иванов', 'a@mail.ru'), 
                ('Петр', 'Иванов', 'p@mail.ru'), 
                ('Иван', 'Петров', 'b@mail.ru'),
                ('Михаил', 'Сидоров', 'c@mail.ru'), 
                ('Иванка', 'Иванова', 'n@mail.ru'), 
                ('Ольга', 'Петрова', 's@mail.ru'), 
                ('Светлана', 'Сидорова', 'df@mail.ru'), 
                ('Олег', 'Булыгин', '123@mail.ru'), 
                ('Елена', 'Иванова', 'jk@mail.ru'),
                ('Владимир', 'Иванов', 'z@mail.ru');
            """)  # add to clients
            conn.commit()

            cur.execute("""
            INSERT INTO phones 
                (client_id, phone_number)
            VALUES
                (1, '+7911'), 
                (2, '+7911'), 
                (3, '11125355'), 
                (3, '123'), 
                (4, NULL), 
                (5, '89878184578'), 
                (6, ''), 
                (7, NULL), 
                (7, '3546'), 
                (7, '927'), 
                (7, '928'),  
                (8, '151'), 
                (9, '111'), 
                (10, '7897');
            """)  # add to phones
            conn.commit()

            # 2
            new_client(conn, first_name='Вася', last_name='Пупкин', email='pup@mail.ru')
            new_client(conn, first_name='Ozzy', last_name='Osbourne', email='blood@hell.com', phone_number='666')
            new_client(conn, first_name='Homer', last_name='Simpson', email='dhua@couch.com', phone_number='963258')
            new_client(conn, first_name='Bart', last_name='Simpson', email='bart@s.com', phone_number='147852')
            new_client(conn, first_name='Liza', last_name='Simpson', email='smartpenties@m.com', phone_number='126578')
            new_client(conn, first_name='Marge', last_name='Simpson', email='bluehair@h.com', phone_number='5871204')
            print()

            # 3
            add_phone_number(conn, 5, '78545855')
            add_phone_number(conn, 11, '987927')
            add_phone_number(conn, 12, '665')
            print()

            # 4
            update_client(conn, 1)
            print()
            update_client(conn, 2, first_name='Victor')
            print()
            update_client(conn, 3, last_name='TTT')
            print()
            update_client(conn, 4, email='see@ru')
            print()
            update_client(conn, 5, phone_number='5878')
            print()
            update_client(conn, 6, first_name='Tom', phone_number='2222')
            print()
            update_client(conn, 7, first_name='Rita', email='@ita')
            print()
            update_client(conn, 8, email='@125sg', phone_number='8785441')
            print()
            update_client(conn, 9, last_name='FDF', phone_number='4446')
            print()
            update_client(conn, 10, last_name='KJH', email='@fgfh')
            print()
            update_client(conn, 11, first_name='Fred', last_name='H')
            print()
            update_client(conn, 12, last_name='Loo', email='@loo', phone_number='45445')
            print()
            update_client(conn, 13, first_name='Sam', email='@@@', phone_number='444')
            print()
            update_client(conn, 14, first_name='D', last_name='I', phone_number='333')
            print()
            update_client(conn, 15, first_name='F', last_name='K', email='@you')
            print()
            update_client(conn, 16, first_name='S', last_name='M', email='@ghgj', phone_number='5243')
            print()

            # 5
            find_client(conn)
            print()
            find_client(conn, first_name='Victor')
            print()
            find_client(conn, last_name='Иванов')
            print()
            find_client(conn, email='b@mail.ru')
            print()
            find_client(conn, phone_number='123')
            print()
            find_client(conn, first_name='Rita', phone_number='3546')
            print()
            find_client(conn, first_name='Михаил', email='see@ru')
            print()
            find_client(conn, email='@ita', phone_number='927')
            print()
            find_client(conn, last_name='Сидорова', phone_number='928')
            print()
            find_client(conn, last_name='Булыгин', email='@125sg')
            print()
            find_client(conn, first_name='Sam', last_name='Simpson')
            print()
            find_client(conn, last_name='Иванова', email='n@mail.ru', phone_number='5878')
            print()
            find_client(conn, first_name='Tom', email='s@mail.ru', phone_number='2222')
            print()
            find_client(conn, first_name='Елена', last_name='FDF', phone_number='4446')
            print()
            find_client(conn, first_name='Fred', last_name='H', email='pup@mail.ru')
            print()
            find_client(conn, first_name='Иван', last_name='Иванов', email='a@mail.ru', phone_number='+7911')
            print()

            # 6
            delete_phone(conn, client_id=1, phone_number='+7911')
            delete_phone(conn, client_id=7, phone_number='3546')
            delete_phone(conn, client_id=15, phone_number='126578')
            print()

            # 7
            delete_client(conn, client_id=5)
            delete_client(conn, client_id=8)
            delete_client(conn, client_id=12)
            print()

            cur.execute("""
            SELECT * FROM clients;
            """)
            pprint(cur.fetchall())

            cur.execute("""
            SELECT * FROM phones;
            """)
            pprint(cur.fetchall())

    conn.close()
