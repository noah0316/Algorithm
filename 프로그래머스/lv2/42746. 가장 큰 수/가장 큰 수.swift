import Foundation

func solution(_ numbers:[Int]) -> String {
    let stringNumbers = numbers.map { number in
        String(number)
    }
    
    let sortedStringNumbers = stringNumbers.sorted { lhs, rhs in
        judgeMaxNumber(lhs, rhs)
    }
    
    
    if sortedStringNumbers[0] == "0" {
        return "0"
    }
    
    return sortedStringNumbers.reduce("") { $0 + $1 }
}

func judgeMaxNumber(_ lhs: String, _ rhs: String) -> Bool {
    if let prefixLhs = Int("\(lhs)\(rhs)"),
       let prefixRhs = Int("\(rhs)\(lhs)") {
        
        return prefixLhs > prefixRhs
    }
    return false
}
