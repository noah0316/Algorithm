## 풀이 과정

- 곡을 장르에 따라 분류하기 위해 key-value 테이블을 만들어 해당 곡의 인덱스와 재생수를 테이블의 value에 구조체 형태로 넣어주었다.
- 테이블 내에서 장르별로 곡들을 재생시간이 많은 순서대로 정렬해주었다.
- 장르별로 재생수를 합산해 많이 재생한 순대로 장르를 정렬 한 후에 테이블을 순회하며 2개의 곡씩 베스트 앨범에 넣어주었다.
  > 만약 장르 내 곡이 한 곡이라면 한 곡만 넣을 수 있도록 처리해주었다.
  > 테이블을 생성할 때 index 순으로 순회하여 장르 내에서 재생 횟수가 같은 노래 중에서는 index가 낮은 노래를 먼저 앨범에 들어갈 수 있도록 처리해주었다.

## 알게된 것

- 연관있는 데이터를 구조체로 묶어 생각해보니 문제를 좀 더 간단하게 풀이할 수 있었다.
- index와 value를 같이 사용하고 싶어 `enumerated()`를 활용했는데 유용하게 사용했다.

## 인상깊었던 풀이

```swift
import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var playList = [String:(play: Int, music: [Int:Int])]()
    var answer = [Int]()

    for (index, value) in genres.enumerated() {
        if let genre = playList[value]?.play {
            playList[value]?.play = genre + plays[index]
            playList[value]?.music[index] = plays[index]
        } else {
            playList[value] = (play: plays[index], music: [index:plays[index]])
        }
    }

    let rank = playList.sorted(by: { $0.value.play > $1.value.play })

    rank.forEach { song in
        let songRank = song.value.music.sorted { $0.value > $01.value }

        let max = songRank.count > 1 ? 2 : 1
        for i in 0..<max {
            answer.append(songRank[i].key)
        }
    }

    return answer
}
```
