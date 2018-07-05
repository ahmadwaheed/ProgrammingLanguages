var x, y, a, b

# x in "final" expr is fine
fa x := 10 to 2*(10 -x + x) -> print x af

print 1111

# x in this "initial" expr is fine too, since it was given a value by
# previous fa
fa x := 3*(x/8 + 1) to 10 -> print x af

print 2222

fa a := 10 to 2 -> print a af

print 3333

# a in this "initial" expr is fine too, since it was given a value by
# previous fa (even though zero trip)
fa b := 3*(a/8 + 1) to 10 -> print b af

print 4444

# y in this "initial" expr isn't OK.
fa y := 3*(y/8 + 1) to 10 -> print y af
