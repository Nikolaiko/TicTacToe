import SwiftUI

struct GameScreen: View {
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(0..<9) { i in
                        HStack {
                            Rectangle()
                                .foregroundColor(.red)
                                .aspectRatio(1, contentMode: .fit)
                                .overlay {
                                    Image("cross")
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fit)
                                }
                            Divider()
                        }
                    }
                }
            }
            .background(.black)
        }
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}
