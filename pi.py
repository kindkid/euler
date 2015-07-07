# Happy 3.14!
#
# http://www.cs.ox.ac.uk/jeremy.gibbons/publications/spigot.pdf

import sys
import time

def piG3():
  q, r, t, i = 1, 180, 60, 2
  while True:
    u, y = 3*(3*i+1)*(3*i+2), (q*(27*i-12)+5*r)//(5*t)
    yield y
    q, r, t, i = 10*q*i*(2*i-1), 10*u*(q*(5*i-2)+r-y*t), t*u, i+1

slowdown, i, digits = True, 1, piG3()
while True:
  sys.stdout.write(str(digits.next()))
  if i == 0: sys.stdout.flush()
  if slowdown and i > 0:
    sys.stdout.flush()
    time.sleep(0.5)
  else:
    slowdown = False
  i = (i+1) % 10
