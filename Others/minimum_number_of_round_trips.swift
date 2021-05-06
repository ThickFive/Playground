/*	FILEPATH = "./Others/minimum_number_of_round_trips.swift"
 *  Minimum Number Of Round Trips
    问题: 两个单独的房间里分别有 n 个开关和 n 盏灯, 至少需要往返多少次才能确定开关与灯的对应顺序
    分析: 总状态数有 S(n) = n! 种, 假设一次打开 k 盏灯, 那么往返一次后剩下的状态数为 S(k) * S(n - k) = k! * (n - k)!
    根据斯特林公式 n! ~= (2πn)^1/2 * (n/e)^n, 舍去低阶项之后 log(n!) ~= nlog(n)
    log(S(k) * S(n - k))
    = log(k!) + log((n-k)!)
    ~= klog(k) + (n-k)log(n-k)
    设 g(x) = xlogx, f(x) = g(x) + g(n - x)
    f'(x) = g'(x) + g'(n-x)
    = logx + 1 - (log(n-x) + 1)
    = logx - log(n - x)
    当 x < n / 2 时, f'(x) < 0
    当 x = n / 2 时, f'(x) = 0
    当 x > n / 2 时, f'(x) > 0
    也就是 f(x) 在 x = n / 2 时有极小值, 那么一次打开一半的灯可以获得最多的信息, 往返次数的下限为
    log(n!) / (log(n!) - (2 * log((n/2)!))
    ~= nlogn / (nlogn - 2 * n/2 * log(n/2))
    = nlogn / (nlogn - n * (logn - log2))
    = nlogn / (nlog2)
    = logn / log2
    = log(2, n)
    结论: 最小往返次数为 log(2, n)
    注: k! * (n-k)! 最小值的严格证明, 首先假设 k <= m,  其中 m = n / 2
    k! * (n-k)!
    = (1 * ... * k) * (1 * .. * n-k)
    = (1 * ... * k * ... * m) / (k+1 * ... * m) * (1 * ... * k * ... * m) * (m+1 * ... * n-k)
    = (1 * ... * m) ^ 2 * (m+1 * ... * n-k) / (k+1 * ... * m)
    >= (1 * ... * m) ^ 2 = m! ^ 2
    当且仅当 k = m 时等号成立
 */

/*
 *  TEST
 */
import Foundation
class Test {
    class func run(_ code:() -> ()) {
        let start = Date()
        print("\(start): Test start")
        code()
        let end = Date()
        print("\(end): Test end in \(Int((end.timeIntervalSince1970 - start.timeIntervalSince1970)*1000))ms")
    }
}

Test.run {

}