# some comment

def func(nl, t):
	string = "# some comment{0}{0}def func(nl, t):{0}{1}string = {2}{3}{2}{0}{1}print(string.format(nl, t, chr(34), string), end=''){0}{1}return 0{0}{0}def main():{0}{1}# another comment{0}{1}func(chr(10), chr(9)){0}{1}return 0{0}{0}main()"
	print(string.format(nl, t, chr(34), string), end='')
	return 0

def main():
	# another comment
	func(chr(10), chr(9))
	return 0

main()