//
//  QuizViewController.swift
//  Quiz
//
//  Created by Eren Çetintaş on 9.02.2024.
//

import UIKit
import Firebase
import FirebaseFirestore
class QuizViewController: UIViewController {
    
    
    @IBOutlet weak var AnswerC: UILabel!
    
    @IBOutlet weak var AnswerD: UILabel!
    @IBOutlet weak var AnswerB: UILabel!
    @IBOutlet weak var AnswerA: UILabel!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var QuestionLabel: UILabel!
    let userID = Auth.auth().currentUser?.uid
    var correctAnswer: String?
    var score = 0
    var currentScore = 0
    var currentQuestionIndex = 0
    var questions: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Kullanıcı oturum açtıysa Firestore'a kullanıcı kimliğini ekle ve doğru cevabı al
        if let userID = Auth.auth().currentUser?.uid {
            addUserIDToFirestore(userID: userID)
            fetchCorrect(forUserID: userID)
        } else {
            print("Oturum açmış bir kullanıcı yok.")
        }
        
        fetchDocumentsQuestions1()
        fetchDocumentsAnswers1()
        
        // Her UILabel'a bir UITapGestureRecognizer ekle
        // Her UILabel'a bir UITapGestureRecognizer ekle
        AnswerA.isUserInteractionEnabled = true
        let tapGestureA = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        AnswerA.addGestureRecognizer(tapGestureA)
        AnswerB.isUserInteractionEnabled = true
        let tapGestureB = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        AnswerB.addGestureRecognizer(tapGestureB)
        AnswerC.isUserInteractionEnabled = true
        let tapGestureC = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        AnswerC.addGestureRecognizer(tapGestureC)
        
        AnswerD.isUserInteractionEnabled = true
        let tapGestureD = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        AnswerD.addGestureRecognizer(tapGestureD)
        
    }
    
    
    // Firestore veritabanına referans oluştur
    let db = Firestore.firestore()
    
    // Firestore'dan belgeleri al
    func fetchDocumentsAnswers1() {
        db.collection("Answers").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
                return
            }
            
            if let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    let data = document.data()
                    
                    if let answerA = data["Answer1"] as? String,
                       let answerB = data["Answer2"] as? String,
                       let answerC = data["Answer3"] as? String,
                       let answerD = data["Answer4"] as? String
                    {
                        
                        DispatchQueue.main.async {
                            self.AnswerA.text = answerA
                            self.AnswerB.text = answerB
                            self.AnswerC.text = answerC
                            self.AnswerD.text = answerD
                        }
                    }
                }
            }
        }
    }
    
    
    func fetchDocumentsAnswers2() {
        db.collection("Answers").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
                return
            }
            
            if let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    let data = document.data()
                    
                    if let answerA = data["Answer5"] as? String,
                       let answerB = data["Answer6"] as? String,
                       let answerC = data["Answer7"] as? String,
                       let answerD = data["Answer8"] as? String
                    {
                        
                        DispatchQueue.main.async {
                            self.AnswerA.text = answerA
                            self.AnswerB.text = answerB
                            self.AnswerC.text = answerC
                            self.AnswerD.text = answerD
                        }
                    }
                }
            }
        }
    }
    
    
    func fetchCorrect(forUserID userID: String) {
        let db = Firestore.firestore()
        
        // Belirli kullanıcının "examResults" alt koleksiyonundaki belgeleri al
        db.collection("users").document(userID).collection("CorrectAnswer").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
                return
            }
            
            if let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    let data = document.data()
                    // Belge verilerini işleyin
                    
                    let correct = data["Correct1"] as? String
                    self.correctAnswer = correct
                    // İşlenen verileri kullanın veya başka bir işlem yapın
                    print(correct!)
                }
            }
        }
    }
    func fetchDocumentsQuestions1() {
        db.collection("Question").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
                return
            }
            
            if let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    let data = document.data()
                    
                    if let question1 = data["question1"] as? String
                  
                    {
                        DispatchQueue.main.async {
                            self.QuestionLabel.text = question1
                    
                        }
                        
                    } else {
                        print("Belgede 'question1' alanı bulunamadı.")
                    }
                }
            }
        }
    }
    

    func addUserIDToFirestore(userID: String) {
        let db = Firestore.firestore()
        
        // Firestore'da "users" koleksiyonu altına yeni bir belge oluştur
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
    
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        fetchCorrect(forUserID: userID!)
        
        
        guard let label = sender.view as? UILabel else { return }
        
        // Doğru cevabı kontrol et
        if label.text == correctAnswer {
            // Doğru cevap ise ilgili UILabel'ı yeşil yap
            label.backgroundColor = .green
            updateScore(points: 5)
        } else {
            // Yanlış cevap ise ilgili UILabel'ı kırmızı yap (isteğe bağlı)
            label.backgroundColor = .red
        }
        print("gesture")
    }
    
    // score calculate
    func updateScore(points: Int) {
        
        
        
        let newScore = currentScore + points
        ScoreLabel.text = "Correct Answer - Your Score: \(newScore)"
    }
    
    @IBAction func NextQuestionButton(_ sender: Any) {
        currentQuestionIndex += 1
                
                // currentQuestionIndex değerine göre bir sonraki soruyu göster
                switch currentQuestionIndex {
                case 1:
                    fetchDocumentsQuestions2()
                    fetchDocumentsAnswers2()
                case 2:
                    fetchDocumentsQuestions3()
                default:
                    print("Tüm sorular gösterildi.")
                }
            

    }
    
    func fetchDocumentsQuestions2() {
        db.collection("Question").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
                return
            }
            
            if let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    let data = document.data()
                    
                    if let question2 = data["question2"] as? String
            {
                        DispatchQueue.main.async {
                            self.QuestionLabel.text = question2
            
                        }
             
                    } else {
                        print("Belgede 'question2' alanı bulunamadı.")
                    }
                }
            }
        }
    }

    func fetchDocumentsQuestions3() {
        db.collection("Question").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
                return
            }
            
            if let querySnapshot = querySnapshot {
                for document in querySnapshot.documents {
                    let data = document.data()
                    
                    if let question3 = data["question3"] as? String
            {
                        DispatchQueue.main.async {
                            self.QuestionLabel.text = question3
            
                        }
             
                    } else {
                        print("Belgede 'question3' alanı bulunamadı.")
                    }
                }
            }
        }
    }
 
    
}
