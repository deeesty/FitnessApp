import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var trainingsTableView: UITableView!
    var trainings: [Training] = [Training]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTrainings()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomCell else { return UITableViewCell() }
        let training = trainings[indexPath.row]
        cell.trainingName.text = training.name
        cell.trainingImage.image = UIImage(named: training.trainingImageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 157
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }

    func loadTrainings(){
        var training1 = Training(name: "t1", description: "t1", trainingImageName: "img1")
        var training2 = Training(name: "t2", description: "t2", trainingImageName: "img2")
        var training3 = Training(name: "t3", description: "t3", trainingImageName: "img1")
        var training4 = Training(name: "t4", description: "t4", trainingImageName: "img2")
        var training5 = Training(name: "t5", description: "t5", trainingImageName: "img1")
        var training6 = Training(name: "t6", description: "t6", trainingImageName: "img2")
        trainings.append(training1)
        trainings.append(training2)
        trainings.append(training3)
        trainings.append(training4)
        trainings.append(training5)
        trainings.append(training6)
    }
}

