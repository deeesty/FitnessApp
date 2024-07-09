import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var trainingsTableView: UITableView!
    @IBOutlet weak var inbuiltTrainingSearch: UISearchBar!
    
    var trainings: [Training] = [Training]()
    var filteredTrainings: [Training] = [Training]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inbuiltTrainingSearch.delegate = self
        self.loadTrainings()
        inbuiltTrainingSearch.placeholder = "Найти тренировку"
        filteredTrainings = trainings
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTrainings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomCell else { return UITableViewCell() }
        let training = filteredTrainings[indexPath.row]
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
        var training1 = Training(name: "Тренировка на мышцы ног - начальный уровень", description: "Перед началом тренировки необходимо провести разминку:\n\n5 минут кардио (бег, прыжки, велотренажер)\n5 минут динамических растяжек (вращения плеч, рук, туловища)\n\nПрограмма тренировки:\n1) Приседания:  3 сета по 8-12 повторений (с весом или без).\n2) Выпады: 3 сета по 10-15 повторений на каждую ногу (с весом или без).\n3) Жим ногами: 3 сета по 10-15 повторений.\n4) Сгибание ног лежа: 3 сета по 12-15 повторений.\n\nЗаминка:\nСтатическая растяжка мышц ног, бедер, ягодиц (5-10 минут)", trainingImageName: "img1")
        var training2 = Training(name: "Тренировка на мышцы ног - продвинутый уровень", description: "Перед началом тренировки необходимо провести разминку:\n\nКардио (5-10 минут): легкий бег, прыжки на месте, велосипед\nРастяжка (5 минут): динамическая растяжка мышц ног, бедер, ягодиц\n\nПрограмма тренировки:\n1) Становая тяга: 3 сета по 5-8 повторений.\n2) Румынская тяга: 3 сета по 10-15 повторений.\nПодъёмы на носки: 3 сета по 8-12 повторений (с весом или без).\n\nЗаминка:\nСтатическая растяжка мышц ног, бедер, ягодиц (5-10 минут).", trainingImageName: "img1")
        var training3 = Training(name: "Тренировка на грудные мышцы - начальный уровень", description: "Перед началом тренировки необходимо провести разминку:\n\n5 минут кардио (ходьба, бег трусцой, велотренажер)\n5 минут динамических растяжек (вращения плеч, рук, туловища)\n\nПрограмма тренировки:\n1) Жим гантелей лежа: 3 сета по 10-12 повторений.\n2) Отжимания от пола: 3 сета по максимуму повторений.\n3) Разводка гантелей лежа: 3 сета по 12-15 повторений.\n4) Жим штанги на наклонной скамье (легкий вес): 3 сета по 10-12 повторений.\n5) Сведение рук в тренажере: 3 сета по 15-20 повторений.\n\nЗаминка:\n5 минут статических растяжек (удержание груди, плеч, трицепсов)", trainingImageName: "img2")
        var training4 = Training(name: "Тренировка на грудные мышцы - продвинутый уровень", description: "Перед началом тренировки необходимо провести разминку:\n\n5 минут кардио (бег, прыжки, велотренажер)\n5 минут динамических растяжек (вращения плеч, рук, туловища)\n\nПрограмма тренировки:\n1) Жим штанги лежа: 4 сета по 8-12 повторений.\n2) Жим гантелей лежа: 3 сета по 10-12 повторений.\n3) Отжимания на брусьях: 3 сета по максимуму повторений.\n4) Разводка гантелей лежа: 3 сета по 12-15 повторений.\n5) Жим штанги на наклонной скамье: 3 сета по 8-12 повторений.\n\nЗаминка:\n5 минут статических растяжек (удержание груди, плеч, трицепсов)", trainingImageName: "img2")
        var training5 = Training(name: "Тренировка на мышцы спины - начальный уровень", description: "Перед началом тренировки необходимо провести разминку:\n\n5 минут кардио (ходьба, бег трусцой, велотренажер)\n5 минут динамических растяжек (вращения плеч, рук, туловища)\n\nПрограмма тренировки:\n1) Тяга гантелей в наклоне: 3 сета по 10-12 повторений.\n2) Подтягивания на турнике с помощью резинки: 3 сета по максимуму повторений.\n3) Становая тяга с собственным весом: 3 сета по 10-12 повторений.\n4) Тяга верхнего блока: 3 сета по 10-12 повторений.\n5) Гиперэкстензия: 3 сета по 15-20 повторений.\n\nЗаминка:\n5 минут статических растяжек (удержание спины, грудной клетки, плеч)", trainingImageName: "img3")
        var training6 = Training(name: "Тренировка на мышцы спины - продвинутый уровень", description: "Перед началом тренировки необходимо провести разминку:\n\n5 минут кардио (бег, прыжки, велотренажер)\n5 минут динамических растяжек (вращения плеч, рук, туловища)\n\nПрограмма тренировки:\n1) Тяга штанги в наклоне: 4 сета по 8-12 повторений.\n2) Подтягивания на турнике: 4 сета по максимуму повторений.\n3) Становая тяга: 3 сета по 5-8 повторений.\n4) Тяга гантелей в наклоне: 3 сета по 10-12 повторений.\n5) Пуловер с гантелей: 3 сета по 12-15 повторений.\n\nЗаминка:\n5 минут статических растяжек (удержание спины, грудной клетки, плеч)", trainingImageName: "img3")
        trainings.append(training1)
        trainings.append(training2)
        trainings.append(training3)
        trainings.append(training4)
        trainings.append(training5)
        trainings.append(training6)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let training = filteredTrainings[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        var infoViewController: InfoViewController = self.storyboard!.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
        infoViewController.nameString = training.name
        infoViewController.infoTextString = training.description
        infoViewController.infoImageText = training.trainingImageName
        
        self.present(infoViewController, animated: true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredTrainings = trainings
        } else {
            filteredTrainings = trainings.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        trainingsTableView.reloadData()
    }
}

