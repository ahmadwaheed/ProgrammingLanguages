var k, n
fa k := 5 downto 1 st k != 3 -> print k af
print k

n := 4
fa k := n to n -> print 10+k  n := 6 af
fa k := n downto n -> print 20+k  n := 0-1 af

n := 10
fa k := n-4 downto n-2 -> print k af
print n
print k
fa n := 1 to 4 ->
  var kk
  print 1000+n
  fa kk := n*n downto n*2 -> print 200+kk af
  fa k := n*n downto n -> print 300+k af
  print kk, k
af
print n
print k
print 8888
fa n := 1 to 4 ->
  print 1000+n
  fa k := n*n downto n*2 -> print 200+k k := n*8 af
  n := 77
  fa k := n downto n*n -> print 300+k af
af
print n
print k
