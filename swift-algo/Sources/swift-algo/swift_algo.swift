public class UnionFind {
    var rank: [Int] = []
    var root: [Int] = []
    
    public init(size: Int) {
        for i in 0..<size {
            root[i] = i
            rank[i] = 1
        }
    }
    
    public func find(_ x: Int) -> Int {
        if x == root[x] {
            return x
        }
        root[x] = find(root[x])
        return root[x]
    }
    
    public func union(_ x: Int, _ y: Int) {
        let rootX = root[x]
        let rootY = root[y]
        
        if rootX != rootY {
            if rank[rootX] < rank[rootY] {
                root[rootX] = rootY
            } else if rank[rootY] < rank[rootX] {
                root[rootY] = rootX
            } else {
                root[rootY] = rootX
                rank[rootX] += 1
            }
        }
    }
}
