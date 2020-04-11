import numpy as np
def recursive_myadd(data,storedata=[]):
    n = len(data)
    data = np.asarray(data)
    if n == 1:
        print("n is\t\t:",n)
        storedata.append(data[0])
        return data[0],storedata
    else:
        print("n is\t\t:",n)
        number = data[0]
        next_data,save_data = recursive_myadd(data[1:])
        print("Next data\t:",next_data)
        print("Number\t\t:",number)
        sumres = number+next_data
        storedata.extend([number])
        return sumres,storedata
