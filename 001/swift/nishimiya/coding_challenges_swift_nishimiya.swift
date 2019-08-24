var original = 1
var maxNumberMultiplied = 0

while true {
    var n = original
    var numberMultipled = 0
    
    while (n > 10) {
        n = String(n).compactMap{ $0.wholeNumberValue }.reduce(1) { $0 * $1 }
        numberMultipled += 1
    }
    if numberMultipled > maxNumberMultiplied {
        maxNumberMultiplied = numberMultipled
        print(String(original)+": "+String(numberMultipled))
    }
    original += 1
}