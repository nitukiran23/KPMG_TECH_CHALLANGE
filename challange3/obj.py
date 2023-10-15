from pprint import pprint

nested_dict = eval(input("Enter the object in {'person':{'name':{'first':'John'}}} or {\"person\":{\"name\":{\"first\":\"John\"}}} format : "))
a, b, c = input("Enter the key in a/b/c format : ").split("/")
pprint(nested_dict[a][b][c])
