from flask import Flask, render_template, session, request, redirect, url_for
from flask_mysqldb import MySQL

app = Flask(__name__)
app.secret_key = '2312'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'db_Dim'
mysql = MySQL(app)

@app.route('/login', methods = ['GET', 'POST'])
def login():
    cur = mysql.connection.cursor()
    if request.method == 'POST' and 'inpUsername' in request.form and 'inpPass' in request.form:
        username = request.form['inpUsername']
        password = request.form['inpPass']
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM tbl_akun where username = %s and password = %s", (username, password))
        result = cur.fetchone()
        if result:
            session['is_logged_in'] = True
            session['username'] = result[1]
            return redirect(url_for('afterlogin'))
        else:
            return render_template('login.html')
    else:
        return render_template('login.html')

@app.route('/register', methods = ['GET', 'POST'])
def register():
    if request.method == "GET":
        return render_template('register.html')
    else:
        nama = request.form['nama']
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO tbl_akun (nama, username, password, email) VALUES (%s, %s, %s, %s)", (nama, username, password, email))
        mysql.connection.commit()
        session['username'] = request.form['username']
        session['password'] = request.form['password']
        return redirect(url_for('login'))

@app.route("/")
def landingpage():
    return render_template('landingpage.html')

@app.route("/afterlogin")
def afterlogin():
    return render_template('afterlogin.html')

@app.route("/logout")
def logout():
    session.pop('is_logged_in')
    session.pop('username', None)
    return redirect(url_for('landingpage'))


@app.route('/simpan', methods=['POST', 'GET'])    
def simpan():
    nama = request.form['nama']
    jumlah = request.form['jumlah']
    ukuran = request.form['ukuran']
    harga = request.form['harga']
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO tbl_pesananuser(nama,jumlah, ukuran, harga) VALUE(%s,%s,%s,%s)", (nama, jumlah, ukuran, harga)) 
    mysql.connection.commit()
    cur.close()
    return redirect(url_for("afterlogin"))

@app.route('/keranjang')
def keranjang():
    print(session)  # Cetak variabel sesi
    if 'is_logged_in' not in session or not session['is_logged_in']:
        return redirect(url_for('login'))

    cur = mysql.connection.cursor() 
    cur.execute("SELECT * FROM tbl_pesananuser")
    data = cur.fetchall()
    cur.close()
    return render_template('keranjang.html', menu='data', submenu='nama', data=data)



if __name__ == "__main__" :
    app.run(debug=True)

