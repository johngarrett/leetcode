
func slope(from start: (x: Double, y: Double), to end: (x: Double, y: Double)) -> Double {
    let numerator = (end.y - start.y)
    let divisor = (end.x - start.x)

    switch (numerator, divisor) {
    case (_, 0):
        return 0
    default: return numerator / divisor
    }
}

func yIntercept(of point: (x: Double, y: Double), with slope: Double) -> Double {
    //y - mx = b
    let lhs = point.y
    let rhs =  slope * point.x

    switch (lhs, rhs) {
    case (_, 0),
        (0, 0),
        (0, _):
        return 0
    case let v where v.1.isNaN:
        return 0
    default: return lhs - rhs
    
    }
}

func maxPoints(_ points: [[Int]]) -> Int {
    if points.count == 1 {
        return 1
    }
    var maxPoints = 1
    let sorted = points.sorted(by: { $0[0] < $1[0]})
    let points = sorted.map { [Double($0[0]), Double($0[1])] }
    for (i, start) in points.enumerated() {
        print(start)
        for end in points[i...] {
        print(end)
            let s = slope(
                from: (x: start[0], y: start[1]), 
                to: (x: end[0], y: end[1])
            )

            print("slope: \(s)")
            let yInt = yIntercept(of: (x: start[0], y: start[1]), with: s)
            maxPoints = max (
                points.filter {
                    print(s * $0[0] + yInt)
                    print($0[1])
                    return $0[1] == s * $0[0] + yInt // where y = mx + b
                }.count,
                maxPoints
            )

            let verticals = points.filter {
                $0[0] == start[0]
            }
            let horizontals = points.filter {
                $0[1] == start[1]
            }

            maxPoints = max(
                verticals.count,
                maxPoints
            )

            maxPoints = max(
                horizontals.count,
                maxPoints
            )
        }
    }
    return maxPoints
}

[
    [[0,0],[0,1]]
].forEach {
    print(maxPoints($0))
}
