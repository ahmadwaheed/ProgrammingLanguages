
var a, aone
a := 1
aone := 11
print a
if 0-1 ->
    var a, atwo
    a := 2
    atwo := 22
    print a
    if 0-1 ->
       var a, athree
       a := 3
       athree := 33
       print a
       if 0-1 ->
           var a, afour
           a := 4
           afour := 44
           print a
       fi
       print a
      print afour  # should produce error
    fi
    print a
   # print athree  # should produce error
fi
print a
# print atwo # should produce error


