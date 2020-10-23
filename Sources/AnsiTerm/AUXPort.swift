//
//  File.swift
//  
//
//  Created by Masashi Aso on 2020/10/25.
//

public enum AUXPort {
  public static func on() {
    print("\u{1b}[5i")
  }
  
  public static func off() {
    print("\u{1b}[4i")
  }
}
