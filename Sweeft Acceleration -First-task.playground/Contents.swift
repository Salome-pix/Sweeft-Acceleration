import UIKit

//1. გვაქვს 1,5,10,20 და 50 თეთრიანი მონეტები. დაწერეთ ფუნქცია, რომელსაც გადაეცემა თანხა (თეთრებში) და აბრუნებს მონეტების მინიმალურ რაოდენობას, რომლითაც შეგვიძლია ეს თანხა დავახურდაოთ.

func minSplit(amount: Int) -> Int {
    let coins = [50, 20, 10, 5, 1]
    var remainingAmount = amount
    var count = 0
    
    for coin in coins {
        count += remainingAmount / coin
        remainingAmount %= coin
        
        if remainingAmount == 0 {
            break
        }
    }
    
    return count
}
//minSplit(amount: 127)


//2. დაწერეთ ფუნქცია რომელიც დააჯამებს ციფრებს ორ რიცსხვს შორის.
//   მაგალითად გადმოგვეცემა 19 და 22. მათ შორის ციფრების ჯამი იქნება

func sumOfDigits( _ a: Int, _ b: Int) -> Int {
    Array(a...b).reduce(0) { $0 + $1.description.reduce(0) { $0 + Int($1.description)! } }
}

//sumOfDigits(10, 12)


//3. მოცემულია String რომელიც შედგება „(" და „)" ელემენტებისგან. დაწერეთ ფუნქცია რომელიც აბრუნებს ფრჩხილები არის თუ არა მათემატიკურად სწორად დასმული.

func isProperly(_ sequence: String) -> Bool {
    var stack = [Character]()

    for char in sequence {
        if char == "(" {
            stack.append(")")
        } else if stack.isEmpty || stack.popLast() != char {
            return false
        }
    }

    return stack.isEmpty
}
//4. გვაქვს N ფიცრისგან შემდგარი ხიდი. სიძველის გამო ზოგიერთი ფიცარი ჩატეხილია. ზურიკოს შეუძლია გადავიდეს შემდეგ ფიცარზე ან გადაახტეს ერთ ფიცარს. (რათქმაუნდა ჩატეხილ   ფიცარზე ვერ გადავა)
//   ჩვენი ამოცანაა დავითვალოთ რამდენი განსხვავებული კომბინაციით შეუძლია ზურიკოს ხიდის გადალახვა. გადმოგვეცემა ხიდის სიგრძე და ინფორმაცია ჩატეხილ ფიცრებზე. 0 აღნიშნავს ჩატეხილ ფიცარს 1_ანი კი მთელს. დასაწყისისთვის ზურიკო დგას ხიდის ერთ მხარეს (არა პირველ ფიცარზე) და გადალახვად ჩათვლება ხიდის მეორე მხარე (ბოლო ფიცრის შემდეგი ნაბიჯი)

func countWays(n: Int, steps: [Int]) -> Int {
    guard !steps.isEmpty else { return -1 }
    
    var result = [1, steps.first!]
    
    for i in 2...steps.count {
        if (steps[i - 1] == 0) {
            result.append(0)
        } else {
            let value = result[i - 1] + result[i - 2]
            result.append(value)
        }
    }
    
    return result[result.count - 1] + result[result.count - 2]
}

countWays(n: 3, steps: [1, 1, 0, 1, 1])


//5. გადმოგეცემათ მთელი რიცხვი N. დაწერეთ ფუნქცია რომელიც დაითვლის რამდენი 0ით ბოლოვდება N! (ფაქტორიალი)
//    შენიშვნა 1000! შედგება 2568 სიმბოლოსაგან.
//zeros(N: 7) ➞ 1
//

func zeros(n: Int) -> Int {
    var count = 0
    var i = 5
    while n / i >= 1 {
        count += n / i
        i *= 5
    }
    return count
}

//zeros(n: 490)
