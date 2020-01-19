import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
import sys
if __name__ == '__main__':
    
    clave = None
    max_amount = 0
    
    for line in sys.stdin:

        key, val = line.split("\t")
        val = int(val)

        if key == clave:
           max_amount = max(max_amount,val)
        else:
            
            if clave is not None:
                sys.stdout.write("{}\t{}\n".format(clave, max_amount))

            clave = key
            max_amount = val
    sys.stdout.write("{}\t{}\n".format(clave, max_amount))
