import Foundation

struct AlertItem: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let text: String
}
