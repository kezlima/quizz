from flask import Blueprint, render_template, request, redirect, url_for
from mysql.connector import (connection)
from flask import session
import json
import os
import psycopg2

quiz = Blueprint('quiz', __name__, template_folder='../frontend/template')



@quiz.route('/quiz', methods=['GET'])
def adicionando_quiz():
    return render_template('adicionando_quiz.html')


@quiz.route('/adicionando_pergunta', methods=['POST'])
def adicionando_pergunta():

    bimestre=int(request.form['bimestre'])
    pergunta=request.form['pergunta']
    opcaoA=request.form['opcaoA']
    opcaoB=request.form['opcaoB']
    opcaoC=request.form['opcaoC']
    correta=request.form['correta']

    conn = psycopg2.connect(
            host=os.environ['DB_HOST'],
            database=os.environ['DB_NAME'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD']
        )
    cursor=conn.cursor()
    insert_query = """
        INSERT INTO pergunta_quiz (id_percurso, pergunta, opcao_a, opcao_b, opcao_c, resposta_correta)
        VALUES (%s, %s, %s, %s, %s, %s)
    """
    valores = (bimestre, pergunta, opcaoA, opcaoB, opcaoC, correta)

    cursor.execute(insert_query, valores)
    conn.commit()

    return render_template('adicionando_quiz.html')



@quiz.route("/realizar_quiz", methods=["POST"])
def exibir_quiz():
    id_percurso=request.form['id_percurso']
    session['id_percurso'] = id_percurso
   
    conn = psycopg2.connect(
            host=os.environ['DB_HOST'],
            database=os.environ['DB_NAME'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD']
        )

    cursor = conn.cursor()
    cursor.execute("SELECT * FROM pergunta_quiz WHERE id_percurso = %s", (id_percurso,))
    perguntas = cursor.fetchall()
    return render_template("quiz.html", perguntas=perguntas)


@quiz.route("/respostas", methods=["POST"])
def responder_quiz():
    id_percurso = session.get('id_percurso')

    conn = psycopg2.connect(
            host=os.environ['DB_HOST'],
            database=os.environ['DB_NAME'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD']
        )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM pergunta_quiz WHERE id_percurso = %s", (id_percurso,))
    perguntas = cursor.fetchall()

    acertos = 0
    resultados = []

    for p in perguntas:
        pergunta_id = p[0]
        enunciado = p[2]
        alternativas = [p[3], p[4], p[5]]
        resposta_correta = p[6]
        resposta_aluno = request.form.get(f"q{pergunta_id}")

        acertou = resposta_aluno == resposta_correta
        if acertou:
            acertos += 1

        resultados.append({
            "enunciado": enunciado,
            "alternativas": alternativas,
            "resposta_aluno": resposta_aluno,
            "resposta_correta": resposta_correta,
            "acertou": acertou
        })


    return render_template("resultado.html", acertos=acertos, total=len(perguntas), resultados=resultados)

#Esse e o certo