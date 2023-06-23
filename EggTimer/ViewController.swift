import UIKit

// Necesitamos hacer un import para las clases que controlan el audio y el video
import AVFoundation

class ViewController: UIViewController {
    
    // Creamos el objeto para poder acceder a los métodos de la biblioteca de audio y video.
    var player: AVAudioPlayer!
    
    // Conexión con la etiqueta que nos va a permitir mandar el mensaje cuando el huevo esté listo.
    @IBOutlet weak var messageLabel: UILabel!
    
    // Conexión con la barra de progreso de la interfaz.
    @IBOutlet weak var progressBar: UIProgressView!
    
    // Creamos un diccionario para las variables de tiempo que tenemos arriba, con datos de distinto tipo.
    let eggTimes: [String: Int] = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    // Variables gloables del ViewController que nos servirán para trabajar con el tiempo de la barra de progreso.
    var totalTime = 0
    var secondsPassed = 0
    var type = " "
    
    // Creamos un objeto de tipo Timer que usaremos para cada vez que iniciemos el temporizador
    var timer = Timer()
    
    // La solución más eficiente, propuesta por Angela.
    @IBAction func angelaSolution(_ sender: UIButton) {
        // Cancelamos cualquier temporizador que esté activo en el momento de llamar a esta función.
        timer.invalidate()
        // Obtenemos el nombre del botón que activó esta función.
        let hardness = sender.currentTitle!  // Soft, Medium, Hard
        type = hardness // Actualizamos el valor de la variable type.
        // Inicializamos el valor de los segundos que va a contar el temporizador, de acuerdo al diccionario que creamos en la línea 6 y reiniciamos el conteo.
        totalTime = eggTimes[hardness]!
        secondsPassed = 0
        // Sintaxis del temporizador, en donde lo más importante es el selector que debe tener una @objc func para que realice su trabajo.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // Función en objective C que será llamada cada segundo por el selector del timer
    @objc func updateTimer() {
        // Actualización de la barra de progreso
        progressBar.progress = Float(secondsPassed)/Float(totalTime)
        if secondsPassed < totalTime {
            // Actualizamos el texto de la etiqueta para mostrar la selección de hardness
            messageLabel.text = "Selected: \(type) eggs"
            print("\(secondsPassed) seconds.")
            secondsPassed += 1
        }
        else {
            if(secondsPassed == totalTime) {
                print("\(totalTime) seconds.")
                playSound(name: "alarm_sound")
            }
            messageLabel.text = "Done"
            secondsPassed += 1
            if (secondsPassed == totalTime + 5) {
                timer.invalidate() // Detenemos el temporizador.
                // Reiniciamos el mensaje de la etiqueta de la aplicación:
                messageLabel.text = "How do you like your eggs?"
            }
        }
    }
    
    // Función necesaria para reproducir sonidos:
    func playSound(name: String) {
        let url = Bundle.main.url(forResource: name, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}


/* Notas:
    Hay una advertencia que aparece cuando creamos una variable que no utilizamos para nada, y nos sugiere cambiarla por un guión bajo _ para que nosotros, y otras personas, entendamos el código más rápidamente. Esto es especialmente útil en estructuras repetitivas en donde no utilizamos el valor de la variable iterativa.
*/


/* Funciones creadas para practicar:
 
 // Creamos variables para el tiempo en (minutos) que tardan en estar listos los huevos cocidos.
 let softTime = 5
 let mediumTime = 7
 let hardTime = 12
 
 /* Para conectar múltiples botones a un mismo IBAction, dejamos presionada la tecla control normal, y la movemos al bloque de código de la IBAction, o simplemente arrastramos desde el círculo de la IBAction al botón que queremos agregar, sin presionar ninguna tecla. */
 @IBAction func hardnessSelected(_ sender: UIButton) {
     // Imprimimos el título del botón que fue presionado: print(sender.currentTitle!)
     let hardness = sender.currentTitle!
     // Imprimimos el valor del tiempo de cada botón dependiendo de cuál fue presionado con una estructura if-else
     if hardness == "Soft" {
         print(softTime)
     }
     else if hardness == "Medium" {
         print(mediumTime)
     }
     else {
         print(hardTime)
     }
 }
 
 
 // Creamos un diccionario para las variables de tiempo que tenemos arriba, con datos de distinto tipo.
 let eggTimes: [String: Int] = ["Soft": 5*60, "Medium": 7*60, "Hard": 12*60]
 
 // Ahora creamos la misma función para los botones, pero usando el diccionario y una estructura switch.
 @IBAction func hardnessButton(_ sender: UIButton) {
     let hardness = sender.currentTitle!
     switch(hardness) {
         case "Soft":
             print(eggTimes["Soft"]!) // Cuando obtenemos el valor de una llave en un diccionario, obtenemos un valor optional.
         case "Medium":
             print(eggTimes["Medium"]!)
         case "Hard":
             print(eggTimes["Hard"]!)
         default:
             print("Error")
     }
 }
 
 
 */
