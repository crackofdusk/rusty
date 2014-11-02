// Example code from this blog post about calling Rust from Ruby:
// http://blog.skylight.io/bending-the-curve-writing-safe-fast-native-gems-with-rust/

use std::num::pow;

pub struct Point { x: int, y: int }

struct Line { p1: Point, p2: Point }

impl Line {
  pub fn length(&self) -> f64 {
    let xdiff = self.p1.x - self.p2.x;
    let ydiff = self.p1.y - self.p2.y;
    ((pow(xdiff, 2) + pow(ydiff, 2)) as f64).sqrt()
  }
}

impl Drop for Point {
    fn drop(&mut self) {
        println!("Rust: dropping {}", self);
    }
}

#[no_mangle]
pub extern "C" fn make_point(x: int, y: int) -> Box<Point> {
    box Point { x: x, y: y }
}

#[no_mangle]
pub extern "C" fn get_distance(p1: &Point, p2: &Point) -> f64 {
    Line { p1: *p1, p2: *p2 }.length()
}
