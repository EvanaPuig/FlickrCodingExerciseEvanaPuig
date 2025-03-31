# Repository for Flickr Interview Exercise

## Author: Evana Margáin Puig
Company: Xteam

---

## UI Choice
SwiftUI was chosen for the development of this app as it is in line with the current trends in iOS development and is Apple's preferred method. In the working branch I have deleted the UIKit code.

## Git
As shown in this repository, Git was chosen. I have created this branch and labeled it 'brute_force_solution' in order to demonstrate how the development of a feature would have been done in a production app.

## Tests
To demonstrate the use of tests in production apps, I have created the /VSCO-lite-swiftuiTests directory, which has PhotoSearchViewModelTests.swift, which has some ViewModel tests that, although not exhaustive, show how tests would be made in a production app. 
It also contains a MockDataProvider file to show how dependencies are mocked. In a production app, there might be discussions regarding the differences between test doubles, such as mocks vs fakes, but for the interview, I went for the option of mocks. Also, it is a good practice to use dependency injection when creating production-level apps, but I am not doing this due to time constraints.

## Frameworks
### Networking
For the networking layer of the app I sticked with the provided code because no instructions were giving on whether the code should be kept or modified, but I take this as a good example on how to integrate with existing code regardless of whether things could be done in an alternative manner.

### Image Loading
With the purpose of showing the possibility of integrating third-party frameworks, I made the choice of using KingFisher because it is a great choice for loading and caching images in iOS apps because of its performance, ease of use, and built-in features. The reasons why I would choose KingFisher in a production-level app are:
- Kingfisher automatically caches downloaded images in both memory and disk, reducing network calls and improving app performance.
- Cached images load instantly, enhancing the user experience, especially in image-heavy apps like the one used in the example.
- Asynchronous & Non-blocking: Image downloading, processing, and caching happen on a background thread, ensuring smooth UI performance.
- Simple & Expressive API, that allows developers at all levels to easily use it and implement features with it.
- Kingfisher can seamlessly load images from: Remote URLs (e.g., Flickr), local file system, and Bundled assets.
- Ease of displaying placeholders and fallback images
- It contains performance optimizations that would require extra development time if a custom solution were created.
  - Lazy Loading
  - Image downscaling
  - GIF support
- Works well with both SwiftUI and UIKit
- It's easy to customize it and extend it.
- It is actively maintained, widely used in production apps, and has detailed documentation.
- Kingfirsher simplifies a process that would require a series of code files:
  - Networking with URLSession
  - Parsing Data into UIImage
  - Caching Images manually
  - Updating UI on the main thread
 Although I'm not demonstrating all the uses of Kingfisher, the above states the reasons why I would choose them in a production level app.

### Dependency Management
For managing dependencies I chose SPM (Swift Package Manager), which has several advantages over the other most common options: Carthage and CocoaPods.
- SPM is built into Xcode and has seamless integration into an iOS project.
- SPM builds dependencies in parallel, optimizing performance. Unlike CocoaPods, which modifies the .xcworkspace or Carthage, which builds dependencies as separate frameworks, SPM compiles only what is needed, leading to faster builds and smaller app sizes.
- It has first-party support from Apple, for this reason, it's also:
  - Optimized for iOS development
  - Updated with Xcode releases (preventing backwards compatibility issues)
  - Well documented and more reliable.
  - Used by Apple in its projects.
- SPM is also cleaner and more secure.
  - No need for adding extra folders, like with Cocoapods
  - No risk of vulnerability injections (which have become very common with CocoaPods)
  - Everything is declared in a single Package.swift file.
  - Supports semantic versioning
- No need for framework management
  - Carthage requires you to manually drag-and-drop .framework files into Xcode.


## Architecture

The architecture chosen for this app was MVVM (Model-View-ViewModel). The following are the reasons why MVVM is a great choice for modern app development and how it benefits projects:

1. Separation of Concerns = Maintainability & Scalability
  - Model → Represents the data layer (e.g., Photo, FlickrPhotosInfoResponse).
  - ViewModel → Handles business logic, formatting, and state management (PhotoSearchViewModel).
  - View → Only responsible for displaying UI (PhotoSearchView, PhotoGrid, SearchBar).

✅ Keeps UI and business logic separate, making it easy to update UI without modifying the logic.
✅ Scales well as features grow, unlike MVC, where the ViewController tends to become massive ("Massive View Controller" problem).

2. Improved Testability
  - The ViewModel is independent of the UI, making it easy to unit test.
  - For example, the PhotoSearchViewModel can be tested without launching the UI.

