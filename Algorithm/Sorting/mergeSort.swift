/*
Merge Sort 
시간 복잡도 : O(n log n)
공간 복잡도 : O(n)

Merge Sort 정리 : https://noah0316.github.io/Algorithms/2021-07-16-merge-sort(%ED%95%A9%EB%B3%91%EC%A0%95%EB%A0%AC)/
*/

import Foundation

func mergeSort(_ array: [Int]) -> [Int] {
	guard array.count > 1 else { return array }

	let middleIndex = array.count / 2
	let left = mergeSort(Array(array[0 ..< middleIndex]))
	let right = mergeSort(Array(array[middleIndex ..< array.count]))

	return merge(leftPile: left, rightPile: right)

}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
	var leftIndex = 0
	var rightIndex = 0
	var orderedPile = [Int]()

	while leftIndex < leftPile.count && rightIndex < rightPile.count {
		if leftPile[leftIndex] < rightPile[rightIndex] {
			orderedPile.append(leftPile[leftIndex])
			leftIndex += 1
		} else if leftPile[leftIndex] > rightPile[rightIndex] {
			orderedPile.append(rightPile[rightIndex])
			rightIndex += 1
		} else {
			orderedPile.append(leftPile[leftIndex])
			leftIndex += 1
			orderedPile.append(rightPile[rightIndex])
			rightIndex += 1
		}
	}

	while leftIndex < leftPile.count {
		orderedPile.append(leftPile[leftIndex])
		leftIndex += 1
	}

	while rightIndex < rightPile.count {
		orderedPile.append(rightPile[rightIndex])
		rightIndex += 1
	}

	return orderedPile
}

let orderedArray = mergeSort([20, 18, 13, 12, 10, 14])
