import Foundation
func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    var indicies = [Int]()
    for array in permutations(xs: words) {
        indicies.append(contentsOf: s.indicies(of: array.joined()))
    }
    // calculate permutations
        //print(s.indicies(of: word))

    return Array(Set(indicies))
}

extension String {
    func indicies(of substring: String) -> [Int] {
        var indicies = [Int]()
        var searchDelegate = self 
        while let range = searchDelegate.range(of: substring) {
            print(range.lowerBound.utf16Offset(in: searchDelegate))
            indicies.append(range.lowerBound.utf16Offset(in: searchDelegate))
            print(searchDelegate)
            searchDelegate = String(searchDelegate[range.upperBound...])
            print(searchDelegate)
        }

        return indicies 
    }
}
extension Array {
    func decompose() -> (Iterator.Element, [Iterator.Element])? {
        guard let x = first else { return nil }
        return (x, Array(self[1..<count]))
    }
}

func between<T>(x: T, _ ys: [T]) -> [[T]] {
    guard let (head, tail) = ys.decompose() else { return [[x]] }
    return [[x] + ys] + between(x: x, tail).map { [head] + $0 }
}

func permutations<T>(xs: [T]) -> [[T]] {
    guard let (head, tail) = xs.decompose() else { return [[]] }
    return permutations(xs: tail).flatMap { between(x: head, $0) }
}

print(findSubstring("foobarfoobar", ["foo","bar"]))
