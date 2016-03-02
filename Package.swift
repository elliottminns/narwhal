import PackageDescription

let package = Package(name: "Narwhal",
    dependencies: [
        .Package(url: "https://github.com/elliottminns/echo.git",
                 majorVersion: 0),
        .Package(url: "https://github.com/elliottminns/ocean.git",
                 majorVersion: 0)
    ]
)
