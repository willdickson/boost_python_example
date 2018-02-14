#include "test_class.h"
#include <iostream>


TestClass::TestClass()
{}

void TestClass::set_value_a(float value_a)
{
    value_a_ = value_a;
}

void TestClass::set_value_b(float value_b)
{
    value_b_ = value_b;
}

float TestClass::get_value_a()
{
    return value_a_;
}

float TestClass::get_value_b()
{
    return value_b_;
}

float TestClass::get_sum()
{
    return value_a_ + value_b_;
}

void TestClass::set_the_int(int value)
{
    the_int_ = value;
}

int TestClass::get_the_int()
{
    return the_int_;
}

np::ndarray TestClass::get_ndarray(int n, int m)
{ 
    // Create an ndarray 
    p::tuple shape = p::make_tuple(n,m);
    np::dtype dtype = np::dtype::get_builtin<float>(); 
    np::ndarray array = np::zeros(shape,dtype);
    for (int i=0; i<array.shape(0); i++)
    {
        for (int j=0; j<array.shape(1); j++)
        {
            array[i][j] = array[i][i] + float(i) + float(j);

        }
    }
    return array;
}

np::ndarray TestClass::modify_ndarray(np::ndarray in_array)
{
    // Note: array is passed by reference so original object is modified.

    for (int i=0; i<in_array.shape(0); i++)
    {
        for (int j=0; j<in_array.shape(1); j++)
        {
            in_array[i][j] = in_array[i][i] + float(i) + in_array.shape(0)*float(j);

        }
    }

    // To get value as a float
    //float value = p::extract<float>(in_array[0][0]);

    return in_array;
}
