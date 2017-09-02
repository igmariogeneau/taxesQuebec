//===============================
import UIKit
//===============================
class ViewController: UIViewController, UITextFieldDelegate {
    //------------------------
    @IBOutlet weak var montant: UITextField!
    @IBOutlet weak var affichage: UILabel!
    //------------------------
    var textePourAffichage: String!
    //------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        affichage.numberOfLines = 0
    }
    //------------------------
    @IBAction func calculerTaxes(_ sender: UIButton) {
        if verification() == "true" {
            affichage.text = faireCalcul()
            affichage.sizeToFit()
        } else {
            afficherAlerte(leMessage: verification())
        }
        montant.text = ""
        montant.resignFirstResponder()
    }
    //------------------------
    private func verification() -> String {
        if montant.text == "" {
            return "Veuillez insérer un montant..."
        }
        
        let possibleDeConvertirEnDouble = Double(montant.text!)
        if possibleDeConvertirEnDouble == nil {
            return "Veuillez insérer un montant. Exemple: 12.99"
        }
        
        return "true"
    }
    //------------------------
    private func afficherAlerte(leMessage: String) {
        let alertController = UIAlertController(title: "Message...", message: leMessage, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    //------------------------
    private func faireCalcul() -> String {
    // Doubles
        let leMontant: Double = Double(montant.text!)!
        let tps: Double = leMontant * 0.05
        let tvq: Double = leMontant * 0.09975
        let montantAvecTaxes: Double = leMontant + tps + tvq
    // Strings
        let montantPrecision = String(format: "$%.2f\n", leMontant)
        let tpsPrecision = String(format: "$%.2f\n", tps)
        let tvqPrecision = String(format: "$%.2f\n", tvq)
        let montantAvecTaxesPrecision = String(format: "$%.2f\n", montantAvecTaxes)
    // Concatenation
        textePourAffichage = "MONTANT ORIGINAL : \(montantPrecision)"
        textePourAffichage = textePourAffichage + "LA TPS : \(tpsPrecision)"
        textePourAffichage = textePourAffichage + "LA TVQ : \(tvqPrecision)"
        textePourAffichage = textePourAffichage + "MONTANT AVEC TAXES : \(montantAvecTaxesPrecision)"
    // ----
        affichage.text = ""
        affichage.sizeToFit()
        return textePourAffichage
    }
    //------------------------
}
//===============================















