import SwiftUI
import UIKit
import React

@objc public class ListViewProvider: PlatformView {
    private var hostingController: PlatformHostingController<ListViewImpl>?
    private var props = ListViewProps()

    @objc public var items: [String] = [] {
        didSet {
            props.items = items
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        if self.hostingController != nil {
          return
        }
        
        self.hostingController = PlatformHostingController(rootView: ListViewImpl(props: props))

        if let hostingController = self.hostingController, let parentViewController = reactViewController() {
           parentViewController.addChild(hostingController)
           addSubview(hostingController.view)
           hostingController.view.translatesAutoresizingMaskIntoConstraints = false
           hostingController.view.pinEdges(to: self)
           hostingController.didMove(toParent: parentViewController)
        }
    }

    private func updateView() {
        hostingController?.rootView = ListViewImpl(props: props)
    }
}
