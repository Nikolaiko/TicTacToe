import SwiftUI

struct EnterNameScreen: View {

    @State var name = ""

    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
            Button {
                
            } label: {
                Text("Enter")
            }

        }
    }
}

struct EnterNameScreen_Previews: PreviewProvider {
    static var previews: some View {
        EnterNameScreen()
    }
}
