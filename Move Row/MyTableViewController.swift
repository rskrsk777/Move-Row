//
//  ViewController.swift
//  Move Row
//

import UIKit
import RealmSwift

class MyTableViewController: UITableViewController {

    var toyMaker :Results<ToyMakers>?
    var toys: Results<Toy>?
    let sectionTitle = ["Maker", "Toy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))
        setupNavBar()
        setupRealm()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    func setupNavBar () {
        self.navigationItem.title = "Toy Maker"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.setLeftBarButton(editButtonItem, animated: true)
    }
    
    func setupRealm () {
        let realm = try! Realm()
        toyMaker = realm.objects(ToyMakers.self).sorted(byKeyPath: "companyName")
        toys = realm.objects(Toy.self).sorted(byKeyPath: "toyName")
        if toyMaker?.count == 0 {
            let bandai = ToyMakers("バンダイ")
            let bandaiToys = [Toy("ガンダム"), Toy("たまごっち"), Toy("デジモン")]
            bandai.toys.append(objectsIn: bandaiToys)
            let konami = ToyMakers("コナミ")
            let konamiToys = [Toy("遊戯王"), Toy("パワプロ")]
            konami.toys.append(objectsIn: konamiToys)
            let nintendo = ToyMakers("任天堂")
            let nintendoToys = [Toy("Mario"), Toy("ドンキーコング"), Toy("ゼルダの伝説")]
            nintendo.toys.append(objectsIn: nintendoToys)
            let takara = ToyMakers("タカラトミー")
            let takaraToys = [Toy("ゾイド"), Toy("チョロQ"), Toy("ベイブレード")]
            takara.toys.append(objectsIn: takaraToys)
            realm.beginWrite()
            realm.add([bandai, konami, nintendo, takara])
            try! realm.commitWrite()
            
        }
        

    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.isEditing = editing
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return toyMaker?.count ?? 0
        } else {
            return toys?.count ?? 0
        }

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        if indexPath.section == 0 {
            guard let maker = toyMaker?[indexPath.row] else { return cell }
            cell.textLabel?.text = maker.companyName
            cell.detailTextLabel?.text = "\(maker.toys.count) toys"
            return cell
        } else {
            guard let toy = toys?[indexPath.row] else { return cell }
            cell.textLabel?.text = toy.toyName
            cell.detailTextLabel?.text = toy.maker.first?.companyName
            return cell
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
}

