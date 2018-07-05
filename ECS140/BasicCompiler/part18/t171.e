var a, b

print {2>0 -> 11 else 22}
printnl
print {2>10 -> 11 else 22}
printnl
print {2>10 -> 11 else 22} + {2>0 -> 111 else 222}
printnl
print {2>10 -> 11 [] 3>0 -> 33 else 22}
printnl
print {2>10 -> 11
       [] 3>0 -> {2>10 -> 11
                  [] 0-3>0 -> 33
                  else {2>10 -> 1111 [] 3>0 -> 555 else 2222}
                 }
       else 22
      }

printnl
b := 0
fa a := 1 to 4 ->
    b := {a>b -> b+a  else b}
af
print a,b
