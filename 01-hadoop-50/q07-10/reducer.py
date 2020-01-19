import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
      key = line.split(',')[0].strip()
      value = line.split(',')[1].strip()
      value2 = line.split(',')[2].strip()
      sys.stdout.write("{}\t{}\t{}\n".format(key,value,value2 ))
