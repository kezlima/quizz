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
            CREATE TABLE IF NOT EXISTS aluno (
               cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100),
    quant_moedas INT DEFAULT 0,
    ponto_atual INT DEFAULT 0
        """)


        cursor.execute= (  """  CREATE TABLE IF NOT EXISTS material ( 
    id SERIAL PRIMARY KEY, 
    titulo VARCHAR(100), 
    conteudo VARCHAR(2000), 
    id_percurso INT,
    FOREIGN KEY (id_percurso) REFERENCES percurso(id)"""
)
        
        cursor.execute= (  """  CREATE TABLE IF NOT EXISTS percurso ( 
    id SERIAL PRIMARY KEY, 
    nome VARCHAR(100), 
    descricao VARCHAR(2000), 
    """
)
        cursor.execute= (  """  CREATE TABLE IF NOT EXISTS aluno_material ( 
    id SERIAL PRIMARY KEY, 
    aluno_cpf varchar(11), 
    id_material int, 
    FOREIGN KEY (aluno_cpf) REFERENCES aluno(cpf),
    FOREIGN KEY (id_material) REFERENCES material(id)"""
)     
        cursor.execute= (  """  CREATE TABLE IF NOT EXISTS pergunta_quiz ( 
    id SERIAL PRIMARY KEY,
    id_percurso INT NOT NULL,
    pergunta TEXT,
    opcao_a VARCHAR(255),
    opcao_b VARCHAR(255),
    opcao_c VARCHAR(255),
    resposta_correta CHAR(1),
    FOREIGN KEY (id_percurso) REFERENCES percurso(id)"""
)     
        
        # Adicione aqui outras tabelas se quis
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