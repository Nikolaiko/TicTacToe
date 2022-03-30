import SwiftUI
import SwiftDevPackage

struct EnterScreenView: View {
    @State private var userName = "Player"
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {
        VStack {
            TextField("Кто ты по жизни вообще?", text: $userName)
            Button {
                navigation.push(MainScreenView(userName: userName))
            } label: {
                Text("Начать")
            }
            .disabled(userName.isEmpty)
        }
    }
}

struct EnterScreenView_Previews: PreviewProvider {
    static var previews: some View {
        EnterScreenView()
    }
}
