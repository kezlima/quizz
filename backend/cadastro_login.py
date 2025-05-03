from flask import Blueprint, render_template, request, session, redirect, url_for
from mysql.connector import (connection)
import json


cadastro_login = Blueprint('cadastro_login', __name__, template_folder='../frontend/template', static_folder='../frontend/static')

try:
        with open('../banco de dados/progame.conf', 'r') as dadosbd: 
            databd = json.load(dadosbd)

        cnx = connection.MySQLConnection(user=databd['user'],
                                    password=databd['pass'],
                                    host=databd['host'],
                                    database=databd['database'])
        
    
except Exception as e:
        print (f"FALHA NA CONEXÃO COM O BANCO: {e}")

@cadastro_login.route('/cadastro', methods=['GET'])
def pagina_de_cadastro():

    return render_template('cadastro.html')


@cadastro_login.route('/cadastro', methods=['POST'])
def cadastro_aluno():
    nome=request.form['nome']
    cpf=request.form['cpf']
    session['cpf_cadastro'] = cpf

    insert_query = "INSERT INTO aluno (nome, cpf) VALUES (%s, %s)"
    cursor.execute(insert_query, (nome, cpf))
    cnx.commit()

    # Atualização
    update_query = """
        UPDATE aluno
        SET quant_moedas = 0, ponto_atual = 0
        WHERE quant_moedas IS NULL OR ponto_atual IS NULL
    """
    cursor.execute(update_query)
    cnx.commit()

    print("Operações realizadas com sucesso.")

   
    cursor = cnx.cursor()
    query = "SELECT quant_moedas FROM aluno WHERE cpf = %s"
    cursor.execute(query, (cpf,))
    resultado = cursor.fetchone()  # Apenas uma chamada para fetchone()

    queries = [
        "SELECT  material.titulo, material.conteudo, material.id FROM material WHERE material.id_percurso = 1 ORDER BY material.etapa ASC",
        "SELECT material.titulo, material.conteudo, material.id_percurso, material.etapa FROM material WHERE material.id_percurso = 2 ORDER BY material.etapa ASC",
        "SELECT  material.titulo, material.conteudo, material.id_percurso, material.etapa FROM material WHERE material.id_percurso = 3 ORDER BY material.etapa ASC",
        "SELECT  material.titulo, material.conteudo, material.id_percurso, material.etapa FROM material WHERE material.id_percurso = 4 ORDER BY material.etapa ASC"
    ]

    results = [cursor.execute(query) or cursor.fetchall() for query in queries]

    cursor.close()
    
    return redirect(url_for('cadastro_login.login_aluno'))
    #return render_template('tragetoria_material.html', moedas=resultado, percurso1=results[0], percurso2=results[1], percurso3=results[2], percurso4=results[3])
   

@cadastro_login.route('/login_aluno')
def pagina_login():
    return render_template('conectar_aluno.html')

@cadastro_login.route('/login_aluno', methods=['POST'])
def login_aluno():
    cpf = request.form['cpf']
    session['cpf_logado'] = cpf

    cursor = cnx.cursor()
    query = "SELECT quant_moedas FROM aluno WHERE cpf = %s"
    cursor.execute(query, (cpf,))
    resultado = cursor.fetchone()  # Apenas uma chamada para fetchone()

    queries = [
        "SELECT  material.titulo, material.conteudo, material.id FROM material WHERE material.id_percurso = 1 ORDER BY material.etapa ASC",
        "SELECT material.titulo, material.conteudo, material.id FROM material WHERE material.id_percurso = 2 ORDER BY material.etapa ASC",
        "SELECT  material.titulo, material.conteudo, material.id  FROM material WHERE material.id_percurso = 3 ORDER BY material.etapa ASC",
        "SELECT  material.titulo, material.conteudo, material.id  FROM material WHERE material.id_percurso = 4 ORDER BY material.etapa ASC"
    ]

    results = [cursor.execute(query) or cursor.fetchall() for query in queries]

    cursor.execute("SELECT id_material FROM aluno_material WHERE aluno_cpf = %s", (cpf,))
    materiais_vistos = {row[0] for row in cursor.fetchall()}  # Criamos um conjunto de IDs


    cursor.close()
    
    if resultado is not None:
        quant_moedas = resultado[0]  # O valor de quant_moedas está na primeira posição da tupla
        return render_template('tragetoria_material.html', moedas=quant_moedas, materiais_vistos=materiais_vistos, percurso1=results[0], percurso2=results[1], percurso3=results[2], percurso4=results[3])
    else:
        return "Aluno não encontrado", 404
