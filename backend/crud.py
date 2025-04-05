from mysql.connector import (connection)

import json

def conexaoBD():
    try:
        with open('../banco de dados/progame.conf', 'r') as dadosbd: 
            databd = json.load(dadosbd)

        cnx = connection.MySQLConnection(user=databd['user'],
                                    password=databd['pass'],
                                    host=databd['host'],
                                    database=databd['database'])
        
        return cnx
    
    except Exception as e:
        print (f"FALHA NA CONEXÃO COM O BANCO: {e}")
    
def createUpdateDelete(sql:str, tupla:tuple, tipo:str):
    try:
        with open('../banco de dados/progame.conf') as dadosbd: 
            databd = json.load(dadosbd)

        cnx = connection.MySQLConnection(user=databd['user'],
                                    password=databd['pass'],
                                    host=databd['host'],
                                    database=databd['database'])

        cursor = cnx.cursor()

        if tipo == "INSERT":
            cursor.execute(sql, tupla)
        elif tipo == "UPDATE":
            cursor.execute(sql, tupla)
        elif tipo == "DELETE":
            cursor.execute(sql, tupla)
        
        cnx.commit()

        return True

    except Exception as e:
        print (f"FALHA NO {tipo} NO BANCO: {e}")
        return False

def read(sql:str, tupla:tuple, tipoRetorno='fetchall'):
    try: 
        conexao = conexaoBD()
        cursor = conexao.cursor(dictionary=True)

        cursor.execute(sql, tupla)

        if tipoRetorno == 'fetchone':
            return cursor.fetchone()
        else:
            return cursor.fetchall()
    
    except Exception as e:
        print (f"FALHA NA LEITURA DO BANCO: {e}")
        return None