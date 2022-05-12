class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxValue = Int.min
        var previousLoopMaxValue = 0
        
        for index in nums.indices {
            previousLoopMaxValue = max(nums[index] + previousLoopMaxValue, nums[index])
            maxValue = max(previousLoopMaxValue, maxValue)
        }
        
        return maxValue
    }
}