import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
import sys
if __name__ == "__main__":
    for line in sys.stdin:
      key = line.split(',')[1].strip()
      value = line.split(',')[0].strip()
      sys.stdout.write("{}\t{}\n".format(key,value))
