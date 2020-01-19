import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':
    
    clave = None
    total = 0
    
    for line in sys.stdin:

        key, val = line.split("\t")
        val = int(val)

        if key == clave:
            total += val
        else:
            
            if clave is not None:
                sys.stdout.write("{}\t{}\n".format(clave, total))

            clave = key
            total = val
    sys.stdout.write("{}\t{}\n".format(clave, total))
