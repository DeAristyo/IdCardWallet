//
//  ContactList.swift
//  IdCardWallet
//
//  Created by Auliya Michelle Adhana on 26/07/23.
//

import UIKit
import CoreData

class PeopleList: UIViewController {
    
//    let people: [String: [String]] = [
//        "A": ["Anya","Ana", "Akaka"],
//        "B": ["Budi", "Bima", "Bia", "Billa"],
//        "G": ["Gorila","Gaga"]
//    ]
//
//    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    
    var navigationBarAppearace = UINavigationBarAppearance()
    var searchController = UISearchController(searchResultsController: nil)
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(named: "BackgroundColor")
        tableView.register(CustomTableCell.self, forCellReuseIdentifier: CustomTableCell.identifier)
        return tableView
    }()
    
    var models = [Group]()
    
    var personListData = [PersonData]()
    
//    func setupData() {
//        for (key, value) in people {
//            models.append(.init (title: key, people: value))
//        }
//        models = models.sorted(by: { $0.title < $1.title })
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setupData()
        
        searchController.searchBar.searchTextField.backgroundColor = .white
        
        navigationBarAppearace.configureWithOpaqueBackground()
        navigationBarAppearace.backgroundColor = UIColor(named: "PrimaryColor")
        navigationBarAppearace.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearace.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationItem.title = "People"
        navigationController?.navigationBar.standardAppearance = navigationBarAppearace;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "plusIcon"), style: .plain, target: self, action: #selector(addPersonFunc))
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.searchController = searchController
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        self.getPeopleList()
    }
    
    func getPeopleList() {
        let personDataFetch: NSFetchRequest<PersonData> = PersonData.fetchRequest()
     //   let sortByDate = NSSortDescriptor(key: #keyPath(PersonDetail.dateAdded), ascending: false)
     //   personDataFetch.sortDescriptors = [sortByDate]
        do {
            let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try managedContext.fetch(personDataFetch)
            personListData = results
            
            print("person list", personListData)
            debugPrint(personListData)
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc private func addPersonFunc()  {
        let navigate = UIStoryboard(name: "AddPersonView", bundle: nil).instantiateInitialViewController()
        
        print(navigate)
        navigationController?.pushViewController(navigate!, animated: true)
        print("Modal opened")
    }
}

extension PeopleList: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailPersonViewController()
        vc.getPeopleList(fullName: personListData[indexPath.row].fullName ?? "test")
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return models.count
//    }
    
//    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return Array(alphabet.uppercased()).compactMap({"\($0)"})
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return models[section].people.count
        print(personListData.count)
        return (personListData.count - 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableCell.identifier, for: indexPath) as! CustomTableCell
        
        cell.setupLayout(isCheckboxVisible: false)
        cell.checkBox.isHidden = true
        cell.backgroundColor = UIColor(named: "BackgroundColor")
        
        
       // let name = models[indexPath.section].people[indexPath.row]
        cell.setupView(titleName: personListData[indexPath.row].fullName ?? "" , subtitleName: personListData[indexPath.row].occupation ?? "" )
        
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return models[section].title
//    }
    
//    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
//        guard let targetIndex = models.firstIndex(where: { $0.title ==  title}) else { return 0 }
//
//        return targetIndex
//    }
    
}
