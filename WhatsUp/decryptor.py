
with open('e_msg.txt') as f: lines = f.readline()
encrypted_msg=lines

with open('key.txt') as f: key = f.readline()

# key=input("please paste key here: ")


encr_bits=256//8
key_index = 0
max_key_index = encr_bits - 1
decr_msg=""

for char in encrypted_msg:
    decrypted_char = ord(char) ^ ord(key[key_index])
    decr_msg += chr(decrypted_char)
    if key_index >= max_key_index:
        key_index = 0
    else:
        key_index += 1
print(f'\ndecrypted msg from Friend: {decr_msg}')
print("\nif u want to reply create a message that will be encrypted")
