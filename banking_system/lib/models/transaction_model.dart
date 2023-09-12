class CustomerTransaction
{
  final int id;
  final String sender;
  final String receiver;
  final int amount;
  final String date;
  final String time;

  CustomerTransaction({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.amount,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sender': sender,
      'receiver': receiver,
      'amount': amount,
      'date': date,
      'time': time,
    };
  }

  factory CustomerTransaction.fromMap(Map<String, dynamic> map) {
    return CustomerTransaction(
      id: map['id'],
      sender: map['sender'],
      receiver: map['receiver'],
      amount: map['amount'],
      date: map['date'],
      time: map['time'],
    );
  }
}