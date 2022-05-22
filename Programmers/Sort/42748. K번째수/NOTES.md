## 풀이 과정

[i, j, k]를 원소로 가진 2차원 배열 commands를 순회하며,

주어진 배열 array를 range연산자를 이용해 ArraySlice 인스턴스를 만든후에 이를 정렬한다.

정렬된 Array의 k번째 element를 함수의 반환 값이 될 배열에 append하였다.

## 알게된 것

- map 연산자를 이용해 코드의 길이를 줄이거나, 간결하게 만들 때는 가독성을 해치지 않도록 유의해야 할 것 같다.

## 인상깊었던 풀이

```swift
func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map({(key) in
        return array[(key[0]-1)...(key[1]-1)].sorted()[key[2]-1]
    })
}

/*
가독성 개선
*/

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map { command in
        let i = command[0] - 1
        let j = command[1] - 1
        let k = command[2] - 1
        return array[i...j].sorted()[k]
    }
}
```
