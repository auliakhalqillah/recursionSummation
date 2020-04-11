# Summation process by using recursion method
# Written by    : Aulia Khalqillah,S.Si.,M.Si.
# Date          : April, 11th 2020
# Python ver    : 3.7

import numpy as np
# Recursive
def recursive_myadd(data):
    n = len(data)
    data = np.asarray(data)
    if n == 1:
        return data[0]
    else:
        sumres = data[0]+recursive_myadd(data[1:])
        return sumres

# Main Program
data = [3,2,5]
mysum = recursive_myadd(data)
print("Recursive sum\t:",mysum)
