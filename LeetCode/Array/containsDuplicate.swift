// https://leetcode.com/problems/contains-duplicate/
/*
 Contains Duplicate
 분류 : Array
 문제 설명 :
 Given an integer array nums, return true if any value appears at least twice in the array,
 and return false if every element is distinct.

 Example 1:
    Input: nums = [1, 2, 3, 1]
    Output: true
    
 Example 2:
    Input: nums = [1,2,3,4]
    Output: false

 Example 3:
    Input: nums = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
    Output: true

 Time complexity : O(n)
 Space complexity : O(n)
*/

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var numberSet = Set<Int>()
        
        for num in nums {
            if numberSet.contains(num) {
                return true
            } else {
                numberSet.insert(num)
            }
        }
        
        return false
    }
}
