def longestCommonPrefix(strs) -> str:
    if len(strs) == 0:
        return ''
    base = min(strs, key=len)

    filtered = list(filter(lambda s: s[:len(base)] == base, strs))
    while len(filtered) != len(strs):
        base = base[:-1]
        filtered = list(filter(lambda s: s[:len(base)] == base, strs))

    return base

print(longestCommonPrefix(["flower", "flow", "flight"]))
print(longestCommonPrefix(["dog", "racecar", "car"]))
print(longestCommonPrefix([]))
