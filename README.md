# Swifthon

> A Swift library that aims to make Swift usage similar to Python

![](https://img.shields.io/badge/license-MIT-brown)
![](https://img.shields.io/badge/version-0.9.4-orange)
![](https://img.shields.io/badge/Swift-5.9-blue)

## Installation

### Swift Package Manager

Add the following dependency to your `Package.swift` file:

```swift
    dependencies: [
        .package(url: "https://github.com/YassineLafryhi/Swifthon.git", from: "0.9.4")
    ]
```

## Usage (Other examples are in the `Tests/SwifthonTests` folder)

### Write/Read Files (open, write, read, close)

```swift
import Swifthon

let user = Swifthon.os.getlogin()
let path = "/Users/\(user)/Desktop/demo.txt"

var f = Swifthon.open(path, "a")!
f.write("Now the file has more content !")
f.close()

f = Swifthon.open(path, "r")!
var content = f.read()
print(content)
f.close()
```

### Send HTTP GET request and parse JSON (requests, json)

```swift
let data = try await Swifthon.requests.get("https://jsonplaceholder.typicode.com/todos")
let json = try Swifthon.json.loads(data)
for item in json {
    print(item["title"])
}
```

### Get current date and time (datetime)

```swift
let now = Swifthon.datetime.now()
let formatted = now.strftime("dd-MM-yyyy HH:mm:ss")
print(formatted)
```

### Some Math functions (math)

```swift
print("Value of pi: \(Swifthon.math.pi)")
print("Value of e: \(Swifthon.math.e)")

print("Square root of 25: \(Swifthon.math.sqrt(25))")
print("Factorial of 3: \(Swifthon.math.factorial(3))")
```

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

[MIT License](https://choosealicense.com/licenses/mit)
