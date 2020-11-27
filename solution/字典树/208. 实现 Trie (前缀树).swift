//
//  TrieClass.swift
//  swift_project
//
//  Created by chenyi on 2020/8/12.
//  Copyright © 2020 chen. All rights reserved.
//

import Foundation

class TrieNode {
    
    //数组
    //记录孩子节点  //子节点数组长度26，0：‘a’，1：‘b’.....
    var child = [TrieNode?](repeating: nil, count: 26)
    var isEnd = false
}
class Trie {
    let aAsciiValue = Int(Character("a").asciiValue ?? 97)

    var root = TrieNode()
    init() {
        
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var ptr = self.root
        for char in word {
            let index = Int(char.asciiValue!) - aAsciiValue
            if ptr.child[index] == nil{
                //该单词不存在,则生成一个节点
                ptr.child[index] = TrieNode()
            }
            ptr = ptr.child[index]!
            
        }
        ptr.isEnd = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var ptr = self.root
        for char in word {
            let index = Int(char.asciiValue!) - aAsciiValue
            if ptr.child[index] == nil{
                return false
                
            }
            ptr = ptr.child[index]!
            
        }
        return ptr.isEnd;//如果所有字符都在前缀树中，那么判断最后一个字母结束标志是否为true，
        // 为true，返回true，说明单词找到，否则，false，没找到
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var ptr = self.root
        for char in prefix {
            let index = Int(char.asciiValue!) - aAsciiValue
            if ptr.child[index] == nil{
                return false
                
            }
            ptr = ptr.child[index]!
            
        }
        return true;
    }
}
