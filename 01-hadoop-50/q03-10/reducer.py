import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
import sys
if __name__ == "__main__":
    for line in sys.stdin:
        line = line.split("\t")
        sys.stdout.write("{},{}\n".format(line[1].strip(),line[0].strip()))
