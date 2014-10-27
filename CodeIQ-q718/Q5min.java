//package com.crocro;

public class Q5min {
    public static void main(String[] args) {
        Ques ques = new Ques();
        System.out.println(ques.getString());
        // QuesのClass1のメソッドgetStringを利用
        Ques.Class1 quesClass1 = new Ques.Class1();
        System.out.println(quesClass1.getString());
        // QuesのClass2のメソッドgetStringを利用
        Ques.Class2 quesClass2 = new Ques:Class2();
        System.out.println(quesClass2.getString());
    }
}