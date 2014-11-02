#include <ruby.h>
#include <rusty.h>

// Ruby types

VALUE rb_mRusty;
VALUE rb_cPoint;

// Rusty.make_point

static VALUE create_point(int x, int y) {
    Point point = make_point(x, y);

    return Data_Wrap_Struct(rb_cPoint, NULL, NULL, point);
}

// Rusty.get_distance

static VALUE get_distance_between_points(Point x, Point y) {
    double distance = get_distance(x, y);

    return distance;
}


// https://github.com/ruby/ruby/blob/19121b47392732c5083e36478a24d7883efab299/README.EXT#L682

void Init_rusty(void) {
    rb_mRusty = rb_define_module("Rusty");
    rb_cPoint = rb_define_class_under(rb_mRusty, "Point", rb_cObject);

    rb_define_singleton_method(rb_mRusty, "make_point", create_point, 2);
    rb_define_singleton_method(rb_mRusty, "get_distance", get_distance_between_points, 2);

}
