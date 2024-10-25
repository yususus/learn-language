# 📚 Dil Öğrenme Uygulaması (iOS)

<div align="center">

<img src="https://github.com/user-attachments/assets/13eafc6e-24cc-40b2-8734-717c113f6ae3" alt="logo" title="İcon" width="100"/>
<div>
  <a href="https://apps.apple.com/tr/app/learn-english-words-sentences/id6737259105?l=tr" style="display: inline-block; overflow: hidden; border-radius: 13px; width: 250px; height: 83px;">
<img src="https://github.com/user-attachments/assets/bfc07313-7215-40a7-9177-0701dc4e2252" alt="Download on the App Store" style="border-radius: 13px; width: 250px; height: 83px;">
</a>
</div>

SwiftUI ile geliştirilmiş, modern ve etkileşimli bir dil öğrenme deneyimi.



</div>

## ✨ Özellikler

- 🎯 SwiftUI ile modern ve akıcı kullanıcı arayüzü
- 💾 UserDefaults ile ilerleme kaydı
- 🔄 SwiftyJSON ile etkili veri yönetimi
- 📊 Gerçek zamanlı ilerleme takibi
- 🎨 iOS 16+ için optimize edilmiş tasarım


## 📱 Ekran Görüntüleri

<div align="center">
<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/4402ce3d-c95e-488f-963f-348efb5449ab" alt="Ana Sayfa" title="Ana Sayfa"/></td>
    <td><img src="https://github.com/user-attachments/assets/6c1d29df-a657-42b1-b6e5-219d3ef14b31" alt="Soru Ekranı" title="Soru Ekranı"/></td>
    <td><img src="https://github.com/user-attachments/assets/8617005f-8bce-41df-9833-4dc512525b5d" alt="İlerleme" title="İlerleme"/></td>
  </tr>
</table>
</div>

## 🛠 Gereksinimler

- iOS 16.0+
- Xcode 15.0+
- Swift 5.0+

## 📦 Kullanılan Paketler

- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) - JSON verilerini işlemek için

## 🚀 Kurulum

### Swift Package Manager ile Kurulum

1. Xcode'da projenizi açın
2. File > Add Packages... seçeneğine tıklayın
3. SwiftyJSON paketini ekleyin:
```
https://github.com/SwiftyJSON/SwiftyJSON.git
```

### Manuel Kurulum

1. Projeyi klonlayın:
```bash
git clone https://github.com/yourusername/language-learning-app-ios.git
```

2. Xcode'da .xcodeproj dosyasını açın
3. Gerekli bağımlılıkların yüklendiğinden emin olun
4. Projeyi derleyin ve çalıştırın

## 💻 Kod Örnekleri

### JSON Veri Yönetimi
```swift
import SwiftyJSON

struct Question {
    let id: Int
    let text: String
    let options: [String]
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.text = json["text"].stringValue
        self.options = json["options"].arrayValue.map { $0.stringValue }
    }
}
```

### İlerleme Kaydetme
```swift
// İlerlemeyi kaydet
    func saveProgress(for level: String, category: String) {
        let progressKey = key(for: level, category: category)
        defaults.set(currentQuestionIndex, forKey: progressKey)
        print("Progress saved for \(progressKey): \(currentQuestionIndex)")
    }

    // İlerlemeyi geri yükle
    func loadProgress(for level: String, category: String) {
        let progressKey = key(for: level, category: category)
        if let savedIndex = defaults.value(forKey: progressKey) as? Int {
            currentQuestionIndex = savedIndex
            print("Progress loaded for \(progressKey): \(currentQuestionIndex)")
        } else {
            print("No progress found for \(progressKey), starting from 0.")
            currentQuestionIndex = 0
        }
    }

    // Soruları yükle ve ilerlemeyi geri getir
    func loadQuestions(for level: String, category: String) {
        let fileName = "\(level)\(category)"
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                self.questions = try decoder.decode([QuestionModel].self, from: data)
                
                // İlerlemeyi geri yükle
                loadProgress(for: level, category: category)
                
                print("File found: \(fileName).json, questions loaded successfully.")
            } catch {
                print("Error loading questions: \(error)")
            }
        } else {
            print("File not found: \(fileName).json")
        }
    }
```


<div align="center">
⭐️ Bu projeyi beğendiyseniz yıldız vermeyi unutmayın!
</div>
