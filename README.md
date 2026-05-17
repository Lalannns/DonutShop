# DonutShop
project 10 of SwiftUI. I've swaped cupcakes on donuts

# DonutShop 🧁

DonutShop is an iOS application built using **SwiftUI** that allows users to customize and order donuts. It demonstrates core iOS development concepts, such as fetching and decoding JSON data from a web service, validating forms, managing complex application states, and utilizing `Codable` with `@Observable` (or `@ObservedObject` depending on your Swift version).

This project is part of Project 10 in Paul Hudson's [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui/49) curriculum.

## 🚀 Features

- **Dynamic Donut Customization:** Choose donut types (Vanilla, Chocolate, Strawberry, Rainbow) and quantity.
- **Special Requests:** Toggle options for extra frosting and added sprinkles.
- **Smart Form Validation:** Prevents form submission unless valid contact details (Name, Street Address, City, Zip) are provided.
- **Address Formatting Check:** Detects and flags empty strings or strings containing only whitespace.
- **Web Service Integration:** Transmits order data over the internet via `URLRequest` to a test server ([ReqRes](https://reqres.in)) and parses the server's response.
- **User Alerts:** Displays interactive notifications for successful orders or network connection failures.

## 🛠️ Concepts Covered

- **`Codable` & `@Observable`:** Combining Swift's archiving protocol with modern SwiftUI state management.
- **`Form` & `Section`:** Creating structured, clean, and interactive settings and user entry workflows.
- **`AsyncImage`:** Asynchronously downloading and displaying images from remote URLs.
- **`URLSession` & `URLRequest`:** Initiating network POST requests to send encoded JSON data to an API.
- **SwiftUI Disabling State:** Utilizing the `.disabled()` modifier to conditionally control user interactions based on form completeness.

## 📱 Screenshots

<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-05-17 at 09 52 30" src="https://github.com/user-attachments/assets/647cd8ff-ba2b-43d7-9395-094e1915a26f" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-05-17 at 09 52 39" src="https://github.com/user-attachments/assets/38f0ab7c-d858-4dfb-8e96-8e3a0705fbf2" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-05-17 at 09 52 49" src="https://github.com/user-attachments/assets/fbf4c8e8-b801-46e5-9641-9dbccaa882ac" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-05-17 at 09 53 24" src="https://github.com/user-attachments/assets/f44828df-6fa8-4eec-95dd-4400e39d828b" />





## 💻 Installation & Requirements

- **iOS 17.0+** (or iOS 13+ depending on the Swift version targeted)
- **Xcode 15.0+**
- **Swift 5.9+**


