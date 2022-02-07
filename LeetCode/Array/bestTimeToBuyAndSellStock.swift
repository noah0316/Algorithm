// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
/*
 Best Time to Buy and Sell Stock
 분류 : Array
 문제 설명 :
 You are given an array prices where prices[i] is the price of a given stock on the ith day.
 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

 입출력 예 1:
    prices = [7, 1, 5, 3, 6, 4], return 5
    
 입출력 예 2:
    prices = [7, 6, 4, 3, 1], return 0

 Time complexity : O(n)
 Space complexity : O(1)
*/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var minStockPrice = Int.max

        for index in prices.indices {
            let todayStockPrice = prices[index]

            if minStockPrice > todayStockPrice {
                minStockPrice = todayStockPrice
            }

            let currentProfit = todayStockPrice - minStockPrice

            if maxProfit < currentProfit {
                maxProfit = currentProfit
            }
        }

        return maxProfit
    }
}
