import sqlite3

con = sqlite3.connect("phone_book.db")
cursor = con.cursor()
def create_table():
    cursor.execute("CREATE TABLE IF NOT EXISTS Book (S_No INTEGER ,Name TEXT,Surname TEXT,Phone_number TEXT)")

def insert_new():
    name = input("Enter name :")
    surname = input("Enter surname :")
    phone_num = input("Enter phone number :")
    cursor.execute("SELECT * FROM Book")
    data = cursor.fetchall()
    num = len(data)+1
    cursor.execute("INSERT INTO Book (S_No,Name,Surname,Phone_number) VALUES (?,?,?,?)",(num,name,surname,phone_num))
    con.commit()
def show_list():
    cursor.execute("SELECT * FROM Book")
    data = cursor.fetchall()
    print("S.Nu: Name    Surname   Phone Number")
    for record in data:
        print(str(record).strip("()").replace(",",""))
    con.commit()
def update():
    show_list()
    seq = int(input("Enter the 'S_No' you want to update :"))
    name = input("Enter new name :")
    surname = input("Enter new surname :")
    phone_num = input("Enter new phone number :")
    cursor.execute("""UPDATE Book SET Name = ?, Surname = ?, Phone_number = ? WHERE S_No = ? """,(name,surname,phone_num,seq))
    con.commit()

def delete():
    show_list()
    seq = int(input("Enter the 'S_No' you want to delete :"))
    cursor.execute("""DELETE FROM Book WHERE S_No = ?""",(seq, ))
    cursor.execute("SELECT * FROM Book")
    data = cursor.fetchall()
    num = len(data)+1
    for i in range(seq,num+1):
        cursor.execute("""UPDATE Book SET S_No = ? WHERE S_No = ? """,(i,seq+1))
        seq+=1
    con.commit()
def clear_list():
    cursor.execute("DELETE FROM Book ")
    con.commit()

create_table()
print("\n-------------------------Welcome Your Phone Book--------------------------\n")
while True:
    choice = input("Enter \n(E)--> Enter log, \n(U)--> Update log, \n(D)--> Delete log, \n(CL)--> Clear Lİst \n(SL)--> Show list \n(X)--> Exit     :").lower()
    if choice == "e":
        insert_new()
    elif choice == "u":
        update()
    elif choice == "d":
        delete()
    elif choice == "cl":
        clear_list()
    elif choice == "sl":
        show_list()
    elif choice == "x":
        print("\nSee you..\n")
        break
    else:
        print("Please enter valid entry..")
        continue

con.close()
