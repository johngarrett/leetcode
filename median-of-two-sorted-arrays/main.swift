print(
    findMedianSortedArrays([1, 2], [ 3, 4])
)

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let mergedArray = (nums1 + nums2).sorted()
    let size = mergedArray.count

    switch size {
    case 0...1:
        return Double(mergedArray.first ?? 0)
    default:
        if !size.isMultiple(of: 2) {
            return Double(mergedArray[size / 2])
        } else {
            let middle = size / 2
            return Double(
                    mergedArray[middle - 1]
                    + mergedArray[size - middle]
                ) / 2.0
        }
    }
}
