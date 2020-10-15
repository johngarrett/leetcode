fn main() {
    let x = 123;
    let y = reverse(x);
    println!("{}", y);
}



pub fn reverse(x: i32) -> i32 {
    let mut result = String::from("");

    let pos = x > 0;
    let start_index = if pos { 0 } else { 1 };

    for c in x.to_string()[start_index..].chars().rev() {
        result.push(c);
    }

    match result.parse::<i32>() {
        Ok(v) => if pos { v } else { -v },
        Err(_) => 0,
    }
}

