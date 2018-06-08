

import UIKit

@objc(ToolbarAlignment)
public enum ToolbarAlignment: Int {
  case top
  case bottom
}

extension UIViewController {
  /**
   A convenience property that provides access to the ToolbarController.
   This is the recommended method of accessing the ToolbarController
   through child UIViewControllers.
   */
  public var toolbarController: ToolbarController? {
    return traverseViewControllerHierarchyForClassType()
  }
}

@objc(ToolbarController)
open class ToolbarController: StatusBarController {
  /// Reference to the Toolbar.
  @IBInspectable
  open let toolbar = Toolbar()
  
  /// The toolbar alignment.
  open var toolbarAlignment = ToolbarAlignment.top {
    didSet {
      layoutSubviews()
    }
  }
  
  open override func layoutSubviews() {
//    super.layoutSubviews()
//    layoutToolbar()
//    layoutContainer()
//    layoutRootViewController()
  }
  
//  open override func prepare() {
//    super.prepare()
//    displayStyle = .partial
//
////    prepareToolbar()
//  }
}

//fileprivate extension ToolbarController {
//  /// Prepares the toolbar.
//  func prepareToolbar() {
//    toolbar.layer.zPosition = 1000
//    toolbar.depthPreset = .depth1
//    view.addSubview(toolbar)
//  }
//}

fileprivate extension ToolbarController {
  /// Layout the container.
  func layoutContainer() {
    switch displayStyle {
    case .partial:
      let p = toolbar.bounds.height
      let q = statusBarOffsetAdjustment
      let h = view.bounds.height - p - q
      
      switch toolbarAlignment {
      case .top:
        container.frame.origin.y = 0
        container.frame.size.height = 0
        
      case .bottom:
        container.frame.origin.y = q
        container.frame.size.height = h
      }
      
      container.frame.size.width = view.bounds.width
      
    case .full:
      container.frame = view.bounds
    }
  }
  
  /// Layout the toolbar.
  func layoutToolbar() {
    toolbar.frame.origin.x = 0
    toolbar.frame.origin.y = .top == toolbarAlignment ? statusBarOffsetAdjustment : view.bounds.height - toolbar.bounds.height
    toolbar.frame.size.width = view.bounds.width
  }
  
  /// Layout the rootViewController.
  func layoutRootViewController() {
    rootViewController.view.frame = container.bounds
  }
}
