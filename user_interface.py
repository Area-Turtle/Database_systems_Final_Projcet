"""
This is the user interface where the program interacts with the user.
USAGE: 1. Go to sqlconfig.conf file and change the username and password
          values to the ones from you are using in your mysql instance
       2. Open a terminal windows and run the following command:
       python3 user_interface.py
NOTE: Only option 3 and 4 from the menu is implemented so students can
      understand the flow of the program as a base to
      implement the rest of the options
"""


def show_menu():
    """
    Prints in console the main menu
    :return: VOID
    """
    print("User Menu \n"
          "1. Create Account \n"
          "2. Login \n"
          "3. Search \n"
          "4. Insert \n"
          "5. Update \n"
          "6. Delete \n"
          "7. Exit \n")


def show_table_names(tables):
    """
    Show all the tables names
    :param tables: a list with the tables names.
                   You can get it by calling the method
                   get_table_names() from DB object
    :return: VOID
    """
    index = 1
    print("\nTables:")
    for table in tables:
        print(table[0])  # print tables names
        index += 1

def option1 (db_object, tables):
    """
    :param db_object:
    :return: VOID
    """
    # shows that tables names in menu
    #show_table_names(tables)

    # get user input
    try:
        table = "RegisteredUsers"
        Company = input("\nCompany: ")
        Gender = input("Gender: ")
        FirstName = input("First Name:  ")
        LastName = input("Last Name: ")
        Email = input("Email: ")
        UserName = input("User Name: ")
        Password = input("Password: ")
        Address = input("Address:  ")
        City = input("City: ")
        Country = input("Country: ")

        columns = db_object.get_column_names(table)
        print("Data successfully inserted into {} \n".format(table))

        print("Account created\n Welcome New User")

    except Exception as err:  # handle error
        print("The data couldn't be entered\n")
def option2 (db_object, tables):
    """
    :param db_object:
    :return: VOID
    """
    # shows that tables names in menu
    #show_table_names(tables)

    # get user input
    try:
        email_input = input("\nEmail: ")
        password_input= input("Password: ")

        table = "RegisteredUsers"
        columns = db_object.get_column_names(table)
        query = """SELECT * FROM {} WHERE {} = %s""".format(table, email)
        print(query)







    except Exception as err:  # handle error
        print("The data entry couldn't be found\n")

def option3(db_object, tables):
    """
    Search option
    :param db_object: database object
    :param tables: the name of the tables in the database
    :return: VOID
    """
    try:
        # shows that tables names in menu
        show_table_names(tables)

        # get user input
        table_selected = input("\nSelect a table to search: ")
        attribute_selected = input("Search by (i.e name)? ")
        value_selected = input("Enter the value: ")

        columns = db_object.get_column_names(table_selected)  # get columns names for the table selected

        # build queries with the user input
        query = """SELECT * FROM {} WHERE {} = %s""".format(table_selected, attribute_selected)

        value = value_selected

        # get the results from the above query
        results = db_object.select(query=query, values=value)
        column_index = 0

        # print results
        print("\n")
        print("Results from: " + table_selected)
        for column in columns:
            values = []
            for result in results:
                values.append(result[column_index])
            print("{}: {}".format(column[0], values) ) # print attribute: value
            column_index+= 1
        print("\n")

    except Exception as err:  # handle error
        print("The data requested couldn't be accessed\n")



# option 4 when user selects insert
def option4(db_object, tables):
    try:
        # show tables names
        show_table_names(tables)

        # get user input for insert
        table = input("\nEnter a table to insert data: ")
        attributes_str = input("Enter the name attribute/s separated by comma? ")
        values_str = input("Enter the values separated by comma: ")

        # from string to list of attributes and values
        if "," in attributes_str:  # multiple attributes
            attributes = attributes_str.split(",")
            values = values_str.split(",")
        else:  # one attribute
            attributes = [attributes_str]
            values = [values_str]

        if db_object.insert(table=table, attributes=attributes, values=values):
            print("Data successfully inserted into {} \n".format(table))

    except: # data was not inserted, then handle error
        print("Data couldn't to be inserted in ", table, "\n")

