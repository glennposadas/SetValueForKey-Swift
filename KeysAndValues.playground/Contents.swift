import UIKit

/**
 This playground demonstrates if it's possible to transfer the values for keys of a model to another model.
 */
enum PersonKey: CodingKey {
    case firstName, lastName
    
    static var allKeys: [PersonKey] {
        [.firstName, .lastName]
    }
}

class Person: NSObject {
    // Remember to make these properties as objc to enable setValueForKey
    @objc var firstName: String!
    @objc var lastName: String!
    
    convenience init(firstName: String, lastName: String) {
        self.init()
        self.firstName = firstName
        self.lastName = lastName
    }
    
    override var description: String {
        "FirstName: \(String(describing: self.firstName)) | LastName: \(String(describing: self.lastName))"
    }
}

// A new person instance. Using convenience init method.
let p1 = Person(firstName: "Glenn", lastName: "Posadas")

// A new person instance. But not using the convenience init method.
// But rather using setValue forKey
let p2 = Person()
p2.setValue("Diana", forKey: "firstName")
p2.setValue("Posadas", forKey: "lastName")

print(p1.description)
print(p2.description)

// Now, yet again a new person instnace but using the for loop.
// Basically, copying p1 contents to p3.
let p3 = Person()
for key in PersonKey.allKeys {
    p3.setValue(p1.value(forKey: key.stringValue), forKey: key.stringValue)
}

print(p3.description)
