import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
import sys
if __name__ == "__main__":
    for line in sys.stdin:
      valor = line.split(',')[2]
      sys.stdout.write("{}\t1\n".format(valor))
