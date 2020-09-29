print(
    findMedianSortedArrays([1, 2], [ 3, 4])
)

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let mergedArray = (nums1 + nums2).sorted()
    let size = mergedArray.count

    if size == 0 {
        return 0
    } else if size == 1 {
        return Double(mergedArray[0])
    } else if !size.isMultiple(of: 2) {
        return Double(mergedArray[mergedArray.count / 2])
    } else {
        let middle = mergedArray.count / 2
        let lower = mergedArray[middle - 1]
        let upper = mergedArray[mergedArray.count - middle]
        print(lower)
        print(upper)
        return Double(lower + upper) / 2.0
    }
}
