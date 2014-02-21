import random
import sys

def RanInputGen(bits,number_of_inputs):
    input_array=[]
    for i in range(0,number_of_inputs):
        bit_array=[]
        for r in range(0,bits):
            input = random.random()
            if(input<=0.5):
                bit_array.append(0)
            else:
                bit_array.append(1)
        input_array.append(bit_array)
    return input_array

def TestCoverInputGen(bits):
    #number of possiple values
    input_array=[]
    for i in range(0,pow(2,bits)):
        input_array.append(bin(i)[2:].zfill(bits))
    return input_array
    
def yes(prompt = '"Do you whant test coverage(t) or random gen(r)? (t/r):" '):
    while True:
        try:
            i = raw_input(prompt)
        except KeyboardInterrupt:
            return False
        if i.lower() in ('t'): return True
        elif i.lower() in ('r'): return False
if __name__ == "__main__": 
    print "Welcome to the outogenerate test vector machine"
    gen=yes()
    items=[]
    bits= input("Pick a word size:")
    print "the word is : "+str(bits)+" bits long"
    number_of_inputs= input("Pick a input size: ")
    print "The Input size is : "+ str(number_of_inputs)+" bits long"
    if(gen):
        items = TestCoverInputGen(bits)
        f = open('output.txt', 'w')
        for i in range(0,len(items)):
            f.write("%s\n" % str(items[i]))
        f.close()
        print "Your output.txt is ready"

    else:
        items = RanInputGen(bits,number_of_inputs)
        f = open('output.txt', 'w')
        for item in range(0,len(items)):
            for i in items[item]:
                f.write("%s" % str(i))
            f.write("\n")
        f.close()
        print "Your output.txt is ready"
    
    # Write to file  
    