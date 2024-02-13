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
        
        newFetchQuestion ()
        // Kullanıcı oturum açtıysa Firestore'a kullanıcı kimliğini ekle ve doğru cevabı al
        if let userID = Auth.auth().currentUser?.uid {
            addUserIDToFirestore(userID: userID)
           // fetchCorrect(forUserID: userID)
        } else {
            print("Oturum açmış bir kullanıcı yok.")
        }
        
        //fetchDocumentsQuestions1()
       // fetchDocumentsAnswers1()
        
        
        // Her UILabel'a bir UITapGestureRecognizer ekle
        // UITapGestureRecognizer'ları cevap etiketlerine ekle
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
    
   /*
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
                    
                    
                    let correct = data["Correct1"] as? String
                    self.correctAnswer = correct
                   
                    print(correct!)
                }
            }
        }
    }
    */
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
    
    
    @objc func answerTapped(_ sender: UITapGestureRecognizer) {
        guard let label = sender.view as? UILabel else { return }
        
        // Seçilen cevabı al
        let selectedAnswer = label.text ?? ""
        
        // Doğru cevabı kontrol et
        if selectedAnswer == correctAnswer {
            // Doğru cevap ise ilgili UILabel'ı yeşil yap
            label.backgroundColor = .green
            
            // 1 saniye sonra bir sonraki soruya geç
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                // Yeşil rengi temizle
                label.backgroundColor = .clear
                
                // Bir sonraki belgeye geçiş işlemi
                self.fetchNextDocument()
            }
        } else {
            // Yanlış cevap ise ilgili UILabel'ı kırmızı yap
            label.backgroundColor = .red
        }
    }

    // score calculate
    func updateScore(points: Int) {
        
        
        
        let newScore = currentScore + points
        ScoreLabel.text = "Correct Answer - Your Score: \(newScore)"
    }
    
    @IBAction func NextQuestionButton(_ sender: Any) {
        currentQuestionIndex += 1
                
        
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
    
    func fetchNextDocument() {
      
        newFetchQuestion()
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

    
    func newFetchQuestion () {
        
        db.collection("Question").getDocuments { (querySnapshot, error) in
                       if let error = error {
                           print("Error getting documents: \(error.localizedDescription)")
                       } else {
                           for document in querySnapshot!.documents {
                               let data = document.data()
                               let questionText = data["questionText"] as? String ?? ""
                               let answers = data["answers"] as? [String] ?? []
                               let correctAnswer = data["correctAnswer"] as? String ?? ""

                               DispatchQueue.main.async {
                                   self.QuestionLabel.text = questionText
                               }

                               // Cevapları uygun UILabel'lara atama
                               if answers.count >= 4 {
                                   DispatchQueue.main.async {
                                       self.AnswerA.text = answers[0]
                                       self.AnswerB.text = answers[1]
                                       self.AnswerC.text = answers[2]
                                       self.AnswerD.text = answers[3]
                                   }
                                   
                                   // Doğru cevabı al
                                   self.correctAnswer = correctAnswer
                                   print("Doğru cevap: \(correctAnswer)") // Doğru cevabı yazdır
                                   
                               } else {
                                   print("Sorunun cevapları eksik veya hatalı.")
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
