/**
 不用临时变量，直接交换numbers = [a, b]中a与b的值。
 */
class Solution {
    func swapNumbers(_ numbers: [Int]) -> [Int] {
        var numbers = numbers
        numbers[0] = numbers[0] ^ numbers[1] //numbers[0] : c = a^b
        numbers[1] = numbers[0] ^ numbers[1] //numbers[1] : c ^ b = a
        numbers[0] = numbers[1] ^ numbers[0] // numbers[0] : a ^ c = b
        return numbers

    }
}
