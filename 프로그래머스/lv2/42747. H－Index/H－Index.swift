import Foundation

func solution(_ citations:[Int]) -> Int {
    let sortedCitation = citations.sorted(by: >)
    
    for index in citations.indices {
        if sortedCitation[index] <= index  {
            return index
        }
    }
    
    return sortedCitation.count
}