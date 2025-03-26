import SwiftUI

@main
struct VSCOLiteApp: App {
    @ObservedObject var viewModel = PhotoSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            PhotoSearchView()
        }
    }
}
