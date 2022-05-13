import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var clothesTable = [String: Int]()

    // 옷을 종류별로 구분
    for clothe in clothes {
        if clothesTable[clothe[1]] == nil {
            clothesTable[clothe[1]] = 1
            continue
        }
        if var updateValue = clothesTable[clothe[1]] {
            updateValue += 1
            clothesTable.updateValue(updateValue, forKey: clothe[1])
        }
    }

    var result = 1
    // 입지않는 경우의 수를 추가해서 모든 조합을 계산
    clothesTable.values.forEach { result *= $0 + 1 }
    // 아무종류의 옷도 입지 않는 경우의 수 제거
    return result - 1
}
