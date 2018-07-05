# simple test of swap

var k,
    b

b := 999

fa k := 1 to 2 ->
  var a
  a := 11
  print k, a, b
  swap a b
  print k, a, b

  swap a a
  print k, a, b
  swap b b
  print k, a, b
af
