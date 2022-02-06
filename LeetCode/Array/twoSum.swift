// https://leetcode.com/problems/two-sum/
/*
 Two Sum
 분류 : Array
 문제 설명 :
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 You can return the answer in any order.

 입출력 예 1:
    nums = [2, 7, 11, 15], target = 9, return [0, 1]
 입출력 예 2:
    nums = [3, 2, 4], target = 6, return [1, 2]
 입출력 예 3:
    nums = [3, 3], target = 6, return [0, 1]

 Time complexity : O(n)
 Space complexity : O(n)
*/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var indexTable = [Int: Int]()
        
        for (currentIndex, currentNumber) in nums.enumerated() {
            let requiredNumber = target - currentNumber
            if let targetIndex = indexTable[requiredNumber] {
                return [currentIndex, targetIndex]
            }
            indexTable[currentNumber] = currentIndex
        }
        
        return []
    }
}
