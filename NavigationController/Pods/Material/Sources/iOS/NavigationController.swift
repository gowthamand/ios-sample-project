import UIKit
import Motion

extension NavigationController {
  /// Device status bar style.
  open var statusBarStyle: UIStatusBarStyle {
    get {
      return Application.statusBarStyle
    }
    set(value) {
      Application.statusBarStyle = value
    }
  }
}

open class NavigationController: UINavigationController {
  /**
   An initializer that initializes the object with a NSCoder object.
   - Parameter aDecoder: A NSCoder instance.
   */
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  /**
   An initializer that initializes the object with an Optional nib and bundle.
   - Parameter nibNameOrNil: An Optional String for the nib.
   - Parameter bundle: An Optional NSBundle where the nib is located.
   */
  public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  /**
   An initializer that initializes the object with a rootViewController.
   - Parameter rootViewController: A UIViewController for the rootViewController.
   */
  public override init(rootViewController: UIViewController) {
    super.init(navigationBarClass: NavigationBar.self, toolbarClass: nil)
    setViewControllers([rootViewController], animated: false)
  }
  
  open override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    guard let v = interactivePopGestureRecognizer else {
      return
    }
    
    guard let x = navigationDrawerController else {
      return
    }
    
    if let l = x.leftPanGesture {
      l.require(toFail: v)
    }
    
    if let r = x.rightPanGesture {
      r.require(toFail: v)
    }
  }
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    prepare()
  }
  
  open override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    guard let v = navigationBar as? NavigationBar else {
      return
    }
    
    guard let item = v.topItem else {
      return
    }
    
    v.layoutNavigationItem(item: item)
  }
  
  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    layoutSubviews()
  }
  
  /**
   Prepares the view instance when intialized. When subclassing,
   it is recommended to override the prepare method
   to initialize property values and other setup operations.
   The super.prepare method should always be called immediately
   when subclassing.
   */
  open func prepare() {
    navigationBar.frame.size.width = view.bounds.width
    navigationBar.heightPreset = .normal
    
    view.clipsToBounds = true
    view.backgroundColor = .white
    view.contentScaleFactor = Screen.scale
    
    // This ensures the panning gesture is available when going back between views.
    if let v = interactivePopGestureRecognizer {
      v.isEnabled = true
      v.delegate = self
    }
  }
  
  /// Calls the layout functions for the view heirarchy.
  open func layoutSubviews() {
    navigationBar.setNeedsUpdateConstraints()
    navigationBar.updateConstraintsIfNeeded()
    navigationBar.setNeedsLayout()
    navigationBar.layoutIfNeeded()
  }
}

extension NavigationController: UINavigationBarDelegate {
  /**
   Delegation method that is called when a new UINavigationItem is about to be pushed.
   This is used to prepare the transitions between UIViewControllers on the stack.
   - Parameter navigationBar: A UINavigationBar that is used in the NavigationController.
   - Parameter item: The UINavigationItem that will be pushed on the stack.
   - Returns: A Boolean value that indicates whether to push the item on to the stack or not.
   True is yes, false is no.
   */
  public func navigationBar(_ navigationBar: UINavigationBar, shouldPush item: UINavigationItem) -> Bool {
    if let v = navigationBar as? NavigationBar {
      if nil == item.backButton.image && nil == item.backButton.title {
        item.backButton.image = v.backButtonImage
      }
      
      if !item.backButton.isHidden {
        item.leftViews.insert(item.backButton, at: 0)
      }
      
      item.backButton.addTarget(self, action: #selector(handle(backButton:)), for: .touchUpInside)
      
      item.hidesBackButton = false
      item.setHidesBackButton(true, animated: false)
      
      v.layoutNavigationItem(item: item)
    }
    
    return true
  }
  
  public func navigationBar(_ navigationBar: UINavigationBar, didPop item: UINavigationItem) {
    if let index = item.leftViews.index(of: item.backButton) {
      item.leftViews.remove(at: index)
    }
    
    item.backButton.removeTarget(self, action: #selector(handle(backButton:)), for: .touchUpInside)
  }
}

internal extension NavigationController {
  /// Handler for the backbutton.
  @objc
  func handle(backButton: UIButton) {
    popViewController(animated: true)
  }
}

extension NavigationController: UIGestureRecognizerDelegate {
  /**
   Detects the gesture recognizer being used. This is necessary when using
   NavigationDrawerController. It eliminates the conflict in panning.
   - Parameter gestureRecognizer: A UIGestureRecognizer to detect.
   - Parameter touch: The UITouch event.
   - Returns: A Boolean of whether to continue the gesture or not, true yes, false no.
   */
  public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    return interactivePopGestureRecognizer == gestureRecognizer && nil != navigationBar.backItem
  }
}
