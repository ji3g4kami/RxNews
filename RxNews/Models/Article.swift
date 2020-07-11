//
//  Article.swift
//  RxNews
//
//  Created by 登秝吳 on 11/07/2020.
//  Copyright © 2020 登秝吳. All rights reserved.
//

import Foundation

struct Article: Decodable {
  let title: String
  let description: String?
}

struct ArticlesList: Decodable {
  let articles: [Article]
}
