# test order of variable reference report
var a, i, k
i := 25
if i < 20 ->
  # no vars here
  if i < 10 ->
    if i < 0 ->
      var i
      i := 888
      print i
    fi
  fi
else ->
  var i
  print i
  if i < 0 ->
    var i
    i := 999
    print i
  fi
  print i
fi
