// https://leetcode.com/problems/product-of-array-except-self/
/*
 Contains Duplicate
 분류 : Array
 문제 설명 :
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
 You must write an algorithm that runs in O(n) time and without using the division operation.

 Example 1:
    Input: nums = [1,2,3,4]
    Output: [24,12,8,6]
    
 Example 2:
    Input: nums = [-1,1,0,-3,3]
    Output: [0,0,9,0,0]

 Constraints:
    2 <= nums.length <= 105
    -30 <= nums[i] <= 30
    The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer

 Time complexity : O(n)
 Space complexity : O(n)
*/

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var output = [1]
        
        for index in 1..<nums.count {
            let appendItem = output[index - 1] * nums[index - 1]
            output.append(appendItem)
        }
        
        var accumulate = 1
        for index in stride(from: nums.count - 2, through: 0, by: -1) {
            accumulate *= nums[index + 1]
            output[index] = output[index] * accumulate
        }
        
        return output
    }
}
