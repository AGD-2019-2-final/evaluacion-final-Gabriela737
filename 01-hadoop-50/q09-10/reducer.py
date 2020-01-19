import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
#! /usr/bin/env python
import sys

if __name__ == '__main__':
    lista = []
    for line in sys.stdin:
        key, data, val = line.split(",")
        lista.append([key,data,int(val.strip())])    
    lista = sorted(lista, key=lambda x: x[2])[:6]
    for line in lista:
        sys.stdout.write("{}\t{}\t{}\n".format(line[0], line[1], line[2]))
