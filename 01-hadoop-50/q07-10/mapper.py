import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
import sys
if __name__ == "__main__":
    for line in sys.stdin:
        key = line.strip()[0]
        date = line.split('\t')[0].split()[1]
        valor = line.split('\t')[0].split()[2]
        print("{},{},{}\t".format(key,date,valor))
