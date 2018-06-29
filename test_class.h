#include <boost/python.hpp>
#include <boost/python/numpy.hpp>

namespace p = boost::python;
namespace np = boost::python::numpy;

class TestClass
{
    public:

        TestClass();

        void set_value_a(float value_a);
        void set_value_b(float value_b);
        float get_value_a();
        float get_value_b();
        float get_sum();
        
        void set_the_int(int value);
        int get_the_int();

        np::ndarray get_ndarray(int n, int m);
        np::ndarray modify_ndarray(np::ndarray in_array);

        void print_hello();
        void pass_a_class(TestClass &test_class);


    protected:

        float value_a_ = 0.0;
        float value_b_ = 0.0;
        int the_int_ = 0;

};
