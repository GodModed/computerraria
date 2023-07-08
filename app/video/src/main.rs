#![no_std]
#![no_main]

use tdriver::entry;
use tdriver::graphics;

entry!(main);

// Entry point of user code
fn main() -> ! {
    let arr: [u64; graphics::HEIGHT] = [0xF00000000000000F; graphics::HEIGHT];
    let mut screen = graphics::init();
    loop {
        graphics::write_long(&mut screen, &arr);
        graphics::update(&mut screen);
    }
}
