from flask import Blueprint, render_template, request, redirect, url_for
from mysql.connector import (connection)
from flask import session
moedas = Blueprint('moedas', __name__, template_folder='../frontend/template',  static_folder='../frontend/static')
import json
import os
import psycopg2




@moedas.route('/moedas', methods=['GET'])
def pegando_moedas():
    return render_template('confirmar_ganho.html')





@moedas.route("/moedas", methods=["POST"])
def adicionar_moedas():
    id_material = request.form['id_material']
    session['id_material'] = id_material
    
    conn = psycopg2.connect(
            host=os.environ['DB_HOST'],
            database=os.environ['DB_NAME'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD']
        )
    
    # Primeiro, verifica se há um aluno logado na sessão
    cpf = session.get('cpf_logado') or session.get('cpf_cadastro')

    # Se nenhum CPF for encontrado, retorna erro
    if not cpf:
        return "Erro: Nenhum CPF encontrado na sessão", 400  

    print(f"CPF do aluno: {cpf}")
    print(f"ID do material: {id_material}")

    cursor = conn.cursor()

    

    if id_material:
        # Verificar se o aluno já ganhou moedas por esse material
        cursor.execute("SELECT * FROM aluno_material WHERE aluno_cpf = %s AND id_material = %s", (cpf, id_material))
        if not cursor.fetchall():  # Se não encontrar, pode adicionar moedas
            cursor.execute("UPDATE aluno SET quant_moedas = quant_moedas + 10, ponto_atual = ponto_atual + 1 WHERE cpf = %s", (cpf,))
            cursor.execute("INSERT INTO aluno_material (aluno_cpf, id_material) VALUES (%s, %s)", (cpf, id_material))
            conn.commit()
    
    return redirect(url_for('moedas.voltando'))


@moedas.route('/voltando')
def voltando():
    return render_template('voltar.html')



@moedas.route('/progresso', methods=['GET'])
def progresso():
    cpf = session.get('cpf_logado')
    if not cpf:
        return "Erro: CPF não encontrado na sessão.", 400
    conn = psycopg2.connect(
            host=os.environ['DB_HOST'],
            database=os.environ['DB_NAME'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD']
        )
    cursor = conn.cursor()
    cursor.execute('SELECT ponto_atual FROM aluno WHERE cpf = %s', (cpf,))
    resultado = cursor.fetchone()

    cursor.execute("SELECT id, titulo FROM material")
    materiais = cursor.fetchall()

    cursor.execute("SELECT id_material FROM aluno_material WHERE aluno_cpf = %s", (cpf,))
    materiais_vistos = {row[0] for row in cursor.fetchall()}  # Conjunto de IDs dos materiais vistos

    cursor.close()

    if resultado:
        ponto_atual = resultado[0]  # Valor do ponto atual
        return render_template('progresso.html', ponto_atual=ponto_atual, materiais=materiais, materiais_vistos=materiais_vistos)
    else:
        return "Erro: Ponto atual não encontrado.", 404


@moedas.route('/voltar')
def voltar():
    # Primeiro tenta pegar o CPF do aluno logado, se não existir, usa o do recém-cadastrado
    cpf = session.get('cpf_logado') or session.get('cpf_cadastro')
    conn = psycopg2.connect(
            host=os.environ['DB_HOST'],
            database=os.environ['DB_NAME'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD']
        )
    if not cpf:
        return "Erro: Nenhum CPF encontrado na sessão", 400  # Evita continuar sem CPF

    cursor = conn.cursor()
    
    # Buscar quantidade de moedas do aluno
    sql = "SELECT quant_moedas FROM aluno WHERE cpf = %s"
    cursor.execute(sql, (cpf,))
    resultado = cursor.fetchone()
    
    if resultado:
        resultado = resultado[0]  # Pega a quantidade de moedas
    else:
        resultado = 0  # Caso o aluno ainda não tenha moedas registradas

    # Buscar materiais por percurso
    queries = [
        "SELECT material.titulo, material.conteudo, material.id FROM material WHERE material.id_percurso = 1 ORDER BY material.etapa ASC",
        "SELECT material.titulo, material.conteudo, material.id FROM material WHERE material.id_percurso = 2 ORDER BY material.etapa ASC",
        "SELECT material.titulo, material.conteudo, material.id FROM material WHERE material.id_percurso = 3 ORDER BY material.etapa ASC",
        "SELECT material.titulo, material.conteudo, material.id FROM material WHERE material.id_percurso = 4 ORDER BY material.etapa ASC"
    ]

    results = [cursor.execute(query) or cursor.fetchall() for query in queries]

    # Buscar materiais já vistos pelo aluno
    cursor.execute("SELECT id_material FROM aluno_material WHERE aluno_cpf = %s", (cpf,))
    materiais_vistos = {row[0] for row in cursor.fetchall()}  # Conjunto de IDs dos materiais vistos

    cursor.close()

    return render_template('tragetoria_material.html', 
                           moedas=resultado, 
                           percurso1=results[0], percurso2=results[1], 
                           percurso3=results[2], percurso4=results[3], 
                           materiais_vistos=materiais_vistos)




    










