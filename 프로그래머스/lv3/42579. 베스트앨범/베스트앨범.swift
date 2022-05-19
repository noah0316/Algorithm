import Foundation

struct PlayItem {
    let index: Int
    let playTimes: Int
}

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var bestAlbum = [Int]()
    var genrePlayTable =  [String: [PlayItem]]()
    
    for (index, genre) in genres.enumerated() {
        let playItem = PlayItem(index: index, playTimes: plays[index])
        if genrePlayTable[genre] == nil {
            genrePlayTable[genre] = [playItem]
            continue
        }
        
        if let previousGenrePlayTableRow = genrePlayTable[genre] {
            let currentGenrePlayTableRow = previousGenrePlayTableRow + [playItem]
            genrePlayTable.updateValue(currentGenrePlayTableRow, forKey: genre)
        }
    }
    
    let genres = Array(Set(genres))
    
    // 장르내 재생시간이 많은 순서대로 정렬
    for genre in genres {
        let sortedPlayItems = genrePlayTable[genre]?.sorted(by: { lhs, rhs in
            lhs.playTimes > rhs.playTimes
        })
        if let sortedPlayItems = sortedPlayItems {
            genrePlayTable.updateValue(sortedPlayItems, forKey: genre)
        }
    }
    
    // 장르별 재생시간이 많은 순서대로 Dictionary 정렬
    let sortedGenrePlayTable = genrePlayTable.sorted { lhs, rhs in
        lhs.value.reduce(0) { $0 + $1.playTimes } > rhs.value.reduce(0) { $0 + $1.playTimes }
    }
    
    // 장르 별로 가장 많이 재생된 노래를 두개씩 bestAlbum에 수록
    // 장르 내 노래가 한곡이라면 하나의 곡만 수록
    for genrePlayTableRow in sortedGenrePlayTable {
        if genrePlayTableRow.value.count == 1 {
            let bestSong = genrePlayTableRow.value[0]
            bestAlbum.append(bestSong.index)
            continue
        }
        
        let bestSongs = genrePlayTableRow.value.prefix(2)
        for bestSong in bestSongs {
            bestAlbum.append(bestSong.index)
        }
    }
    
    return bestAlbum
}
