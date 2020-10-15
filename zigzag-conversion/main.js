/**
 *  * @param {string} s
 *   * @param {number} numRows
 *    * @return {string}
 *     */
var convert = function(s, numRows) {
    let con_row_length = Math.floor(numRows / 2)

    i = 0
    var structure = new Array()

    var its = 0;
    while(i < s.length) {
        if (its % 2 == 0) {
            structure[i] = numRows
            i += numRows
        } else {
            con = 0
            while(con < con_row_length) {
                structure[i] = 1
                con++
                i++
            }
        }
    }

    console.log(structure)

    var cols = 0
    while(i > 0) {
        i -= numRows
        cols++
        if (i > 0) {
            i -= con_row_length
            cols++
        }
    }

    let area = new Array(cols)
    var col = 0
    var row = 0
    var start = 0
    var onRow = true
    while(col < cols) {
        if (onRow) {
            area[col] = s.substring(start, start + numRows)
            start = start + numRows
            col++
            onRow = false
        } else {
            con = 0
            while(con < con_row_length) {
                area[col] = s.charAt(start)
                start++ 
                col++
                con++
            }
            onRow = true
        }
    }

    console.log(area)


    console.log(cols)
    console.log(con_row_length)
    console.log(s.substring(0, numRows))
    return "hello world"
}


console.log(convert("PAYPALISHIRING", 3))
console.log(convert("PAYPALISHIRING", 4))
console.log(convert("A", 1))
