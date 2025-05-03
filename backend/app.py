from flask import Flask
from flask import render_template
from flask import request
from mysql.connector import (connection)
from material_tragetoria import material_tragetoria 
from cadastro_login import cadastro_login
from moedas import moedas
from ranking import ranking 
from quiz import quiz
from flask import send_file


from crud import createUpdateDelete
import json
app = Flask(__name__,template_folder='../frontend/templates', static_folder='../frontend/static')
app.secret_key = 'sua_chave_secreta_unica_e_segura'
try:
        with open('../banco de dados/progame.conf', 'r') as dadosbd: 
            databd = json.load(dadosbd)

        cnx = connection.MySQLConnection(user=databd['user'],
                                    password=databd['pass'],
                                    host=databd['host'],
                                    database=databd['database'])
        
    
except Exception as e:
        print (f"FALHA NA CONEXÃO COM O BANCO: {e}")
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