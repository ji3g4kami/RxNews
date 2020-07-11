//
//  NewsTableViewController.swift
//  RxNews
//
//  Created by 登秝吳 on 11/07/2020.
//  Copyright © 2020 登秝吳. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class NewsTableViewController: UITableViewController {
  
  private let disposeBag = DisposeBag()
  private var articles = [Article]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 100
    populateNews()
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return articles.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
      fatalError("ArticleTableViewCell does not exists.")
    }
    
    cell.titleLabel.text = self.articles[indexPath.row].title
    cell.desriptionLabel.text = self.articles[indexPath.row].description
    return cell
  }
  
  private func populateNews() {
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=0ce861a79263459cb166c57fe52983ed")!
    let resource = Resource<ArticlesList>(url: url)
    URLRequest.load(resource: resource)
      .subscribe(onNext: { [unowned self] articlelist in
        if let articlelist = articlelist {
          self.articles = articlelist.articles
          DispatchQueue.main.async {
            self.tableView.reloadData()
          }
        }
      })
    .disposed(by: disposeBag)
  }
}
