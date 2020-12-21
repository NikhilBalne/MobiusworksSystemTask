//
//  ProductsViewController.swift
//  MobiusworksSystemTask
//
//  Created by Nikhil Balne on 21/12/20.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    var newsTableData : [Article]? = nil
    let newsViewModel : NewsViewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        getNews()
    }

    // MARK: - Get Products
    private func getNews(){
                
        newsViewModel.getNews { (products,error,httpUrlResponse) in
            
//            if error == nil {
////                print("Error is nil")
//            } else {
////                print("Error:\(error)")
//            }
            
            if httpUrlResponse?.statusCode == 200 {
                self.newsTableData = products?.articles
            } else {
                DispatchQueue.main.async {
                    
                    self.openAlert(title: "Error", message: "Unable to Fetch", alertStyle: .alert, actionTitles: ["Ok","Cancel"], actionStyles: [.default,.cancel], actions: [
                        {_ in
                            print("okay click")
                        },
                        {_ in
                            print("cancel click")
                        }
                    ])
                    
                }
                
            }
        
            DispatchQueue.main.async {
                self.hideActivityIndicator()
                self.newsTableView.reloadData()
            }
        }
        
    }
    
}

// MARK: - News TableView Delegate and DataSource Methods
extension NewsViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = (tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell)!
        let objProduct = newsTableData?[indexPath.row]
        if let objProduct = objProduct {
            newsCell.setNewsCellDetails(newsArticle: objProduct)
        }
        
        return newsCell
    }
        
}

extension UIViewController{

    // Global Alert
    // Define Your number of buttons, styles and completion
    public func openAlert(title: String,
                          message: String,
                          alertStyle:UIAlertController.Style,
                          actionTitles:[String],
                          actionStyles:[UIAlertAction.Style],
                          actions: [((UIAlertAction) -> Void)]){

        let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        for(index, indexTitle) in actionTitles.enumerated(){
            let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions[index])
            alertController.addAction(action)
        }
        self.present(alertController, animated: true)
    }
}
