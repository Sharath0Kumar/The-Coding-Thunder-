from flask import Flask, render_template, request ,session, redirect, flash
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_mail import Mail
from werkzeug.utils import secure_filename
import os
import math
import json

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
# app.config.update(
#     MAIL_SERVER = 'smtp.gmail.com',
#     MAIL_PORT = '465',
#     MAIL_USE_SSL = True,
#     MAIL_USERNAME = params['gmail-user'],
#     MAIL_PASSWORD = params['gmail-password']
# )
# mail = Mail(app)
if(local_server):
    app.config["SQLALCHEMY_DATABASE_URI"] = params['local_uri']
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = params['prod_uri']
db = SQLAlchemy(app)


class Contacts(db.Model):
    sno= db.Column(db.Integer ,primary_key=True)
    name= db.Column(db.String(80) ,nullable=False)
    phone_no= db.Column(db.String(12) ,nullable=False)
    msg= db.Column(db.String(120) ,nullable=False)
    date= db.Column(db.String(12) ,nullable=True)
    email= db.Column(db.String(20) ,nullable=False)

class Posts(db.Model):
    sno= db.Column(db.Integer ,primary_key=True)
    title= db.Column(db.String(80) ,nullable=False)
    slug= db.Column(db.String(21) ,nullable=False)
    content= db.Column(db.String(120) ,nullable=False)
    tagline= db.Column(db.String(120) ,nullable=False)
    date= db.Column(db.String(12) ,nullable=True)
    img_file= db.Column(db.String(12) ,nullable=True)

@app.route("/")
def home():
    flash('Welcome to my blog','success')
    posts = Posts.query.filter_by().all()
    no_of_posts = int(params['no_of_posts'])
    last = math.ceil(len(posts) / no_of_posts) - 1

    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 0
    else:
        page = int(page)

    posts = posts[page * no_of_posts : (page + 1) * no_of_posts]

    # Pagination Logic
    if page == 0:
        prev = "#"
        next = "/?page=" + str(page + 1) if last > 0 else "#"
    elif page == last:
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)


    return render_template('index.html' ,params=params,posts=posts,prev= prev, next= next)

@app.route("/dashboard", methods= ['GET','POST'])
def dashboard():
    if('user' in session and session['user']==params['admin_user']):
        posts = Posts.query.all()
        return render_template('dashboard.html' ,params=params, posts= posts)
    
    if(request.method=='POST'):
        # Fetch form data
        username = request.form.get('email')
        userpass = request.form.get('password')
        if(username==params['admin_user'] and userpass==params['admin_password']):
            # set the session variable
            session['user']=username
            posts = Posts.query.all()
            return render_template('dashboard.html' ,params=params, posts= posts)
    
    return render_template('login.html' ,params=params)

@app.route("/about")
def about():
    return render_template('about.html' , params=params)

@app.route("/post/<string:post_slug>", methods= ['GET'])
def post_router(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()

    return render_template('post.html' ,params=params,post=post)


@app.route("/edit/<string:sno>", methods= ['GET','POST'])
def edit(sno):
    if('user' in session and session['user']==params['admin_user']):
        if(request.method=='POST'):
            box_title = request.form.get('title')
            tagline = request.form.get('tagline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if sno=='0':
                post = Posts(title=box_title, slug=slug, content=content, tagline=tagline, img_file=img_file, date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title=box_title
                post.slug=slug
                post.content=content
                post.tagline=tagline
                post.img_file=img_file
                post.date=date
                db.session.commit()
                return render_template('edit.html' ,params=params, sno=sno, post=post)

        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html' ,params=params, sno=sno, post=post)

@app.route("/uploader", methods= ['GET','POST'])
def uploader():
    if('user' in session and session['user']==params['admin_user']):
        if(request.method=='POST'):
            f = request.files['myfile']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename )))
            return "Uploaded successfully"


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route("/delete/<string:sno>", methods= ['GET','POST'])
def delete(sno) :
    if('user' in session and session['user']==params['admin_user']):
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route("/contact", methods= ['GET','POST'])
def contact():
    if(request.method=='POST'):
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')

        entry = Contacts(name=name, phone_no=phone, msg=message, email=email, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        # mail.send_message('New message from ' + name,
        #                   sender=email,
        #                   recipients=[params['gmail-user']],
        #                   body= message + "\n" + phone
        #                   )
        flash('Thanks for submitting your details. We will get back to you soon!','success')
    return render_template('contact.html', params=params)
    


app.run(debug=True)