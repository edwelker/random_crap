#!/usr/bin/ruby

string = ''
File.open('test.txt','r') { |f| string = f.read }

#print "\n\n"

print "\nThis is the match: (after this newline):\n"
print(/<!--(.*|\s)-->/m.match(string))

print "\nThis is the string: (newline before and after this line) \n", string

#print "\n\n"
