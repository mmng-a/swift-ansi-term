//
//  Console.swift
//  
//
//  Created by Masashi Aso on 2020/10/24.
//

public enum Console {
  public static func scroll(_ n: Int) {
    if n >= 0 {
      print("\u{1b}[\(n)S", terminator: "")
    } else {
      print("\u{1b}[\(abs(n))T", terminator: "")
    }
  }
  
  public static func clearAfterCursor() {
    print("\u{1b}[0J", terminator: "")
  }
  
  public static func clearBeforeCursor() {
    print("\u{1b}[1J", terminator: "")
  }
  
  public static func clearAll() {
    print("\u{1b}[2K", terminator: "")
  }
  
  public static func clearLineAfterCursor() {
    print("\u{1b}[1K", terminator: "")
  }
  
  public static func clearLineBeforeCursor() {
    print("\u{1b}[1K", terminator: "")
  }
  
  public static func clearLine() {
    print("\u{1b}[2K", terminator: "")
  }
}

