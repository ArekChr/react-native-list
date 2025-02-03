import SwiftUI

/**
 Props that component accepts. SwiftUI view gets re-rendered when ObservableObject changes.
 */
class ListViewProps: ObservableObject {
    @Published var items: [String] = []
}
