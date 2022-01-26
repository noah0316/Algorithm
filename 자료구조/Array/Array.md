# Array

배열은 메모리 영역에 연속되어있는 **데이터 구조**로 논리적인 순서와 물리적인 순서가 같다는 특징을 가지고 있습니다.

배열은 특정 요소의 조회가 아주 빠르다는 특징을 가지고 있습니다.

특정 요소를 조회할 때 순회(traversing)하는 것이 아니라,

특정한 메모리 주소 값에 바로 접근하는 것을 random access라고 합니다.

배열의 특징중 하나인 논리적인 순서(index)와 물리적인 순서(메모리 주소)가 같다는 특징을 이용해

index를 사용하여 특정 요소를 조회하면(random access) 조회의 시간복잡도가 O(1)이기 때문에
조회가 아주 빠르다는 특징을 가지고 있습니다.

추가 및 삭제는 개념적인 배열이라면 중간에 추가할 때 맨 뒤에 공간을 더 만들고 하나씩 밀어야합니다.

삭제도 마찬가지로 중간에 있는 요소 하나를 삭제한다면 중간에 빠진 게 없도록 다시 밀어줘야 합니다.

따라서 배열은 중간에 값을 생략하거나 건너뛰는 경우는 없습니다.

즉 배열은 조회는 빠르지만, 추가 및 삭제는 느리다는 특징을 가지고 있음을 위에서 살펴본 내용을 통해 알 수 있습니다.

Swift의 배열이 가지는 특징은 다음과 같습니다.

- 배열에 저장할 요소의 타입에는 제약이 없지만, 하나의 배열에 저장하는 아아템 타입은 모두 같아야 함
- 선언 시 배열에 저장할 요소의 타입을 명확히 정의해야 함
- 배열의 크기는 동적으로 확장할 수 있음

Swift에서는 배열을 정적(Static)인 방식과 동적(Dynamic)인 방식으로 배열을 선언 및 초기화할 수 있습니다.

정적인 방식

```swift
let cities = ["Seoul", "New York", "LA", "Santiago"]
```

`cities` 배열은 타입 추론에 의해 String 요소를 가지는 배열 객체가 됩니다.

동적인 방식

```swift
var cities = [String]()
```

배열을 사용할 때 주의해야 할 점은 배열의 범위를 벗어난 영역에 접근하는 경우를 주의해야 합니다.

만약 배열의 범위를 벗어난 영역에 접근할 경우 다음과 같은 에러를 마주하게 됩니다.

**`Fatal error: Index out of range`**

말 그대로 치명적인 에러인데요, 만약 App에서 이러한 에러가 발생하게 되면 그 즉시 앱이 강제종료(크래시)되는 상황이 발생하게 됩니다.

이와 같은 에러를 마주하지 않게 하기 위해서는 index가 Array의 유효한 bound안에 있는지 확인하는 습관을 지녀야 할 것 같습니다.

Swift에서는 다음과 같은 extension을 통해 bound를 check하고 안전하게 배열을 사용할 수 있는데요,

Swift 언어의 안전성의 기본 바탕이 되는 Optional을 이용해 다음과 같은 extension을 구성할 수 있습니다.

```swift
extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
```

### 참고

---

- [안전하게 배열 조회하기- 민소네님](http://minsone.github.io/programming/check-index-of-array-in-swift)

- [꼼꼼한 재은씨의 Swift 문법편](http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791186710234)

- [Swift Array 공식문서](https://developer.apple.com/documentation/swift/array)
