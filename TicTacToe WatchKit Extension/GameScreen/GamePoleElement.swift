import SwiftUI

struct GamePoleElement: View {
    private let cellType: CellType
    private let width: CGFloat

    init(_ type: CellType, _ screenWidth: CGFloat) {
        cellType = type
        width = screenWidth
    }

    var body: some View {
        HStack {
            switch cellType {
            case .empty:
                emptyView()
                    .frame(height: width / 4)
            case .zero:
                zeroView()
                    .frame(height: width / 4)
            case .cross:
                crossView()
                    .frame(height: width / 4)
            }
        }
    }

    func crossView() -> some View {
        return Rectangle()
            .foregroundColor(.white)
            .overlay {
                Image("cross")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
    }

    func zeroView() -> some View {
        return Rectangle()
            .foregroundColor(.white)
            .overlay {
                Image("zero")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
    }

    func emptyView() -> some View {
        return Rectangle()
            .foregroundColor(.white)
    }
}

struct GamePoleElement_Previews: PreviewProvider {
    static var previews: some View {
        GamePoleElement(CellType.zero, CGFloat(200))
    }
}
