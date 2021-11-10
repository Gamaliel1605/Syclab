//
//  GravityPopoverViewController.swift
//  syclab
//
//  inspired from Nicholas and adapted by Kane on 26/10/21.
//

import UIKit

enum Planet: String {
    case earth = "Bumi"
    case moon = "Bulan"
    case mars = "Mars"
    case jupiter = "Jupiter"
    
    func getGravityValue() -> Double {
        switch self {
        case .earth:
            return 10
        case .moon:
            return 2
        case .mars:
            return 4
        case .jupiter:
            return 25
        }
    }
}

class GravityPopoverViewController: UITableViewController {
    let chosenPlanet: Planet? = nil
    let planets: [Planet] = [.earth, .moon, .mars, .jupiter]
    var delegate: GravityPopoverDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return planets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let planet = planets[indexPath.row]
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.textLabel?.text = planet.rawValue
        cell.detailTextLabel?.text = "\(planet.getGravityValue()) m/s²"
        cell.accessoryType = .none
        cell.backgroundColor = UIColor.bgColorTypo
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Chosen planet: \(planets[indexPath.row])")
        self.delegate?.chooseGravity(chosenValue: self.planets[indexPath.row])
        print(self.planets[indexPath.row])
        self.dismiss(animated: true)
    }
}

protocol GravityPopoverDelegate: AnyObject {
    func chooseGravity(chosenValue planet: Planet)
}