✅ Unlike MVC, where UI logic is tangled in ViewControllers, MVVM makes unit testing straightforward.

3. Better State Management with @Published & Combine
  - MVVM integrates well with SwiftUI, thanks to @Published and ObservableObject.

      Example:
      ```
      class PhotoSearchViewModel: ObservableObject {
          @Published var photos: [Photo] = []
          @Published var searchText: String = ""
          @Published var isLoading = false
          @Published var errorMessage: String?
      }
      ```

  - Since the View observes the ViewModel, the UI updates automatically when the state changes.

✅ No need to manually update UI like in MVC.
✅ More reactive and declarative, making UI rendering more predictable.

4. Decoupling Enhances Code Reusability
- The ViewModel does not know about the UI, meaning:
- You can swap out SwiftUI for UIKit without rewriting the business logic.
- The same PhotoSearchViewModel can be used in a widget or a watchOS app.
- Example:
  - PhotoSearchViewModel fetches photos → Can be used by a SwiftUI, UIKit, or watchOS view.
  - DataProvider fetches API data → Can be reused by other parts of the app.

✅ Write once, reuse everywhere—making development faster and reducing duplicate code.

5. Reactive & Modern (Best Fit for SwiftUI)
  - MVVM works seamlessly with SwiftUI’s declarative nature.
  - No imperative calls like tableView.reloadData()—SwiftUI automatically updates the UI when state changes.
  - Works with Combine and async/await, reducing complexity.

✅ More modern than MVC and aligns with Apple’s SwiftUI philosophy.

6. Scales Better Than MVC

| Feature              | MVC (Traditional)          | MVVM (Your Architecture)  |
|----------------------|--------------------------|--------------------------|
| **Separation of Concerns** | ❌ Poor (Massive ViewControllers) | ✅ Excellent (Clear division) |
| **Testability**      | ❌ Hard (UI-dependent logic) | ✅ Easy (ViewModel is UI-agnostic) |
| **Scalability**      | ❌ Poor (Tightly coupled)  | ✅ Great (Decoupled layers) |
| **SwiftUI Integration** | ❌ Requires workarounds | ✅ Built for SwiftUI |
| **Maintainability**  | ❌ Harder with larger codebases | ✅ Easier due to modular design |

✅ MVVM prevents the "Massive View Controller" problem, making it the best choice for long-term projects.

7. Easier to Debug & Extend
  - Bug in UI? Fix it in the View.
  - Bug in data transformation? Fix it in the ViewModel.
  - Need new API logic? Modify only DataProvider.

✅ Each layer has a single responsibility, making debugging straightforward.
✅ Future features (e.g., pagination, sorting) can be added without breaking existing code.

🚀 Why MVVM is the Best Choice for Your Flickr App
  - Decouples business logic from UI, avoiding messy view controllers.
  - Improves testability, making unit tests easy to write.
  - Leverages SwiftUI’s declarative state management, reducing boilerplate code.
  - Scales well for future growth, unlike MVC, which gets harder to maintain.
  - Follows modern iOS development practices (Combine, SwiftUI, async/await).

---

# Original Instructions: Coding exercises to be used with iOS engineering interviews.

## Requirements: 

Please create a simple app to search photos on Flickr using their free API. The app should have a search bar above a collection displaying the images resulting from the search. Details on Flickr’s API and recommended request are below. The app does not need to be production-ready, but should represent how you approach architecture, maintenance, and testability.

## Notes: 
- Feel free to use SwiftUI, or UIKit (programmatic, storyboards, xibs) whichever you feel plays to your strengths (at VSCO we favor SwiftUI or programmatic UI as we find this easier to maintain with a larger team). 
- Please initialize git within your project and make commits as you iterate. We’re not concerned so much with the content of the commits as much as getting a sense of your facility with git. 
- We love tests, and given the short amount of time to develop this app we’re looking more for an awareness of testability than quantity of unit tests. 
- Please feel free to use frameworks as needed (for example, Alamofire). In general we’re conservative with adding third-party frameworks. Please be prepared to discuss what you took into consideration when choosing a framework (ease of use, security, performance, etc) as well as your choice of dependency management (Cocoapods, SPM, Carthage). 
- Architecture/Patterns: design and build for change. Software should be soft and malleable. The exact patterns are up to you (MVVM, MVC, Coordinator, Redux, etc). Please be prepared to discuss your choices and how it might lend itself to separation of concerns, maintenance, collaboration, and testability.
- Please include a README in your project describing time spent, challenges, trade-offs, potential edge cases and next steps you’d take given more time.
- Note that the response from Flickr is paginated. Time permitting, please take this into consideration in your implementation.
