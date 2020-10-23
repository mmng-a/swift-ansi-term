//
//  Cursor.swift
//  
//
//  Created by Masashi Aso on 2020/10/24.
//

public enum Cursor {
  public static func move(up n: Int) {
    if n >= 0 {
      print("\u{1b}[\(n)A", terminator: "")
    } else {
      move(down: -n)
    }
  }
  
  public static func move(down n: Int) {
    if n >= 0 {
      print("\u{1b}[\(n)B", terminator: "")
    } else {
      move(up: -n)
    }
  }
  
  public static func move(forward n: Int) {
    if n >= 0 {
      print("\u{1b}[\(n)C", terminator: "")
    } else {
      move(backward: -n)
    }
  }
  
  public static func move(backward n: Int) {
    if n >= 0 {
      print("\u{1b}[\(n)D", terminator: "")
    } else {
      move(forward: -n)
    }
  }
  
  public static func move(startOfLine n: Int) {
    if n >= 0 {
      print("\u{1b}[\(n)E", terminator: "")
    } else {
      print("\u{1b}[\(n)F", terminator: "")
    }
  }
  
  public static func move(toN n: Int) {
    precondition(n >= 0, "x must be greeter than 0")
    print("`u{1b}[\(n)G", terminator: "")
  }
  
  public static func move(toN n: Int, m: Int) {
    precondition(n >= 0, "x must be greeter than 0")
    precondition(m >= 0, "y must be greeter than 0")
    print("\u{1b}[\(n);\(m)H", terminator: "")
  }
  
//  public static func getPosition() -> (n: Int, m: Int)? {
//    let process = Process()
//    process.launchPath = "/usr/bin/env"
//    process.arguments = ["echo", "\u{1b}[6n"]
//
//    let pipe = Pipe()
//    process.standardOutput = pipe
//    process.launch()
//    let data = pipe.fileHandleForReading.readDataToEndOfFile()
//    
//    print(String(data: data, encoding: .utf8) as Any)
//
//    guard let result = String(data: data, encoding: .utf8),
//          let separatorIndex = result.firstIndex(where: { $0 == ";" }) else {
//      return nil
//    }
//    let startIndex = result.index(result.startIndex, offsetBy: 2)
//    let n = result[startIndex..<separatorIndex]
//    let m = result.suffix(from: result.index(after: separatorIndex))
//
//    guard let n_i = Int(n), let m_i = Int(m) else { return nil }
//    return (n_i, m_i)
//  }
}
