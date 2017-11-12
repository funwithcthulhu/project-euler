# frozen_string_literal: true

# Project Euler Problem 59 : XOR Decryption
# Each character on a computer is assigned a unique code and the
# preferred standard is ASCII (American Standard Code for Information
# Interchange). For example, uppercase A = 65, asterisk (*) = 42, and
# lowercase k = 107.

# A modern encryption method is to take a text file, convert the bytes
# to ASCII, then XOR each byte with a given value, taken from a secret
# key. The advantage with the XOR function is that using the same encryption
# key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107,
# then 107 XOR 42 = 65.

# For unbreakable encryption, the key is the same length as the plain text
# message, and the key is made up of random bytes. The user would keep the
# encrypted message and the encryption key in different locations, and without
# both "halves", it is impossible to decrypt the message.

# Unfortunately, this method is impractical for most users, so the modified
# method is to use a password as a key. If the password is shorter than the
# message, which is likely, the key is repeated cyclically throughout the
# message. The balance for this method is using a sufficiently long password
# key for security, but short enough to be memorable.

# Your task has been made easy, as the encryption key consists of three lower
# case characters. Using cipher.txt (right click and 'Save Link/Target As...'),
# a file containing the encrypted ASCII codes, and the knowledge that the plain
# text must contain common English words, decrypt the message and find the sum
# of the ASCII values in the original text.

#        user     system      total        real
# (The Gospel of John, chapter 1) 1 In the beginning the Word already
# existed. He was with God, and he was God. 2 He was in the beginning
# with God. 3 He created everything there is. Nothing exists that he
# didn't make. 4 Life itself was in him, and this life gives light to
# everyone. 5 The light shines through the darkness, and the darkness
# can never extinguish it. 6 God sent John the Baptist 7 to tell everyone
# about the light so that everyone might believe because of his testimony.
# 8 John himself was not the light; he was only a witness to the light. 9
# The one who is the true light, who gives light to everyone, was going to
# come into the world. 10 But although the world was made through him, the
# world didn't recognize him when he came. 11 Even in his own land and among
# his own people, he was not accepted. 12 But to all who believed him and
# accepted him, he gave the right to become children of God. 13 They are
# reborn! This is not a physical birth resulting from human passion or plan,
# this rebirth comes from God.14 So the Word became human and lived here on
# earth among us. He was full of unfailing love and faithfulness. And we have
# seen his glory, the glory of the only Son of the Father.
# sum of ASCII characters: 107359
#  18.040000   0.520000  18.560000 ( 18.590311)

# I found the answer pretty quick by only checking the 2nd and 12th words
# of the decoded text each cycle (got lucky). More time consuming was figuring
# out why my generalized 'verify' function wasn't working properly. Turns out
# the dictionary included with my Mac has over 280 thousand words, but for
# some reason doesn't include words like 'existed'... ? Anyway, found an open
# source dictionary online (https://github.com/atebits/Words)
# that actually has less words, but included just about everything except 'a'
# and conjunctions (didn't). So, the verify function here works for this
# solution, but I didn't expand it to include every possible edge case
# (other conjunctions, etc.)

# The algorithm is straightfoward. I generate a nested array of all possible key
# sequences with repeated_permutation. In order to cycle over them, I use
# a loop that increments over each key sequence in the keys array, and
# in order to cycle through the three keys, I use % 3.

# UPDATE: after reading some comments, I changed my algorithm to simply
# check that the frequency of the word 'the' is greater than 2 (duh..).
# This is more reliable for generalized input (assuming you check the
# output) and cuts the time down to ~3.5 seconds.

# 3.507302 seconds

time = Time.now

def verify(input)
  temp = input.dup.strip.downcase.gsub("didn't", '').gsub(' a ', ' ')
  temp.tr("\',.()!0-9;", '').split(' ').each do |word|
    return false unless @dict.include?(word)
  end
  true
end

file = File.read('p059_cipher.txt').chomp.split(',').map(&:to_i)
#@dict = File.read('dict.txt').split("\n")
keys = (97..122).to_a.repeated_permutation(3).to_a

j = 0
loop do
  decoded = ''
  sum = 0
  i = 0
  key = keys[j]
  file.each do |letter|
    decoded += (letter ^ (key[i % 3])).chr
    sum += letter ^ (key[i % 3])
    i += 1
  end
  j += 1

  #next unless verify(decoded)
  next unless decoded.downcase.split(' ').count('the') > 2
  at_exit do
    puts decoded
    puts "sum of ASCII characters: #{sum}"
    puts Time.now - time
  end
  exit
end
