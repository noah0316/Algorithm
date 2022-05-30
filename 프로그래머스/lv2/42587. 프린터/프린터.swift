struct paper {
    let location: Int
    let priority: Int
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var printerQueue = [paper]()
    var count = 0
    
    for (index, priority) in priorities.enumerated() {
        printerQueue.append(paper(location: index, priority: priority))
    }
    
    while(!printerQueue.isEmpty) {
        let printCandidatePaper = printerQueue.removeFirst()
        
        for paper in printerQueue {
            if paper.priority > printCandidatePaper.priority {
                printerQueue.append(printCandidatePaper)
                break
            }
        }
        
        let isPrinted = !(printerQueue.contains { printCandidatePaper.location == $0.location })
        
        if isPrinted {
            count += 1
            if printCandidatePaper.location == location {
                return count
            }
        }
    }
    return count
}
