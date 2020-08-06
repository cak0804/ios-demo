//
//  ViewController.swift
//  7-29-project-controller
//
//  Created by bytedance on 7/29/20.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ThirtyDayCell
//        cell.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.3)
        cell.backgroundColor = UIColor.red
//        cell.backgroundColor = UIColor.red
//        cell.dayLabel.text = "day \(indexPath.row+1)"
//        cell.cellView.addInteraction(<#T##interaction: UIInteraction##UIInteraction#>)
        
//        let button = UIButton(frame: CGRect(x: 100, y: 60, width: 40, height: 30))
//        button.backgroundColor = UIColor.black
//        button.setTitle("click", for: .normal)
//        button.addTarget(self, action: #selector(changeLabel), for: UIControl.Event.allEvents)
//        cell.addSubview(button)
//        cell.button.layer.zPosition = 2
//        cell.dayLabel.layer.zPosition = 1
////        print(cell.button.layer.zPosition)
////        print(cell.dayLabel.layer.zPosition)
//
////        cell.accessoryView = button
        
//        let button: UIButton = {
//            let b = UIButton()
//            b.backgroundColor = UIColor(red: 0.3, green: 0.8, blue: 0.7, alpha: 0.8)
//            b.setTitle("GOOD DAY?", for: .normal)
//            b.translatesAutoresizingMaskIntoConstraints = false
//            b.addTarget(self, action: #selector(changeLabel), for: UIControl)
//
//            return b
//        }()
        
//        cell.addSubview(button)
//        button.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
//        button.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 10).isActive = true
//        button.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: 0).isActive = true
//       button.leftAnchor.constraint(equalTo: cell.dayLabel.rightAnchor, constant: 20).isActive = true
//
//        func changeLabel(){
//            print(cell.dayLabel.text)
//        }
        
    
        
//        print(cell.button.isUserInteractionEnabled)
//        cell.button.addTarget(self, action: #selector(changeLabel), for: UIControl.Event.allEvents)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
//        let cell = tableview.cellForRow(at: indexPath)
//        print(cell)
        let cell = tableview.cellForRow(at: indexPath)
//        cell.cellView.backgroundColor = UIColor.red
//        cell.dayLabel.text = "clicked"
        cell?.backgroundColor = UIColor.black
        gotonext()
    }
    
//    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        let cell = tableview.cellForRow(at: indexPath)
////        cell.cellView.backgroundColor = UIColor.red
////        cell.dayLabel.text = "clicked"
//        cell?.backgroundColor = UIColor.yellow
////        gotonext()
//        return indexPath
//    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    let tableview: UITableView = {
        let tv = UITableView()
//        tv.backgroundColor = UIColor.red
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorColor = UIColor.white
        return tv
    }()
    
    var button: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.black
        button.setTitle("test", for: .normal)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        button.addTarget(self, action: #selector(gotonext), for: UIControl.Event.touchUpInside)
        
        setupTableView()
    }
    
    func setupTableView(){
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(ThirtyDayCell.self, forCellReuseIdentifier: "cellId")
        view.addSubview(tableview)
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.button.bottomAnchor,constant: 10),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    @objc func gotonext(){
        let nextview = hellocontroller()
        self.navigationController?.pushViewController(nextview, animated: true)
    }
    
    @objc func changeLabel()
    {
        print("click")
//        switch self.dayLabel.text {
//        case "Today is a good day!":
//            self.dayLabel.text = "Today is not a good day T^T"
//        case "Today is not a good day T^T":
//            self.dayLabel.text = "Today is a good day!"
//        default:
//            self.dayLabel.text = "Today is a good day!"
//        }
//        print(self.dayLabel.text!)
    }
    
        }


class ThirtyDayCell: UITableViewCell{
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.3, green: 0.4, blue: 0.5, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dayLabel: UILabel = {
       let label = UILabel()
//        label.text = "day1"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let button: UIButton = {
        let b = UIButton()
        b.backgroundColor = UIColor(red: 0.3, green: 0.8, blue: 0.7, alpha: 0.8)
        b.setTitle("GOOD DAY?", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
//        b.addTarget(ViewController.self, action: #selector(addLabel), for: UIControl.Event.allEvents)
        return b
    }()

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseidentifier: String?){
        super.init(style:style,reuseIdentifier: reuseidentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(cellView)
//        cellView.addSubview(dayLabel)
////        cellView.addSubview(button)
////        button.layer.cornerRadius = cellView.layer.cornerRadius
//
        self.selectionStyle = .none
        NSLayoutConstraint.activate([
               cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
               cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
               cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
               cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
           ])
//        dayLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        dayLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        dayLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
//        dayLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
//
//        button.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 0).isActive = true
//        button.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: 0).isActive = true
//        button.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: 0).isActive = true
//        button.leftAnchor.constraint(equalTo: dayLabel.rightAnchor, constant: 20).isActive = true
        
       
        
        
    }
    @objc func addLabel(){
        print("here")
        switch self.dayLabel.text {
        case "Today is a good day!":
            self.dayLabel.text = "Today is not a good day T^T"
        case "Today is not a good day T^T":
            self.dayLabel.text = "Today is a good day!"
        default:
            self.dayLabel.text = "Today is a good day!"
        }
//        print(self.dayLabel.text!)
    }
}


