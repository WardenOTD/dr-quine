# another comment
SRC = '''# another comment
SRC = {0}{0}{0}{1}{0}{0}{0}
FILE = {0}{0}{0}{2}{0}{0}{0}
MAIN = {0}{0}{0}{3}{0}{0}{0}

exec(MAIN)'''
FILE = '''
with open("Grace_kid.py", "w") as f:
	f.write(SRC.format(chr(39), SRC, FILE, MAIN))
'''
MAIN = '''
def main():
    exec(FILE)
    return 0

main()
'''

exec(MAIN)