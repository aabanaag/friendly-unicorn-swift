# FriendlyUnicorn
Utilizing iTunes search API using MVVM-C and RxSwift, written in Swift

> NOTE: This acts as a Coding challenge for Appetiser Apps

## Persistence
> Your app should demonstrate the ability to save data and reuse it when the user opens the app again

- Added a feature called "My List", it will consists of items that I selected from the list of items iTunes search API provided. My List will be persisted so that it will be available offline.
- It would also show a timestamp of the user's last session.

## Architecture
> MVVM-C or Model-View-ViewModel-Coordinator pattern.

MVVM, simply because it separates components making it maintainable and testable. The ViewModel contains most of the business logic and since it is not coupled to a view, it would be easier to create unit-test. While applying coordinator pattern to MVVM, adds an extra layer of separation, it basically prevents any view to be know other views within the app. The Coordinator organizes everything in a soft of container box.

## Dependencies
- [RxSwift](https://github.com/reactiveX/rxswift)
- [RxDataSources](https://github.com/RxSwiftCommunity/RxDataSources)
- [Moya](https://github.com/Moya/Moya)
- [Nuke](https://github.com/kean/Nuke)
- [Natalie](https://github.com/krzyzanowskim/Natalie)

