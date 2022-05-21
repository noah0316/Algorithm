import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var answer = [Int]()
    
    for command in commands {
        let i = command[0] - 1
        let j = command[1] - 1
        let k = command[2] - 1
        
        let kthNumber = getKthNumber(array[i...j], k)
        answer.append(kthNumber)
    }
    return answer
}

func getKthNumber(_ subArray: ArraySlice<Int>, _ k: Int) -> Int {
    let sortedSubArray = subArray.sorted()
    return sortedSubArray[k]
}