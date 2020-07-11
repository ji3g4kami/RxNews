//
//  BaseNavigationController.swift
//  RxNews
//
//  Created by 登秝吳 on 11/07/2020.
//  Copyright © 2020 登秝吳. All rights reserved.
//

import UIKit

final class BaseNavigationController: UINavigationController {
  override func viewDidLoad() {
    super.viewDidLoad()
    let navBarAppearance = UINavigationBarAppearance()
    navBarAppearance.configureWithOpaqueBackground()
    navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    navBarAppearance.backgroundColor = UIColor(named: "bgGray")
    navigationBar.standardAppearance = navBarAppearance
    navigationBar.scrollEdgeAppearance = navBarAppearance
  }
}
