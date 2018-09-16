//
//  ViewController.swift
//  jiexiDemo
//
//  Created by 苏文潇 on 2018/9/12.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        setUI()
        setList()
    }

//    SCIndexViewConfiguration *indexViewConfiguration = [SCIndexViewConfiguration configuration];
//    SCIndexView *indexView = [[SCIndexView alloc] initWithTableView:self.tableView configuration:indexViewConfiguration];
//    indexView.translucentForTableViewInNavigationBar = self.translucent;
//    [self.view addSubview:indexView];
//    indexView.dataSource = indexViewDataSource;
    
    private func setList(){
        let indexViewConfiguration = SCIndexViewConfiguration.init(indexViewStyle: SCIndexViewStyle.default)
        let indexView = SCIndexView.init(tableView: self.tabaleview, configuration: indexViewConfiguration)
        
        self.view.addSubview(indexView!)
        indexView?.dataSource = self.titleArr
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    var tabaleview: UITableView!
    
    private func setUI(){
        self.tabaleview = UITableView.init(frame: CGRect.zero, style: UITableViewStyle.plain)
        view.addSubview(tabaleview)
        tabaleview.frame = self.view.frame
        tabaleview.dataSource = self
        tabaleview.delegate = self
        tabaleview.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cellId")
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.demoArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.demoArr[section].cars?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let carM:[carM] = self.demoArr[indexPath.section].cars!
        cell.textLabel?.text = carM[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.demoArr[section].title
    }

    var listArr: [String] = [String]()
    var demoArr:[titleM] = [titleM]()
    var titleArr: [String] = ["#"]
    private func loadData(){
        let url = Bundle.main.url(forResource: "cars_total.plist", withExtension: nil)
        let arr = NSArray.init(contentsOf: url!)
        
        for value in arr!{
            let dic: [String: Any] = value as! [String : Any]
            let model = titleM(JSON: dic)!
            self.demoArr.append(model)
            self.titleArr.append(model.title ?? "")
            self.listArr.append(model.title ?? "")
        }
    }
    
    deinit {
        print("销毁....🌶🌶🌶🌶", self)
    }
    
}













