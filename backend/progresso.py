from flask import Blueprint, render_template, request
from mysql.connector import (connection)
from flask import session
import json
import os
import psycopg2

progresso = Blueprint('progresso', __name__, template_folder='../frontend/template')


@progresso.route('/progresso', methods=['GET'])
def ranking_de_alunos():

    conn = psycopg2.connect(
            host=os.environ['DB_HOST'],
            database=os.environ['DB_NAME'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD']
        )
    cursor=conn.cursor()
    cursor.execute('SELECT nome, quant_moedas FROM aluno order by quant_moedas desc')
    resultado = cursor.fetchall()
    cursor.close()

    return render_template('ranking.html', ranking=resultado)

