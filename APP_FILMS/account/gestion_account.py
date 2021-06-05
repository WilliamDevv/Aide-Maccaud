"""
    Fichier : gestion_account.py
    Auteur : OM 2021.03.16
    Gestions des "routes" FLASK et des données pour les personne.
"""
import sys

import pymysql
from flask import flash
from flask import redirect
from flask import render_template
from flask import request
from flask import session
from flask import url_for

from APP_FILMS import obj_mon_application
from APP_FILMS.database.connect_db_context_manager import MaBaseDeDonnee
from APP_FILMS.erreurs.exceptions import *
from APP_FILMS.erreurs.msg_erreurs import *
#from APP_FILMS.personne.gestion_personne_wtf_forms import FormWTFAjouterPersonne
#from APP_FILMS.personne.gestion_personne_wtf_forms import FormWTFDeletePersonne
#from APP_FILMS.personne.gestion_personne_wtf_forms import FormWTFUpdatePersonne


"""
    Auteur : WP 2021.05.22
    Définition d'une "route" /newindex

    Test : ex : http://127.0.0.1:5005/newindex
"""


@obj_mon_application.route("/newindex")
def newindex():
    return render_template("newhome.html")


"""
    Auteur : WP 2021.05.22
    Définition d'une "route" /register
    
    Test : ex : http://127.0.0.1:5005/register
"""


@obj_mon_application.route("/register", methods=['GET, POST'])
def register():
    
    if request.method == "POST":
        try:
            try:
                MaBaseDeDonnee().connexion_bd.ping(False)
            except Exception as erreur:
                flash(f"Dans Gestion personne ...terrible erreur, il faut connecter une base de donnée", "danger")
                print(f"Exception grave Classe constructeur GestionPersonnes {erreur.args[0]}")
                raise MaBdErreurConnexion(f"{msg_erreurs['ErreurConnexionBD']['message']} {erreur.args[0]}")

            with MaBaseDeDonnee().connexion_bd.cursor() as mc_register:


    return render_template("account/register.html")


"""
    Auteur : WP 2021.05.22
    Définition d'une "route" /register

    Test : ex : http://127.0.0.1:5005/register
"""


@obj_mon_application.route("/login")
def login():
    return render_template("account/login.html")