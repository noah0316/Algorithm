/*
다리를 지나는 트럭
분류 : 스택/큐
단계 : LEVEL 2

문제 설명
트럭 여러 대가 강을 가로지르는 일차선 다리를 정해진 순으로 건너려 합니다. 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 알아내야 합니다. 다리에는 트럭이 최대 bridge_length대 올라갈 수 있으며, 다리는 weight 이하까지의 무게를 견딜 수 있습니다. 단, 다리에 완전히 오르지 않은 트럭의 무게는 무시합니다.

예를 들어, 트럭 2대가 올라갈 수 있고 무게를 10kg까지 견디는 다리가 있습니다. 무게가 [7, 4, 5, 6]kg인 트럭이 순서대로 최단 시간 안에 다리를 건너려면 다음과 같이 건너야 합니다.

경과 시간	다리를 지난 트럭	다리를 건너는 트럭	대기 트럭
0	[]	[]	[7,4,5,6]
1~2	[]	[7]	[4,5,6]
3	[7]	[4]	[5,6]
4	[7]	[4,5]	[6]
5	[7,4]	[5]	[6]
6~7	[7,4,5]	[6]	[]
8	[7,4,5,6]	[]	[]
따라서, 모든 트럭이 다리를 지나려면 최소 8초가 걸립니다.

solution 함수의 매개변수로 다리에 올라갈 수 있는 트럭 수 bridge_length, 다리가 견딜 수 있는 무게 weight, 트럭 별 무게 truck_weights가 주어집니다. 이때 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 return 하도록 solution 함수를 완성하세요.

제한 조건
bridge_length는 1 이상 10,000 이하입니다.
weight는 1 이상 10,000 이하입니다.
truck_weights의 길이는 1 이상 10,000 이하입니다.
모든 트럭의 무게는 1 이상 weight 이하입니다.
입출력 예
bridge_length	weight	truck_weights	return
2	10	[7,4,5,6]	8
100	100	[10]	101
100	100	[10,10,10,10,10,10,10,10,10,10]	110

------------------
지문에 오류가 있어 테스트케이스를 맞추는데 어려움이 있었다.
또한 처음부터 if let구문을 사용해 언래핑을 했다면 더욱 간단히 풀 수 있었을텐데, 간단하다는 핑계로 강제 언래핑을 하다보니
결국 문제를 더욱 복잡하게 만들었다. 강제 언래핑을 사용해 별도의 값이 있는지 없는지 체크하기 보다 강제 언래핑은 정말 확실한 경우에만 사용하고,
if let을 이용해 언래핑을 한다면 logic의 흐름을 더욱 간단하게 만들 수 있어 나도 이해하기 편할 것 같다.

+ 무게를 체크하는 부분에서 생각하는 관점을 약간 다르게 했다면(나감과 동시에 들어올 수 있는 조건) 더욱 빠르게 풀 수 있었을 것 같다!

문제가 됐던 부분 
if (!waitTruck.isEmpty) {
    checkWeight += waitTruck.first!
    if (checkWeight <= weight) {
        let insertItem = waitTruck.removeFirst()
        rossTruck[crossTruck.count - 1] = insertItem
        count += 1
        crossTruckCount += 1
    } else {
        while (!crossTruck.isEmpty) {
            let removedItem = crossTruck.removeFirst()
            if (removedItem != 0) {
                doneTruck.append(removedItem)
            }
            count += 1
        }
        checkWeight = 0
        crossTruckCount = 0
        if(doneTruck.count != truck_weights.count && !waitTruck.isEmpty) {
            let tempCheckWeight = checkWeight + waitTruck.first!
            if(tempCheckWeight <= weight) {
                count -= 1
            }
        }
    }
}

*/

import Foundation

func solution(_ bridge_length: Int, _ weight: Int, _ truck_weights: [Int]) -> Int {
    var waitTrucks = truck_weights
    var bridge = [Int](repeating: 0, count: bridge_length)
    var sec = 0
    var checkWeight = 0

    while bridge.isEmpty == false {
        // 1초마다 다리위의 트럭 또는 빈공간은 움직임
        checkWeight -= bridge.removeFirst()
        sec += 1

        // 다리에 빈 공간 있으면
        if bridge.count < bridge_length {
            // 다리에 진입 예정인 트럭을 포함한 무게와 다리가 견딜 수 있는 무게를 비교해서
            // 견딜 수 있으면 트럭을 진입 시킨다.
            if let truck = waitTrucks.first {
                if truck + checkWeight <= weight {
                    checkWeight += waitTrucks.removeFirst()
                    bridge.append(truck) // 트럭 진입
                } else {
                    // 견딜 수 없으면 트럭 대기하고 빈공간만 보낸다.
                    bridge.append(0)
                }
            }
        }
    }

    return sec
}
