import random

## input that will be encrypted

msg=input("write message here: ")
#print(f'initial message: {msg}')

##encryption bits

encr_bits= 256 //8 #needs to be //8 as every char is 8 bits
encr_char_used=""  #<-- list of chars that random key will be generated from
## characters used for encyption ASCII
for i in range(0x00, 0xFF):  # < -- range of ASCII table 0-255 written in Hex https://lwp.interglacial.com/appf_01.htm
    encr_char_used += chr(i)

#generating key for encryption based on number of bits

key=""

for i in range(encr_bits):
    key += random.choice(encr_char_used)

# key counter to match python 0 to 15 = 16
key_index = 0
max_key_index = encr_bits - 1

#print(f'encryption key: {key}')

with open('key.txt', 'w') as f:
    f.write(key)

#encryption msg process

encrypted_msg =""

for char in msg:
    encrypted_char = ord(char) ^ ord(key[key_index])  ## ord takes string and returns ACII value of that
    encrypted_msg += chr(encrypted_char) ## reveritng back ASCII number to char using chr() function
    if key_index >= max_key_index:
        key_index = 0
    else:
        key_index += 1

with open('e_msg.txt', 'w') as f:
    f.write(encrypted_msg)

print("\n\tmassage has been created, don't forget to send the key\n")

#print(f'encrypted message: {encrypted_msg}')
