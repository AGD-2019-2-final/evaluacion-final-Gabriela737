import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
#! /usr/bin/env python
import sys
if __name__ == "__main__":
    for line in sys.stdin:
        key = line.strip()[0]
        date = line.split('   ')[1].split()[0]
        valor = line.split('   ')[2].split()[0]
        print("{},{},{}\t".format(key,date,valor))
