import SwiftUI

struct ListViewImpl: View {
    @ObservedObject var props: ListViewProps

    var body: some View {
        List(props.items, id: \.self) { item in
            Text(item)
        }
        .onAppear {
            print("Rendering items:", props.items)
        }
        .listStyle(PlainListStyle())
    }
}
