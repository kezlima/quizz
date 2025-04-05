from flask import Blueprint, render_template, request
from mysql.connector import (connection)
from flask import session
import json
# Criando o Blueprint para a página inicial
progresso = Blueprint('progresso', __name__, template_folder='../frontend/template')

# Rota da página inicial
try:
        with open('../banco de dados/progame.conf', 'r') as dadosbd: 
            databd = json.load(dadosbd)

        cnx = connection.MySQLConnection(user=databd['user'],
                                    password=databd['pass'],
                                    host=databd['host'],
                                    database=databd['database'])
        
    
except Exception as e:
        print (f"FALHA NA CONEXÃO COM O BANCO: {e}")
@progresso.route('/progresso', methods=['GET'])
def ranking_de_alunos():
    cursor=cnx.cursor()
    cursor.execute('SELECT nome, quant_moedas FROM aluno order by quant_moedas desc')
    resultado = cursor.fetchall()
    cursor.close()

    return render_template('ranking.html', ranking=resultado)

