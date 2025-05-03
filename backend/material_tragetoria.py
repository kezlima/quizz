from flask import Flask, Blueprint, render_template, request
from mysql.connector import (connection)
import json
import os
import psycopg2
material_tragetoria = Blueprint('material_tragetoria', __name__, template_folder='../frontend/template')


@material_tragetoria.route('/material_cadastro', methods=['GET'])
def material_insercao():
    return render_template('material.html')

@material_tragetoria.route('/bimestre', methods=['GET'])
def bimestre():
    return render_template('tragetoria.html')

@material_tragetoria.route('/cadastrar_percurso', methods=['POST'])
def cadastro_percurso():

    nome=request.form['nome']
    descricao=request.form['descricao']
    
    conn = psycopg2.connect(
            host=os.environ['DB_HOST'],
            database=os.environ['DB_NAME'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD']
        )
    cursor=conn.cursor()
    sql="INSERT INTO percurso (nome, descricao) VALUES ( %s, %s) "
    
    tupla=(nome,descricao)

   
    cursor.execute(sql, tupla)

    conn.commit()
    cursor.close()

    return render_template('material.html')

@material_tragetoria.route('/cadastrar_percurso', methods=['GET'] )
def cadastrar_material():
    return render_template('tragetoria.html')

@material_tragetoria.route('/tragetoria_material', methods=['GET'] )
def ver_tragetorias():
    conn = psycopg2.connect(
            host=os.environ['DB_HOST'],
            database=os.environ['DB_NAME'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD']
        )
    cursor=conn.cursor()

    queries = [
        "SELECT  material.titulo, material.conteudo,  material.id FROM material WHERE material.id_percurso = 1 ORDER BY material.etapa ASC",
        "SELECT  (material.titulo, material.conteudo, material.id) FROM material WHERE material.id_percurso = 2 ORDER BY material.etapa ASC",
        "SELECT   material.titulo, material.conteudo, material.id FROM material WHERE material.id_percurso = 3 ORDER BY material.etapa ASC",
        "SELECT   material.titulo, material.conteudo, material.id FROM material WHERE material.id_percurso = 4 ORDER BY material.etapa ASC"
    ]
    results = []
    for query in queries:
        cursor.execute(query)
        results.append(cursor.fetchall())  # Pegando os resultados corretamente

    cursor.close()

    print(results[0])  # Agora deve imprimir os dados corretamente

    return render_template(
        'tragetoria_material.html', 
        percurso1=results[0], 
        percurso2=results[1], 
        percurso3=results[2], 
        percurso4=results[3]
    )
 

    

@material_tragetoria.route('/inserindo_material', methods=['POST'])
def inserindo_material():

    titulo =request.form['titulo']
    conteudo=request.form['conteudo']
    id_percurso =request.form['id_percurso']
    etapa=request.form['etapa']
    
    conn = psycopg2.connect(
            host=os.environ['DB_HOST'],
            database=os.environ['DB_NAME'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD']
        )
    cursor=conn.cursor()
    sql="INSERT INTO material (titulo, conteudo) VALUES ( %s, %s, %s, %s) "
    
    tupla=(titulo, conteudo, id_percurso, etapa)
    cursor.execute(sql, tupla)
    conn.commit()
    cursor.close()
    return render_template('admin.html')

@material_tragetoria.route('/materiais', methods=['GET'])
def verficando_materiais():
   
        #considerando que em um ano temos 4 bimestre, teremos 4 tragetorias
        conn = psycopg2.connect(
            host=os.environ['DB_HOST'],
            database=os.environ['DB_NAME'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD']
        )
        cursor=conn.cursor()

        queries = [
        "SELECT  material.titulo, material.conteudo, material.id FROM material WHERE material.id_percurso = 1 ORDER BY material.etapa ASC",
        "SELECT material.titulo, material.conteudo, material.id FROM material WHERE material.id_percurso = 2 ORDER BY material.etapa ASC",
        "SELECT  material.titulo, material.conteudo, material.id FROM material WHERE material.id_percurso = 3 ORDER BY material.etapa ASC",
        "SELECT  material.titulo, material.conteudo, material.id FROM material WHERE material.id_percurso = 4 ORDER BY material.etapa ASC"
    ]

        results = [cursor.execute(query) or cursor.fetchall() for query in queries]

        cursor.close()

        return render_template('exibindo_tragetoria.html', percurso1=results[0], percurso2=results[1], percurso3=results[2], percurso4=results[3])

 


    

   