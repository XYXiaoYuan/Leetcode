//: [Previous](@previous)

/**
现有 x 张十元纸币，y 张五元纸币，z 张两元纸币, 购物后要支付 n 元（x,y,z,n为整数）。要求编写一个复杂度为 O(1) 的函数 FindSolution( x, y, z, n)，功能是计算出能否用现在手上拥有的纸币是否足够并能刚好凑齐 n 元，而不需要找零。   1.如果可以，在屏幕输出一个方案并结束；（例子：“需要 2 张十元纸币，1 张五元纸币， 1 张两元纸币，刚好可凑齐 27 元”）  2.如果不可以，在屏幕输出 “不能刚好凑齐 n 元”。
*/

import Foundation

public class 星商面试题 {
    public init() {}

    public func solution(x: Int, y: Int, z: Int, money: Int) {
        if (10 * x + 5 * 10 + 2 * z < money) {
            print("😭 钱不够,不能刚好凑齐\(money)元😭");
        }
        var remain: Int = money;
        
        if (money == 1 || money == 3) {
            print("😭 不能刚好凑齐\(money)元😭");
            return ;
        }
        
        var tenCount = 0, fiveCount = 0, twoCount = 0;
        
        tenCount = min(x, remain / 10);
        if ((money % 10 == 1) || (money % 10 == 3)) {
            tenCount -= 1;
        }
        remain -= 10 * tenCount;
        
        fiveCount = min(y, remain / 5);
        remain -= 5 * fiveCount;
        
        if (((remain & 1) == 1) && fiveCount > 0) {
            remain += 5;
            fiveCount -= 1;
        }
        
        twoCount = min(z, remain / 2);
        remain -= 2 * twoCount;
        
        if (remain == 0) {
            print("😃\(tenCount) 张10元(10*\(tenCount), \(fiveCount) 张5元(5*\(fiveCount), \(twoCount) 张2元(2*\(twoCount)), 刚好凑齐\(money)元😃");
        } else {
            print("😭 不能刚好凑齐%zd元😭", money);
        }
    }
}

