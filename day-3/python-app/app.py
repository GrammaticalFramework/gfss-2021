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

# Is the command we read unix or English?
try:
    i = eng.parse(command)
except pgf.ParseError:
    print("Be more careful, don't give me nonsense input lah!")
else:
    _, exp = i.__next__()
    lin = unix.linearize(exp)
    subprocess.run(lin.split())

    # Homework: make it work nice and respond to both English and Unix!
    # try:
    #     i = unix.parse(command)
    #     _, exp = i.__next__()
    #     print("This was already a Unix command, talk to me in English!")
    #     subprocess.run(command_as_list)
    # except pgf.ParseError: