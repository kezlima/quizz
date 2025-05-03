from flask import Flask
from flask import render_template
from flask import request
from mysql.connector import (connection)
from backend.material_tragetoria import material_tragetoria 
from backend.cadastro_login import cadastro_login
from backend.moedas import moedas
from backend.ranking import ranking 
from backend.quiz import quiz
from flask import send_file
import os
import psycopg2

import json
app = Flask(__name__,template_folder='../frontend/templates', static_folder='../frontend/static')
app.secret_key = 'sua_chave_secreta_unica_e_segura'


try:
        conn = psycopg2.connect(
            host=os.environ['DB_HOST'],
            database=os.environ['DB_NAME'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD']
        )

        cursor = conn.cursor()

        cursor.execute("""
            CREATE TABLE IF NOT EXISTS alunos (
                id SERIAL PRIMARY KEY,
                nome VARCHAR(100),
                cpf VARCHAR(11) UNIQUE,
                quant_moedas INT DEFAULT 0,
                ponto_atual INT DEFAULT 0
            );
        """)

        # Adicione aqui outras tabelas se quiser
        # cursor.execute(""" CREATE TABLE ... """)

        conn.commit()
        cursor.close()
        conn.close()
        print("Tabelas criadas com sucesso!")

except Exception as e:
        print("Erro ao criar tabelas:", e)

@app.route("/")
def debug():
    return render_template('index.html')


@app.route('/funcao', methods=['POST'])
def verificar():

    tipo=request.form['tipo']

    if tipo=='professor':
        return render_template('admin.html')
    
    elif tipo=='aluno':
        return render_template('verificacao.html')
    else:
        return 'alguma coisa pode estar errada'

app.register_blueprint(material_tragetoria) 
app.register_blueprint(cadastro_login) 
app.register_blueprint(moedas) 
app.register_blueprint(ranking) 
app.register_blueprint(quiz)