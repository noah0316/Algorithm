/*
플로이드 워셜 알고리즘 
시간 복잡도 : O(n^3)
공간 복잡도 : O(n^2)

다익스트라와 달리 모든 지점에서 다른 모든 지점까지의 최단 경로를 모두 구할 수 있다.
해당 노드를 거쳐 가는 경로를 확인하며, 최단 거리 테이블을 갱신하는 방식으로 동작한다.
하지만 시간 복잡도가 n의 3승이나 되어 그래프의 edge가 500이상을 넘어가면 다른 알고리즘을 고려해봐야할 것 같다.

구현이 쉽다는 장점이 있어 모든 경로를 찾아야 하는 경우 n의 수가 작다면 상황에 맞게 사용해야겠다.
*/

import Foundation

// 노드 갯수
let n = 4
// Int.max로 Infinite을 표현할 경우 오버플로우 발생
let INF = 999
var graph = Array(repeating: Array(repeating: INF, count: n + 1), count: n + 1)
let allConnections = [[1, 2, 4], [1, 4, 6], [2, 1, 3], [2, 3, 7], [3, 1, 5], [3, 4, 4], [4, 3, 2]]

func setConnection() {
	// 자기 자신에서 자기 자신으로 가는 비용 0으로 초기화
	for a in 1 ... n {
		for b in 1 ... n {
			if a == b {
				graph[a][b] = 0
			}
		}
	}
	for connection in allConnections {
		graph[connection[0]][connection[1]] = connection[2]
	}
}

func floyd() {
	for intermediateIdx in 1 ... n {
		for fromIdx in 1 ... n {
			for toIdx in 1 ... n {
				graph[fromIdx][toIdx] = min(graph[fromIdx][toIdx], graph[fromIdx][intermediateIdx] + graph[intermediateIdx][toIdx])
			}
		}
	}
}

setConnection()
floyd()
