import UIKit

// Labeled Statements
outer: for i in 1...3 {
    print("OUTER LOOP", i)
    
    for j in 1...3 {
        print("   inner loop", j)
        
        break outer
    }
}
