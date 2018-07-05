# Fibonacci

var k, g, h
g := 1
h := 1
fa k := 1 to 20 ->
    var newg
    print h
    newg := h
    h := g+h
    g := newg
af
