class Customer
{
  int id;
  String name;
  String email;
  String address;
  int balance;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.balance,
  });

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      address: map['address'],
      balance: map['balance'],
    );
  }
}


List<Customer> customers = [
  Customer(id: 1,name: "Ahmed Fayek",email: "ahmed@gmail.com",address: "New York",balance: 1000000000000000000),
  Customer(id: 2,name: "Danial Jack",email: "danial@gmail.com",address: "New York",balance: 1000),
  Customer(id: 3,name: "Steven Rock",email: "steven@gmail.com",address: "London",balance: 2000),
  Customer(id: 4,name: "Jack Dawson",email: "jack@gmail.com",address: "El giza",balance: 3000),
  Customer(id: 5,name: "Noah Jackob",email: "noah@gmail.com",address: "Berlin",balance: 4000),
  Customer(id: 6,name: "Fras Ali",email: "fras@gmail.com",address: "Roma",balance: 5000),
  Customer(id: 7,name: "Bill Jozef",email: "bill@gmail.com",address: "Cairo",balance: 6000),
  Customer(id: 8,name: "Hassan Ali",email: "hassan@gmail.com",address: "Ain Shams",balance: 7000),
  Customer(id: 9,name: "Morgan Adam",email: "morgan@gmail.com",address: "Frankfort",balance: 8000),
  Customer(id: 10,name: "Yasser Ali",email: "yasser@gmail.com",address: "New Cairo",balance: 9000),
    Customer(id: 11,name: "Hamed Yaseen",email: "hamed@gmail.com",address: "Banha",balance: 10000),
  ];