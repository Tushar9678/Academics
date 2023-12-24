def remove_duplicate(d):
    lst = []
    for element in d:
        if element not in lst:
            lst.append(element)
    return lst

def intersection(a,b):
    c =[]
    for element in a:
        if element in b:
            c.append(element)
    return c

def union(a,b):
    c=a.copy()
    for element in b:
        if element not in c:
            c.append(element)
    return c

def difference(a,b):
    lst = []
    for element in a:
        if element not in b:
            lst.append(element)
    return lst

def symmetric_difference(a,b):
    d = union(difference(a,b), difference(b,a))
    return d

def listofCB(a,b):
    m = intersection(a,b)
    print("\n\nList of student who play both cricket and badminton : ", m)
    return len(m)

def eCoBnB(a,b):
    d = symmetric_difference(a,b)
    print("\n\nList of student who eiter play cricket or badminton but not both : ", d)
    return len(d)

def nCnB(a,b,c):
    d = difference(c, union(a,b))
    print("\n\nList of students who play neiter cricket nor badminton : " , d)
    return len(d)

def CFnB(a,b,c):
    d = difference(union(a,c), b)
    print("\n\nList of students who play Cricket and Football but not badminton : ", d)
    return d

def Input(a):
    temp = []
    print(a)
    i = int(input("\nHow many students you want to enter : "))
    print("Enter the name of students : \n")
    for element in range(i):
         j = input()
         temp.append(j)
    temp = remove_duplicate(temp)
    return temp 

def Continue():
    a = input("\nDo you want to continue : (Y/N)")
    if (a == 'Y'):
        return 1
    else:
        return 0

SEcomp = Input("\nFor SE comp,")
print("\nThe Original List of se students : "+ str(SEcomp))

Cricket = Input("\nStudents who play cricket, ")
print("\nThe students who play cricket : "+ str(Cricket))

Badminton = Input("\nStudents who play badminton, ")
print("\nThe stuents who play badminton : "+ str(Badminton))

Football = Input("\nStudents who play football, ")
print("\nThe stuents who play football : "+ str(Football))



flag = 1
while flag == 1:
    print("\n\n--------------------MENU--------------------\n")
    print("1. List of students who play both cricket and badminton")
    print("2. List of students who play either cricket or badminton but not both")
    print("3. List of students who play neither cricket nor badminton")
    print("4. Number of students who play cricket and football but not badminton")
    print("5. Exit\n")
    ch = int(input("Enter your choise from 1 to 5 : "))
    if (ch == 1):
        listofCB(Cricket, Badminton)
        flag = Continue()

    elif(ch == 2):
        eCoBnB(Cricket, Badminton)
        flag = Continue()

    elif(ch == 3):
        j = nCnB(Cricket,Badminton,Football)
        print("\nNumber of students who play neithe cricket nor badminton : " + str(j))
        flag = Continue()
    
    elif(ch == 4):
        m = CFnB(Cricket,Badminton,Football)
        print("Number of students who play cricket and football but not badminton : " + str(m))
        flag = Continue()
    
    elif(ch == 5):
        flag = 0
        print("\nThanks for using these program!!\n\n")
    
    else:
        print("\nYou have entered wrong choice!!")
        flag = Continue()