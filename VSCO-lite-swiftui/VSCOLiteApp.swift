import SwiftUI

@main
struct VSCOLiteApp: App {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: viewModel)
        }
    }
}
