import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    
    clave = None
    maximo = None
    minimo = None
    
    for line in sys.stdin:

        key, val = line.split(",")
        val = float(val)
        
        if maximo is None:
          maximo = val
        if minimo is None:
          minimo = val
        
        if key == clave:
            maximo = max(maximo,val)
            minimo = min(minimo,val)
        else:
            
            if clave is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(clave, maximo, minimo))

            clave = key
            maximo = val
            minimo = val
    sys.stdout.write("{}\t{}\t{}\n".format(clave,maximo, minimo))
