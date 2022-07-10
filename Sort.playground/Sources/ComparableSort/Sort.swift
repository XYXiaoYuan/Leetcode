import Foundation

class Sort<T> {
    var array: [T] = [T]()
    var cmpCount: Int = 0
    var swapCount: Int = 0
    
    
    func sort<T> (_ array: [T]) -> [T] {
        if array.isEmpty || array.count < 2 {
            return array
        }
                
        return []
    }
}

