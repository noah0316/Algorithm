## 풀이 과정

numbers배열에 들어있는 0 또는 양의 정수를 `map`을 이용해 문자열로 변환한 후에,

`judgeMaxNumber(_:_:)` 를 이용해 두 수를 Int형으로 나열 했을 때 더 큰 값이 왼쪽에 오도록 numbers 배열을 정렬하였다.

만약 numbers 배열이 다음과 같이 [0, 0, 0, 0] 0으로만 이루어져있다면 문자열로 변환해 나열했을 때

“0000”이 될 것이기 때문에 첫글자가 0이라면 문자열 “0”을 반환하도록 구현하였다.

마지막으로 reduce operator를 이용해 정렬된 문자열로 이루어진 배열의 element를 합해 하나의 문자열을 만들어 반환하였다.

## 알게된 것

- numbers에 0이 여러개 들어있는 케이스를 떠올리지 못해 테스트케이스 하나를 통과하지 못해 시간을 많이 끌었다.
- 사실 문제에 처음부터 해당 케이스에 대한 답이 있었다.

> “0 또는 양의 정수가 주어졌을 때”

라는 말의 의미는 입력값으로 0 또는 양의 정수가 들어온다는 것은 0으로만 이루어진 배열이 들어올 수 있다는 것을 쉽게 떠올리지 못했다. 주어진 문제를 꼼꼼히 읽어보는 습관을 기르자

## 인상깊었던 풀이

```swift
func solution(_ numbers: [Int]) -> String {
    let sortedNumbers = numbers.sorted {
        Int("\($0)\($1)")! > Int("\($1)\($0)")!
    }

    let answer = sortedNumbers.map { String($0) }.reduce("") { $0 + $1 }
    return sortedNumbers.first == 0 ? "0" : answer
}
```
