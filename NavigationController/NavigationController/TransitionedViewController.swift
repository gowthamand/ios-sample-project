
//  Created by Gowthaman on 12/04/18.
//  Copyright © 2018 Gowthaman All rights reserved.

import UIKit
import Material

class TransitionedViewController: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.blueGrey.base
        prepareNavigationItem()
    }
}

extension TransitionedViewController {
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "Profile"
    }
}


