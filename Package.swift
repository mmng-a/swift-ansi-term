// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "swift-ansi-term",
  products: [
    .library(
      name: "AnsiTerm",
      targets: ["AnsiTerm"]),
    .executable(
      name: "demo",
      targets: ["Demo"])
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "AnsiTerm",
      dependencies: []),
    
    .target(
      name: "Demo",
      dependencies: ["AnsiTerm"],
      path: "Demo"),
    
    .testTarget(
      name: "AnsiTermTests",
      dependencies: ["AnsiTerm"]),
  ]
)
