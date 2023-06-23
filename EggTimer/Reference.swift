/* Reference.swift --> EggTimer. Created by Miguel Torres on 23/06/23. */

/* Programa completo, solamente tenemos 5 elementos en nuestra interfaz que controlamos desde el ViewController: 3 botones de selección, 1 etiqueta que muestra mensajes al usuario y una barra de progreso para visualizar el tiempo restante.
   Se estudió el uso de la palabra reservada "try" con sus respectivas maneras seguras de utilizarse, pero también hay que agregarle lógica a nuestro código y ser eficientes en el uso del manejo de errores y evitar caer en precausiones en exceso. Si ya verificamos que el valor de la variable "url" no es nulo, y brincamos la barrera del guard, no es necesario agregar precauciones adicionales con la palabra reservada try, pues ya podemos estar seguros de que no habrá problema.
 
 - - - - - El código es el siguiente: - - - - -
 

import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes: [String: Int] = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var player: AVAudioPlayer!
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0
    var type = ""
    
    @IBAction func typeSelected(_ sender: UIButton) {
        timer.invalidate()
        if let hardness = sender.currentTitle {
            type = hardness
            totalTime = eggTimes[type] ?? 1
            secondsPassed = 0
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        } else {
            print("Button doesn't have a title.")
        }
    }
    
    @objc func updateTimer() {
        progressBar.progress = Float(secondsPassed)/Float(totalTime)
        if secondsPassed < totalTime {
            messageLabel.text = "Selected: \(type) eggs"
            secondsPassed += 1
        } else {
            if secondsPassed == totalTime {
                playSound("alarm_sound")
            }
            messageLabel.text = "Done"
            secondsPassed += 1
            if secondsPassed == totalTime + 5 {
                timer.invalidate()
                messageLabel.text = "How do you like your eggs?"
            }
        }
    }
    
    func playSound(_ name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("Audio file not found.")
        }
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}

*/
