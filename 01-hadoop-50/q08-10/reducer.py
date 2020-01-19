import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    currkey = None
    suma = 0; 
    cantidad = 0
    for line in sys.stdin:
        key, val = line.split(",")
        val = float(val)
        if currkey == key:
            suma += val; 
            cantidad += 1
        else:
            if currkey is not None:
                print("{}\t{}\t{}".format(currkey, suma, (suma/cantidad)))
            currkey = key
            suma = val; 
            cantidad = 1
    print("{}\t{}\t{}".format(currkey, suma, (suma/cantidad)))
