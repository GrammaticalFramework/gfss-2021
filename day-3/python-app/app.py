import pgf
import subprocess
import sys

# Open the PGF, read it into a pgf.PGF object
gr = pgf.readPGF("Unix.pgf")

# Get two concrete syntaxes
eng = gr.languages["UnixEng"]
unix = gr.languages["UnixConc"]

# This part reads the command line, see https://www.askpython.com/python/python-command-line-arguments
if len(sys.argv) < 2:
    raise ValueError('Please give me a command to run.')

command_as_list = sys.argv[1:] # command as a list of strings

command = ' '.join(command_as_list)
print(command)

# Is the command we read unix or English?
try:
    i = eng.parse(command)
    _, exp = i.next()
    #print(exp)
    #print("This was English!")
    lin = unix.linearize(exp)
    print(lin)
    subprocess.run(lin)

except pgf.ParseError:
    try:
        i = unix.parse(command)
        _, exp = i.next()
        print(exp)
        print("This was already a Unix command")
    except pgf.ParseError:
        print("Be more careful, don't give me nonsense input lah!")
