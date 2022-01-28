import SwiftUI
import SwiftDevPackage

struct MainScreenView: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {
        VStack {
            Button {
                navigation.push(GameScreen())
            } label: {
                Text("Versus AI")
            }
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
