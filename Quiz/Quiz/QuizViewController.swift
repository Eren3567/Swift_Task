//
//  QuizViewController.swift
//  Quiz
//
//  Created by Eren Çetintaş on 9.02.2024.
//

import UIKit
import Firebase
import FirebaseFirestore
import AVFAudio
class QuizViewController: UIViewController {
    var documentIDs: [String] = []
    var documentId = ""
    var username = ViewController().usernameText
    @IBOutlet weak var AnswerC: UILabel!
    
    @IBOutlet weak var AnswerD: UILabel!
    @IBOutlet weak var AnswerB: UILabel!
    @IBOutlet weak var AnswerA: UILabel!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var QuestionLabel: UILabel!
    let userID = Auth.auth().currentUser?.uid
    var questionText = ""
    var answers = [String]()
    var correctAnswer: String?
    var score = 0
    var currentScore = 0
    var currentQuestionIndex = 0
    var questions: [String] = []
    var currentDocumentIndex = 0
    var allQuestionsAnswered = false
    var idDocument = [QueryDocumentSnapshot]()
    var usedDocumentIDs: [String] = []
    var correctSoundPlayer: AVAudioPlayer?
    var wrongSoundPlayer: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
              
              // Arka plan görüntüsünü ayarlayın
              backgroundImage.image = UIImage(named: "Sorular")
              
              // Görüntünün arka planda görünmesini sağlayın
              backgroundImage.contentMode = .scaleAspectFill
              
              // Görüntüyü arka plana ekleyin
              self.view.insertSubview(backgroundImage, at: 0)
        loadSounds()
        fetchDocumentIDs()
        
        newFetchQuestion ()
        updateScore3()
        // Kullanıcının oturum açıp açılmadığını kontrol et
        if let _ = Auth.auth().currentUser {
            // Kullanıcı oturum açık ise skorları kaydet
            saveScoreToFirestore()
        }
        
        
        QuestionLabel.adjustsFontSizeToFitWidth = true
        QuestionLabel.minimumScaleFactor = 0.5
        // Kullanıcı oturum açtıysa Firestore'a kullanıcı kimliğini ekle ve doğru cevabı al
        //   if let userID = Auth.auth().currentUser?.uid {
        //      addUserIDToFirestore(userID: userID)
        //      // fetchCorrect(forUserID: userID)
        //     } else {
        //       print("Oturum açmış bir kullanıcı yok.")
        //      }
        
        
        // Her UILabel'a bir UITapGestureRecognizer ekle
        
        AnswerA.isUserInteractionEnabled = true
        AnswerB.isUserInteractionEnabled = true
        AnswerC.isUserInteractionEnabled = true
        AnswerD.isUserInteractionEnabled = true
        
