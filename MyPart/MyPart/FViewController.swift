import UIKit
var data = ["Тренировка 1","Тренировка 2","Тренировка 3"]
var texts = ["Это текст тренировки 1","Это текст тренировки 2","Это текст тренировки 3"]
var curIndex = 0
class FViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var filteredData = [String]()
    var isSearching = false
   

    @IBOutlet weak var tableMain: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: self)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableMain.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableMain.dataSource = self
        tableMain.delegate = self
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func getIndex(str: String) -> Int{
        for i in 0...(data.count-1){
            if data[i] == str{
                return i
            }
        }
        return 0
    }
      
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching == true{
            return filteredData.count
        }else{
            return data.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if isSearching == true{
            cell?.textLabel?.text = filteredData[indexPath.row]
        } else{
            cell?.textLabel?.text = data[indexPath.row]
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        data.remove(at: indexPath.row)
        texts.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        curIndex = getIndex(str: data[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension FViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""{
            filteredData = data.filter({$0.lowercased().uppercased().prefix(searchText.count) == searchText.lowercased().uppercased()})
        }
        isSearching = true
        tableMain.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        tableMain.reloadData()
    }
    
}