def option5(db_object,tables): #allows user to probably update data entries
    try:
        show_table_names(tables)

        # get user input
        table_selected = input("\nSelect a table to search: ")
        attribute_selected = input("Search by (i.e name)? ")
        value_selected = input("Enter the value: ")
        value_changed = input("Enter the value: ")

        columns = db_object.get_column_names(table_selected)  # get columns names for the table selected

        # build queries with the user input
        query = """SELECT * FROM {} WHERE {} = %s""".format(table_selected, attribute_selected)

        value = value_selected

        # get the results from the above query
        results = db_object.select(query=query, values=value)
        column_index = 0

        # from string to list of attributes and values
        if "," in attributes_str:  # multiple attributes
            attributes = attributes_str.split(",")
            values = values_str.split(",")
        else:  # one attribute
            attributes = [attributes_str]
            values = [values_str]

        if db_object.insert(table=table, attributes=attributes, values=values):
            print("Data successfully inserted into {} \n".format(table))


    except: # data was not inserted, then handle error
        print( "Data not allowed to be inserted ", table, "\n")

def option6(db_object,tables): #allows user to probably delete data entries
    try:
        show_table_names(tables)

        # get user input for update
        table = input("\nEnter a table to update data: ")
        attributes_str = input("Enter the name attribute/s separated by comma? ")

        # from string to list of attributes and values
        if "," in attributes_str:  # multiple attributes
            attributes = attributes_str.split(",")
        else:  # one attribute
            attributes = [attributes_str]

        if db_object.delete(table=table, attributes=attributes):
            print("Data successfully deleted in {} \n".format(table))

    except: # data was not inserted, then handle error
        print(attributes, "is not found in ", table, "\n")

##### Driver execution.....
from database import DB

print("Setting up the database......\n")

# DB API object
db = DB(config_file="sqlconfig.conf")

# create a database (must be the same as the one is in your config file)
database = "ArtGalleryManagementDB"
if db.create_database(database=database, drop_database_first=True):
    print("Created database {}".format(database))
else:
    print("An error occurred while creating database {} ".format(database))

# create all the tables from databasemodel.sql
db.run_sql_file("databasemodel.sql")

# insert sample data from insert.sql
db.run_sql_file("insert.sql")

print("\nSet up process finished\n")

tables = db.get_table_names()
show_menu()
option = int(input("Select one option from the menu: "))
while option != 7:
    if option == 1:
        option1(db, tables) # create your account
    elif option == 2:
        option2(db,tables)  # login
    elif option == 3:
        option3(db, tables)
    elif option == 4:
        option4(db, tables)
    elif option == 5: # update
        option5(db, tables)
    elif option == 6: # delete
        option6(db, tables)
    show_menu()
    option = int(input("Select one option from the menu: "))

# Example output for insert and search

"""
Setting up the database......

Created database ArtGalleryManagementDB
8 Executed queries from databasemodel.sql
29 Executed queries from insert.sql

Set up process finished

User Menu 
1. Create Account 
2. Login 
3. Search 
4. Insert 
5. Update 
6. Delete 
7. Exit 

Select one option from the menu: 4

Tables:
Album
Artist
Genre
Track

Enter a table to insert data: artist
Enter the name attribute/s separated by comma? id, name
Enter the values separated by comma: 7, Nina
Data successfully inserted into artist 

User Menu 
1. Create Account 
2. Login 
3. Search 
4. Insert 
5. Update 
6. Delete 
7. Exit 

Select one option from the menu: 4

Tables:
Album
Artist
Genre
Track

Enter a table to insert data: genre
Enter the name attribute/s separated by comma? description
Enter the values separated by comma: Hip Hop
Data successfully inserted into genre 

User Menu 
1. Create Account 
2. Login 
3. Search 
4. Insert 
5. Update 
6. Delete 
7. Exit 

Select one option from the menu: 3

Tables:
Album
Artist
Genre
Track

Select a table to search: artist
Search by (i.e name)? name
Enter the value: Nina


Results from: artist
id: [7]
name: ['Nina']


User Menu 
1. Create Account 
2. Login 
3. Search 
4. Insert 
5. Update 
6. Delete 
7. Exit 

Select one option from the menu: 3

Tables:
Album
Artist
Genre
Track

Select a table to search: genre
Search by (i.e name)? description
Enter the value: Hip Hop


Results from: genre
id: [6]
description: ['Hip Hop']


User Menu 
1. Create Account 
2. Login 
3. Search 
4. Insert 
5. Update 
6. Delete 
7. Exit 

Select one option from the menu: 
"""