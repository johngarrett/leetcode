/**

PAYPALISHIRING, 3
> length = 14

ceil(14 / 3) = 5
> 5 - 1, 4 columns of 3

middle col length: 3 - 2
> 1

3 1 3 1 3 1 2

resultant indicies:
[
    0, 4, 8, 12           // ∆ = 4
    1, 3, 5, 7, 9, 11, 13 // ∆ = 2
    2, 6, 10              // ∆ = 4
]

i: P A Y P  A L I S H I  R  I  N  G
   0 1 2 3  4 5 6 7 8 9  10 11 12 13
o: P A H N  A P L S I I  G  Y  I  R
   0 4 8 12 1 3 5 7 9 11 13 2  6  10
----

PAYPALISHIRING, 4
> length = 14

14 / 4 = 4
> 3 columns of 4

middle col length: 4 - 2:
> 2

4 1 1 4 1 1 4 1 1
resultant indicies:
[
    0, 6, 12        // ∆ = 6
    1, 5, 7, 11, 13 // ∆ = 4; 2
    2, 4, 8, 10, 14 // ∆ = 2; 4
    3, 9, 15        // ∆ = 6
]

---

ABCDEFGHIJ | 1 -> ABCDEFGHIJ -> 1 2 3 4 5 6 7 8 9 10 
ABCDEFGHIJ | 2 -> ACEGIBDFHJ -> 1 3 5 7 9 2 4 6 8 10
ABCDEFGHIJ | 3 -> AEIBDFHJCG -> 1 5 9 2 4 6 8 10 3 7 
ABCDEFGHIJ | 4 -> AGBFHCEIDJ -> 1 7 2 6 8 3 5 9 4 10

num rows = 3

1: 1 + [n + n - 2]
> 1 5 9
2: 2 + [2 * (n - 2)] + [ 2 ] + ..
> 2 4 6 8
3: 3 + [n + n - 2]
> 3 7

num rows = 4

n + n - 2 = 6
n - 2 = 2

1 7 13
2 6 8
3 5 9
4 10

no pattern... giving up
*/
fn convert(s: String, num_rows: i32) -> String {
    let full_cols = (s.chars().count() as f32 / num_rows as f32).round() - 1.0;
    let mid_cols = num_rows - 2;

    println!("full: {}, mid: {}", full_cols, mid_cols);

    return String::from("Hello World!");             
}

fn main() {
    println!(
        "{}",
        convert("PAYPALISHIRING".to_string(), 3)
    );
}
