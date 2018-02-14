from __future__ import print_function
import test_lib
import numpy

x = test_lib.TestClass()

a = numpy.ones((4,4))
print(a)

b = x.modify_ndarray(a)
print(b)
