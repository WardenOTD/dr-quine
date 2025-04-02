from os import system
SRC='''from os import system
SRC={0}{0}{0}{1}{0}{0}{0}
NAME={0}{0}{0}{2}{0}{0}{0}
def creator(i):
	fname = NAME.format(i)
	with open(fname, "w") as f:
		f.write(SRC.format(chr(39), SRC, NAME, chr(123), chr(125), i))
	return fname

def executor(fname):
	run = f"python3 {3}fname{4}"
	system(run)

def main():
	i = {5}
	i -= 1
	if i < 0:
		return 0
	executor(creator(i))

main()'''
NAME='''Sully_{}.py'''
def creator(i):
	fname = NAME.format(i)
	with open(fname, "w") as f:
		f.write(SRC.format(chr(39), SRC, NAME, chr(123), chr(125), i))
	return fname

def executor(fname):
	run = f"python3 {fname}"
	system(run)

def main():
	i = 5
	i -= 1
	if i < 0:
		return 0
	executor(creator(i))

main()