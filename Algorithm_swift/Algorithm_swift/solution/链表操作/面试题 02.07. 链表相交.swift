///**
// * Definition for singly-linked list.
// * struct ListNode {
// *     int val;
// *     struct ListNode *next;
// * };
// */
//struct ListNode *getIntersectionNode(struct ListNode *headA, struct ListNode *headB) {
//    if (headA == NULL || headB == NULL){
//        return NULL;
//    }
//    struct ListNode *t1 = headA;
//    struct ListNode *t2 = headB;
//    while (t1 != t2) {
//        if (t1 == NULL){
//            t1 = headB;
//
//        }else{
//            t1 = t1->next;
//
//        }
//        if (t2 == NULL){
//            t2 = headA;
//
//        }else{
//            t2 = t2->next;
//        }
//
//    }
//    return t1;
//}
