# simple test of swap -- should fail

var k

fa k := 1 to 2 ->
  var a, b
  a := 11
  b := 12
  print k, a, b
  swap a c
  print k, a, b

  swap a a
  print k, a, b
  swap b b
  print k, a, b
af
