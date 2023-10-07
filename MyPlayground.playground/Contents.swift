import Foundation

// პირველი

enum DayOfWeek: Int {
    case monday = 1
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

func IsWeekend(day: DayOfWeek) {
    if day.rawValue >= 6 {
        print("\(day) is weekend")
    } else {
        print("\(day) is workday")
    }
    print("\n")
}

let today = DayOfWeek.sunday
IsWeekend(day: today)

// მეორე

enum Weather {
    case sunny(Double)
    case cloudy(Double)
    case rainy(Double)
    case snowy(Double)
}

func whatToWear(weatherToday: Weather) {
    switch weatherToday {
    case .cloudy(let temperature):
        print("It is cloudy weather and \(temperature) celsius outside, recommended clothing: jacket and jeans")
    case .rainy(let temperature):
        print("It is rainy weather and \(temperature) celsius outside, recommended clothing: water-resistant jacket")
    case .sunny(let temperature):
        print("It is sunny weather and \(temperature) celsius outside, recommended clothing:  shorts and t-shirt")
    case .snowy(let temperature):
        print("It is snowy weather and \(temperature) celsius outside, recommended clothing: sweaters or hoodies")
    }
    print("\n")
}

let weatherToday = Weather.rainy(18.0)
whatToWear(weatherToday: weatherToday)

// მესამე

struct Book {
    var title: String
    var author: String
    var publicationYear: Int
}

var library: [Book] = []

let book1 = Book(title: "Zebuloni", author: "Jemal Qarchkhadze", publicationYear: 1988)
let book2 = Book(title: "Antonio da Daviti", author: "Jemal Qarchkhadze", publicationYear: 1984)
let book3 = Book(title: "Jinsebis taoba", author: "Dato Turashvili", publicationYear: 2008)
let book4 = Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", publicationYear: 1925)

library.append(book1)
library.append(book2)
library.append(book3)
library.append(book4)

func booksPublishedAfter(year: Int, inLibrary library: [Book]) -> [Book] {
    library.filter { $0.publicationYear > year }
}

let yearToFilter = 1965
let booksPublishedAfter1965 = booksPublishedAfter(year: yearToFilter, inLibrary: library)

for book in booksPublishedAfter1965 {
    print("The author of the book \(book.title) is \(book.author), published in \(book.publicationYear)")
    print("---------------------", "\n")
}

// მეოთხე

struct BankAccount{
    static let currency = "GEL"
    
    var holderName: String
    var accountNumber: Int
    var balance: Double
    
    mutating func deposit(amount: Double) -> Double {
        balance += amount
        print("Balance after deposit: \(balance)", "\n")
        return balance
    }
    
    mutating func withdraw(amount: Double) -> Double {
        var maxWithdraw = 150.0
        
        balance -= amount
        maxWithdraw -= amount
        
        if balance > 0 && maxWithdraw > 0 {
            print("Balance after withdraw: \(balance)", "\n")
            return balance
        } else if maxWithdraw > 0 {
            print("Insufficient amount", "\n")
            return 0
        } else {
            print("Limit reached, to increase the limit, please contact the bank", "\n")
            return 0
        }
    }
}

var person = BankAccount(holderName: "Nika Razmadze", accountNumber: 098709, balance: 123.59)
person.deposit(amount: 235.61)
person.withdraw(amount: 40)
person.withdraw(amount: 188)

// მეხუთე

enum Genre {
    case hipHop
    case pop
    case rock
    case jazz
    case blues
    case qartulebi
}

struct Song {
    var title: String
    var artist: String
    var duration: Double
    var genre: Genre
    var description: String {
        "\(title) by \(artist) (\(genre))"
    }
    lazy var publisher: String? = nil
}

var playlist: [Song] = []

var song1 = Song(title: "Lose Yourself", artist: "Eminem", duration: 4.51, genre: .hipHop)
var song2 = Song(title: "Change", artist: "J. Cole", duration: 5.11, genre: .hipHop, publisher: "Roc Nation")
var song3 = Song(title: "Time after time", artist: "Miles Davis", duration: 9.47, genre: .jazz)
var song4 = Song(title: "Interlude", artist: "Gia Kancheli", duration: 2.52, genre: .jazz)
var song5 = Song(title: "Tsagveri and Tbilisi", artist: "Nino Chkheidze", duration: 2.56, genre: .qartulebi)

playlist.append(song1)
playlist.append(song2)
playlist.append(song3)
playlist.append(song4)
playlist.append(song5)

func songsOfOneGenre(songs: [Song], genre: Genre) -> [Song] {
    songs.filter { $0.genre == genre }
}

let hipHopSongs = songsOfOneGenre(songs: playlist, genre: .hipHop)

for var song in hipHopSongs {
    print(song.description)
    
    if let publisher = song.publisher {
        print("Publisher: \(publisher)")
    } else {
        print("No publisher information available.")
    }
    
    print("---------------------", "\n")
}







