import UIKit

class PersonsTVC {
    struct Person {
        var name: String
        var email: String
        var phoneNumber: String
    }

    // Пустой массив персон
    static var persons: [Person] = []
    // Создаем массивы с именами и фамилиями
    private static var names = ["Alexandr", "Sergey", "Ilya", "Evgeny", "Valeryia", "Vadim", "Zhenya", "Roman", "Anastasiya", "Gleb"]
    private static var surnames = ["Filovets", "Loyko", "Ruppel", "Pugachev", "Ignatinko", "Anderson", "Wilson", "Clark", "Walker", "Hall"]
    // получаем 10 персон
    static func getPersons() -> [Person] {
        persons = []
        names.shuffle()
        surnames.shuffle()
        for i in 0...9 {
            let randomEmail = generateRandomEmail()
            let randomPhoneNumber = generateRandomPhoneNumber()

            let person = Person(name: "\(names[i]) \(surnames[i])", email: randomEmail, phoneNumber: randomPhoneNumber)
            persons.append(person)
        }
        return persons
    }

    // случайный Email
    private static func generateRandomEmail() -> String {
        let randomString = String(UUID().uuidString.prefix(8))
        let email = "\(randomString)@gmail.com"
        return email
    }

    // случайный номер
    private static func generateRandomPhoneNumber() -> String {
        let randomNumber = Int.random(in: 1000000...9999999)
        let phoneNumber = "+37529\(randomNumber)"
        return phoneNumber
    }
}