        AnswerA.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(answerTapped)))
        AnswerB.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(answerTapped)))
        AnswerC.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(answerTapped)))
        AnswerD.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(answerTapped)))
        
        // Cevap etiketlerinin arka plan rengini sıfırla
        AnswerA.backgroundColor = .clear
        AnswerB.backgroundColor = .clear
        AnswerC.backgroundColor = .clear
        AnswerD.backgroundColor = .clear
    }
    
    
    // Firestore veritabanına referans oluştur
    let db = Firestore.firestore()
    
    /*
     func addUserIDToFirestore(userID: String) {
     let db = Firestore.firestore()
     
     
     let userDocRef = db.collection("users").document(userID)
     
     // Belgeyi oluştur veya güncelle
     userDocRef.setData(["userID": userID]) { error in
     if let error = error {
     print("Kullanıcı kimliği Firestore'a eklenirken hata oluştu: \(error.localizedDescription)")
     } else {
     print("Kullanıcı kimliği Firestore'a başarıyla eklendi.")
     }
     }
     }
     */
    
    @objc func answerTapped(_ sender: UITapGestureRecognizer) {
        guard let label = sender.view as? UILabel else { return }
        
        // Tüm sorular yanıtlandıysa işlemi durdur
        if allQuestionsAnswered {
            return
        }
        
        let selectedAnswer = label.text ?? ""
        
        if selectedAnswer == correctAnswer {
            label.backgroundColor = .green
            correctSoundPlayer?.play()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                label.backgroundColor = .clear
                
                fetchNextDocument()
                updateScore()
                
                if allQuestionsAnswered {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                self.performSegue(withIdentifier: "toFinished", sender: nil)
                            }
                    
                }
            }
        } else {
            label.backgroundColor = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                updateScore2()
                wrongSoundPlayer?.play()
                label.backgroundColor = .clear
            }
        }
    }
    
    
    
    
    // score calculate
    func updateScore() {
        
        currentScore += 5 // Her doğru cevapta puanı 5 artır
        
        
        checkAndSaveScore()
        ScoreLabel.text = "Correct Answer - Your Score: \(currentScore)" // Skor etiketine güncel puanı yaz
    }
    
    func updateScore2() {
        currentScore -= 2 // Her yanlış cevapta puanı 2 azaltır
        checkAndSaveScore()
        ScoreLabel.text = "Correct Answer - Your Score: \(currentScore)" // Skor etiketine güncel puanı yaz
    }
    // Başlangıç Skoru
    func updateScore3() {
        currentScore = 0 // Her yanlış cevapta puanı 2 azaltır
        ScoreLabel.text = "Correct Answer - Your Score: \(currentScore)" // Skor etiketine güncel puanı yaz
    }
    func checkAndSaveScore() {
        // Tüm soruları yanıtladıysak, skorları Firestore'a kaydet
        if allQuestionsAnswered {
            saveScoreToFirestore()
        }
    }
    
    func fetchNextDocument() {
        currentDocumentIndex += 1
        
        if currentDocumentIndex >= idDocument.count {
            allQuestionsAnswered = true // Tüm sorular yanıtlandı
            return
        }
        
        newFetchQuestion()
    }
    
    
    
    func newFetchQuestion() {
        // Mevcut belgenin index'ini arttır
        currentDocumentIndex += 1
        
        // Firestore'dan belgeleri alma işlemi
        db.collection("Question").getDocuments { [self] (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error.localizedDescription)")
            } else {
                // querySnapshot'taki belgelerin sayısını kontrol et
                guard let documents = querySnapshot?.documents else {
                    print("No documents found")
                    return
                }
                
                // Mevcut belge index'i belgelerin sayısından büyükse, işlemi sonlandır
                if currentDocumentIndex >= documents.count {
                    print("Tüm belgeler işlendi")
                    return
                }
                
                // Belge dizininden belgeyi al
                let document = documents[currentDocumentIndex]
                
                // Belge verilerini işle
                let data = document.data()
                questionText = data["questionLabel"] as? String ?? ""
                answers = data["answers"] as? [String] ?? []
                correctAnswer = data["correctAnswer"] as? String ?? ""
                
                // Label veri atama
                atama()
            }
        }
    }
    
    
    func atama() {
        DispatchQueue.main.async {
            
            
            self.QuestionLabel.text = self.questionText
        }
        
        
        // Cevapları uygun UILabel'lara atama
        if answers.count >= 4 {
            DispatchQueue.main.async {
                
                
                
                self.AnswerA.text = self.answers[0]
                self.AnswerB.text = self.answers[1]
                self.AnswerC.text = self.answers[2]
                self.AnswerD.text = self.answers[3]
                
                
            }
            
            
            
        } else {
            print("Sorunun cevapları eksik veya hatalı.")
        }
        
    }
    
    
    func fetchDocumentIDs() {
        db.collection("Question").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching documents: \(error)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents found")
                return
            }
            self.idDocument = documents
            
            for document in documents {
                self.documentId = document.documentID
                print("Document ID: \(self.documentId)")
                
            }
        }
    }
    func saveScoreToFirestore() {
        // Tüm sorular yanıtlandığında skoru Firestore'a kaydet
        if allQuestionsAnswered {
            guard let userID = userID,
                  let userEmail = Auth.auth().currentUser?.email else { return }
            
            let currentDate = Date()
            
            
            let scoreData: [String: Any] = [
                "userID": userID,
                "userEmail": userEmail,
                "score": currentScore,
                "date": currentDate,

            ]
            
            let scoresCollection = db.collection("scores")
            scoresCollection.addDocument(data: scoreData) { error in
                if let error = error {
                    print("Error adding score to Firestore: \(error.localizedDescription)")
                } else {
                    print("Score added to Firestore successfully.")
                }
            }
        }
 
    }
    
    // Segue hazırlığı
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toFinished" {
                if let destinationVC = segue.destination as? ViewControllerFinished {
                    // receivedScore değerini hedef sayfaya aktar
                    destinationVC.receivedScore = "Tebrikler puanınız:\(self.currentScore)"
                }
            }
        }
    func loadSounds() {
            // Doğru cevap sesini yükleme
            if let correctSoundPath = Bundle.main.path(forResource: "TrueAnswer", ofType: "mp3") {
                let url = URL(fileURLWithPath: correctSoundPath)
                do {
                    correctSoundPlayer = try AVAudioPlayer(contentsOf: url)
                } catch {
                    print("Error loading correct sound file: \(error.localizedDescription)")
                }
            }
            
            // Yanlış cevap sesini yükleme
            if let wrongSoundPath = Bundle.main.path(forResource: "WrongAnswer", ofType: "mp3") {
                let url = URL(fileURLWithPath: wrongSoundPath)
                do {
                    wrongSoundPlayer = try AVAudioPlayer(contentsOf: url)
                } catch {
                    print("Error loading wrong sound file: \(error.localizedDescription)")
                }
            }
        }
}
