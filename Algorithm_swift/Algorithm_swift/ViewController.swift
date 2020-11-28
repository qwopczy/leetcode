//
//  ViewController.swift
//  Algorithm_swift
//
//  Created by chenyi on 2020/11/28.
//  Copyright © 2020 chenyi. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        AlgorithmDebug()
    }
    func timeNow()->Double{
        let timeIntervalTongS:TimeInterval = NSDate().timeIntervalSince1970
        let timeStampTongS = Double(timeIntervalTongS)
        return timeStampTongS;
    }

    func AlgorithmDebug()  {
        
        let result =  Solution3().lengthOfLongestSubstring("ablkhjuiihkhhhcabb")
        print(result)
        /*
         输入：
         ["","","",
         "", "",
         "", ""]
         [[],[1],[3],
         [1,2], [1],[1],
         [1]]
         */
        
        
        /*
        let linkedList =  MyLinkedList()
        linkedList.addAtHead(1)
        
        
        linkedList.addAtTail(3)
        
        
        linkedList.addAtIndex(1, 2)
        print(linkedList.get(1))
        
        linkedList.deleteAtIndex(1)
        
        print(linkedList.get(1))
        */
        
        
        // -4 -1 -1 0 1 2
        let result560 =  Solution560().subarraySum([1,-1,0]
            ,0)
        
        
//        var result560B = [Int]()
//        for _ in 0...15{
//            let tmp :Int = Int(arc4random() % 100) + 1
//            result560B.append(tmp)
//        }
//        print("init \(result560B)");
        
        
        var resultSort =  [60,8,801,7,2,0,102,220] //
        let t1 = timeNow()
        Algorithm().radixSort(&resultSort)
        print(resultSort)
        let t2 = timeNow()
        let tongTime = t2 - t1
        print("耗时 \(tongTime)")
        
        let countingSort  = Algorithm().countingSort(&resultSort, resultSort.max()!, resultSort.min()!)
        print(countingSort)
        
        Algorithm().heapSort(&resultSort)
        print("nSum \(resultSort)");
        
        
        let isV = Solution678().checkValidString("()()(")
        
        print(isV)
        
        
        /*
        //LRU
        let lru =  LRUCache(1)
        lru.put(2, 1)
        print(lru.get(2))
        print(Solution8().myAtoi("-91283472332"))
        print(Solution8().myAtoi(" "))
        print(Solution8().myAtoi("2147483648"))
        
        print(Solution5().longestPalindrome("babad"))
        
        print(Solution990().equationsPossible(["c==b","c!=b"]))
        */
        /*
         let lru =  LFUCache(2)
         
         lru.put(2, 1)
         
         print(lru.get(2))
         
         lru.put(1, 3)
         lru.put(3, 5)
         
         print(lru.get(1))
         
         print(lru.get(2))
         */
        /*
         let trie = Trie()
         trie.insert("apple")
         print(trie.search("apple"))
         
         print(trie.search("app"))
         trie.insert("app")
         print(trie.search("app"))
         trie.insert("a")
         print(trie.search("a"))
         */
        
        
        /*
         
         let mPQ = MedianFinderQueue.init();
         print("null")
         mPQ.addNum(-1);print("null")
         print(mPQ.findMedian())
         mPQ.addNum(-2);print("null")
         print(mPQ.findMedian())
         mPQ.addNum(-3);print("null")
         print(mPQ.findMedian())
         mPQ.addNum(-4);print("null")
         print(mPQ.findMedian())
         mPQ.addNum(-5);print("null")
         print(mPQ.findMedian())
         */
        
        
        /*
         let maxPQ = MaxPriorityQueue.init();
         print(maxPQ.add(2));
         
         for _ in 0...15{
         let tmp :Int = Int(arc4random() % 100) + 1
         maxPQ.add(tmp)
         }
         print("sortArr ago queue \(maxPQ.queue)");
         
         var sortArr = [Int]()
         
         while maxPQ.queue.count > 0 {
         sortArr.insert(maxPQ.remove(), at: 0)
         }
         print("sortArr queue \(sortArr)");
         
         */
        
        
        
        
        
    }

}

