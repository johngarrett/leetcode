fn main() {
    println!("Hello World");
    let x = 352;
    let y = reverse(x);
    println!("{}", y);
}

pub fn reverse(x: i32) -> i32 {
    let mut result = String::from("");

    let first = x.to_string().chars().nth(0).unwrap();

    let mut postive = true;
    if first == '-' {
        let positive = false;
    }

    for c in x.to_string().chars().rev() {
        result.push(c);
    }

    result.parse().unwrap()
}
