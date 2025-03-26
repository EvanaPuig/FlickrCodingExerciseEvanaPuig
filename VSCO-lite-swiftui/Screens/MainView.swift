import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(viewModel: viewModel)
                
                if viewModel.photos.count == 0 {
                    Spacer()
                    EmptySection()
                    Spacer()
                } else {
                    PhotoGrid(viewModel: viewModel)
                }
            }
            .navigationTitle("Flickr Photos")
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView(viewModel: ViewModel())
        }
    }
}
