# some comment

def func(nl, t):
	string = "# some comment{1}{1}def func(nl, q):{1}{2}string = {3}{4}{3}{1}{2}print(string.format(nl, t, chr(34), string)){1}{2}return 0{1}{1}def main():{1}{2}# another comment{1}{2}func(chr(10), chr(9)){1}{2}return 0"
	print(string.format(nl, t, chr(34), string))
	return 0

def main():
	# another comment
	func(chr(10), chr(9))
	return 0