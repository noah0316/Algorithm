## 풀이 과정

- 조합 찾기 : 옷을 종류별로 구분하여 몇 개의 조합이 가능한지 계산한다.
- 종류별로 경우의 수를 구해야할 때는 해시를 사용하는게 쉽다.
- 예외처리를 해줘야하는 것은 아무것도 입지 않는 경우가 생긴다. 해당 케이스를 빼줘야한다.
- ex) 옷의 종류와 헤드기어와 아이웨어가 있는데 헤드기어도 안쓰고, 아이웨어도 안쓴 경우

## 알게된 것

- 옷을 종류별로 구분하는 과정까지는 쉽게할 수 있었지만,
- 하나의 종류의 옷을 입지 않을 수도 있다는 케이스를 떠올리고, 모든 종류의 옷을 안입는 경우를 제외하는 방법을 떠올리는데 시간이 오래걸렸다.

## 인상깊었던 풀이

```swift
        let types = clothes.compactMap { $0.last }
        let typeSet = Set(types)
        let categories = Array(typeSet)

        let counts = categories.map { category in
            clothes.filter { $0.last == category}.count + 1
        }

        return counts.reduce(1, { $0 * $1 }) - 1
```
