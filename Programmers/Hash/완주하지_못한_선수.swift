// https://programmers.co.kr/learn/courses/30/lessons/42576
/*
 완주하지 못한 선수
 분류 : 해시
 단계 : LEVEL 1
 문제 설명
 수많은 마라톤 선수들이 마라톤에 참여하였습니다.
 단 한 명의 선수를 제외하고는 모든 선수가 마라톤을 완주하였습니다.
 마라톤에 참여한 선수들의 이름이 담긴 배열 participant와 완주한 선수들의 이름이 담긴 배열 completion이 주어질 때,
 완주하지 못한 선수의 이름을 return 하도록 solution 함수를 작성해주세요.

 제한사항
 마라톤 경기에 참여한 선수의 수는 1명 이상 100,000명 이하입니다.
 completion의 길이는 participant의 길이보다 1 작습니다.
 참가자의 이름은 1개 이상 20개 이하의 알파벳 소문자로 이루어져 있습니다.
 참가자 중에는 동명이인이 있을 수 있습니다.

 입출력 예
 participant                               completion                        return
 [leo, kiki, eden]                           [eden, kiki]                    leo
 [marina, josipa, nikola, vinko, filipa]  [josipa, filipa, marina, nikola]   vinko
 [mislav, stanko, mislav, ana]               [stanko, ana, mislav]           mislav

 입출력 예 설명
 예제 #1
 leo는 참여자 명단에는 있지만, 완주자 명단에는 없기 때문에 완주하지 못했습니다.
 예제 #2
 vinko는 참여자 명단에는 있지만, 완주자 명단에는 없기 때문에 완주하지 못했습니다.
 예제 #3
 mislav는 참여자 명단에는 두 명이 있지만, 완주자 명단에는 한 명밖에 없기 때문에 한명은 완주하지 못했습니다.
 */
 
import Foundation

func solution(_ participant: [String], _ completion: [String]) -> String {
    var answer = ""
    var wholeDict = initWholeDict(participant, completion)
    wholeDict = addParticipantValue(wholeDict, participant)
    wholeDict = addCompletionValue(wholeDict, completion)
    
    for (key, value) in wholeDict {
        let isOdd: Bool
        isOdd = value % 2 != 0 ? true : false
        
        if isOdd {
            answer = key
        }
    }
    
    return answer
}

func initWholeDict(_ participant: [String], _ completion: [String]) -> [String: Int] {
    var wholeDict = [String: Int]()
    
    for element in participant {
        wholeDict[element] = 0
    }
    
    for element in completion {
        wholeDict[element] = 0
    }
    
    return wholeDict
}

func addParticipantValue(_ wholeDict: [String: Int], _ participant: [String]) -> [String: Int] {
    var wholeDict = wholeDict
    
    for element in participant {
        let updateValue = wholeDict[element]! + 1
        wholeDict.updateValue(updateValue, forKey: element)
    }
    
    return wholeDict
}


func addCompletionValue(_ wholeDict: [String: Int], _ completion: [String]) -> [String: Int] {
    var wholeDict = wholeDict
    
    for element in completion {
        let updateValue = wholeDict[element]! + 1
        wholeDict.updateValue(updateValue, forKey: element)
    }

    return wholeDict
}
