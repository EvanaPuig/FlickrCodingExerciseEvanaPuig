import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        TabView {
            // Flickr Photos
            NavigationView {
                VStack {
                    SearchBar(viewModel: viewModel)
                    
                    if viewModel.photos.count == 0 {
                        Spacer()
                        EmptySection()
                        Spacer()
                    } else {
                        // PhotoGrid(viewModel: viewModel)
                    }
                }
                .navigationTitle("Flickr Photos")
            }
            .tabItem {
                VStack {
                    Image(systemName: "photo.on.rectangle")
                    Text("Flickr Photos")
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView(viewModel: ViewModel())
            
            /* Landscape {
                MainView(viewModel: ViewModel())
            } */
        }
    }
}
