//
//  main.swift
//  CaseTest
//
//  Created by 大津 真 on 2014/08/06.
//  Copyright (c) 2014年 大津 真. All rights reserved.
//

import Foundation

// ＊問1
var month: Int = 3
switch month {
case 12, 1, 2:
    println(String(month) + "月は冬です")
case 3, 4, 5:
    println(String(month) + "月は春です")
case 6, 7, 8:
    println(String(month) + "月は夏です")
case 9, 10, 11:
    println(String(month) + "月は秋です")
default:
    println("月の値は1から12である必要があります")
}


// ＊問2
var filename: String = "sample.html"
switch filename.pathExtension {
case "html", "htm":
    println(filename + "はHTMLファイルです")
case "txt":
    println(filename + "はテキストファイルです")
case "swift":
    println(filename + "はSwiftファイルです")
default:
    println("不明なファイル形式です")
}


// ＊問3
var age: Int = 19
if age >= 0 && age < 20 {
    println(String(age) + "才は未成年です")
} else if age == 20 {
    println(String(age) + "才はちょうど成人です")
} else if age >= 21 {
    println(String(age) + "才は成人です")
} else {
    println("年齢の値が不適切です")
}
