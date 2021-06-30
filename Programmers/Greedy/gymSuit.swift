import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var varReserve = reserve
    var varLost = lost
    var possible: Set<Int> = []
    var result = n - lost.count
    
    // get duplicate item using intersection
    var duplicate_item = Array(Set(lost).intersection(Set(reserve)))
    
    for i in duplicate_item {
        varLost.remove(at: varLost.firstIndex(of: i)!)
        varReserve.remove(at: varReserve.firstIndex(of: i)!)
        possible.insert(i)
    }
    
    for i in varLost {
        for j in varReserve {
            if((j + 1) == i || (j - 1) == i) {
                possible.insert(i)
                varReserve.remove(at: varReserve.firstIndex(of: j)!)
            }
        }
    }
    
    result += possible.count
    return result
}
