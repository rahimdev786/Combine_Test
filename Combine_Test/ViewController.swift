//
//  ViewController.swift
//  Combine_Test
//
//  Created by arshad on 4/27/22.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var Table1:UITableView!
    
    var refresh = UIRefreshControl()
    var arrayData = [String]()
    var obserable:AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        Table1.register(TableViewCell.TableViewCellNib, forCellReuseIdentifier: TableViewCell.TableViewCellIdentifier)
        refresh.attributedTitle = NSAttributedString(string: "Loading data", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15, weight: .regular)])
        
        refresh.addTarget(self, action: #selector(methodOne), for: .valueChanged)
        Table1.addSubview(refresh)
        
    }
    
    
    @objc func methodOne(){
        refresh.tintColor = .red
        refresh.beginRefreshing()
        DispatchQueue.main.async { [weak self] in
            self?.Table1.reloadData()
        }
        refresh.endRefreshing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.callCombine()
    }
    
    private func callCombine(){
        obserable = CombineCall.shared.apiCall()
            .receive(on:DispatchQueue.main)
            .sink(receiveCompletion: { completion in
            switch completion{
            case .failure(let err):
                print(err.localizedDescription)
            case .finished:
                print("values are updates")
            }
            
        }, receiveValue: { [weak self]  values in
            self?.arrayData = values
            self?.Table1.reloadData()
        })
    }
}


extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Table1.dequeueReusableCell(withIdentifier: TableViewCell.TableViewCellIdentifier, for: indexPath) as! TableViewCell
        
        cell.textLabel?.text = arrayData[indexPath.row]
        return cell
    }
}

extension ViewController:UITableViewDelegate{
    
}
