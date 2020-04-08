# FriendlyUnicorn
Utilizing iTunes search API using MVVM-C and RxSwift, written in Swift

> NOTE: This acts as a Coding challenge for Appetiser Apps

## Setup
> NOTE: This project uses Carthage as package manager, Make sure you install Carthage first follow installation steps [here](https://github.com/Carthage/Carthage#installing-carthage)

1. Clone repo
2. Execute command `carthage update platform --iOS`


## Persistence
> Your app should demonstrate the ability to save data and reuse it when the user opens the app again

- Added a feature called "My List", it will consists of items that I selected from the list of items iTunes search API provided. My List will be persisted so that it will be available offline.
- It would also show a timestamp of the user's last session.

## Architecture
> MVVM or Model-View-ViewModel pattern.

MVVM, simply because it separates components making it maintainable and testable. The ViewModel contains most of the business logic and since it is not coupled to a view, it would be easier to create unit-test.

## Dependencies
- [RxSwift](https://github.com/reactiveX/rxswift)
- [RxDataSources](https://github.com/RxSwiftCommunity/RxDataSources)
- [Moya](https://github.com/Moya/Moya)
- [Nuke](https://github.com/kean/Nuke)
- [Natalie](https://github.com/krzyzanowskim/Natalie)
- [Carthage](https://github.com/Carthage/Carthage)

