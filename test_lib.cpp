#include <boost/python.hpp>
#include <boost/python/numpy.hpp>
#include "test_class.h"

namespace p = boost::python;
namespace np = boost::python::numpy;

BOOST_PYTHON_MODULE(test_lib)
{
    Py_Initialize();
    np::initialize();
    p::class_<TestClass>("TestClass")
        .def("set_value_a", &TestClass::set_value_a)
        .def("set_value_b", &TestClass::set_value_b)
        .def("get_value_a", &TestClass::get_value_a)
        .def("get_value_b", &TestClass::get_value_b)
        .def("get_sum", &TestClass::get_sum)
        .def("get_the_int", &TestClass::get_the_int)
        .def("set_the_int", &TestClass::set_the_int)
        .def("get_ndarray", &TestClass::get_ndarray)
        .def("modify_ndarray", &TestClass::modify_ndarray)
        .def("print_hello", &TestClass::print_hello)
        .def("pass_a_class", &TestClass::pass_a_class);

}
