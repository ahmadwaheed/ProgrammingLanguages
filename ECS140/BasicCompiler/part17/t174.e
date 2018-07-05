var x, y, max, min
x := 98
y := 97
max := {x>y -> x else y}
min := {x<y -> x else y}
print x, y, max, min

x := 0-11
y := 0-3
max := {x>y -> x else y}
min := {x<y -> x else y}
print x, y, max, min

x := 34
y := x
max := {x>y -> x else y}
min := {x<y -> x else y}
print x, y, max, min

print x<y, x=y, x>y
print {x<y -> x else 3*{x>30->5 else 0}}
print {x<y -> x else 3*{x<30->5 else 0}}
print {x<y -> x else 3*{x<30->5 else 200}}
print {x<y -> x else 3*{x=y+{x>30->5 else 0}->77 else 888}}
print {x<y -> x else 3*{x=y+{x>30->5 else 0}-{y>30->5 else 0}->77 else 888}}
print {x<y -> x else 3*{x=y+{x>30->0 else 5}-{y>30->0 else 5}->77 else 888}}
print {x<y -> x else 3*{x=y+{x>30->5 else 0}+{y>30->5 else 0}->77 else 888}}
print {x=y -> x else 3*{x=y+{x>30->5 else 0}+{y>30->5 else 0}->77 else 888}}
print {x<y -> x else 3*{x=y+{x>30->0-1 else 0}+{y>30->0 else 5}->77 else 888}}
print {x<y -> x else 3*{x=y+{x>30->0-1 else 0}+{y>30->0 else 5}->77
                                   else {x=y->9 else 44}}}
