import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
import sys
if __name__ == "__main__":
    for line in sys.stdin:
        key = line[0].strip()
        valor = line.split('   ')[2].split()[0]
        print("{},{}\t".format(key,valor))
