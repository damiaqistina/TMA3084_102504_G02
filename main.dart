import 'dart:io';

void main() {
  bool keepOrdering = true;

  //While loop to allow continuous ordering
  while (keepOrdering) {
    print('========================================================');
    print('Pizza Price: "Small: 5 USD, Medium: 7 USD, Large: 10 USD"');
    print('Please enter your pizza size (small, medium, or large):');

    //Read user input
    String? size = stdin.readLineSync();
    int price = 0;

    //Switch statement to calculate and print the total payment
    switch (size?.toLowerCase().trim()) {
      case 'small':
        price = 5;
        break;
      case 'medium':
        price = 7;
        break;
      case 'large':
        price = 10;
        break;
      default:
        print('Invalid pizza size! Please try again.');
        continue;
    }

    print('How many pizzas do you want of $size?');

    int quantity = 0;
    try {
      quantity = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print('Invalid quantity! Restarting order...');
      continue;
    }

    int totalPayment = price * quantity;
    print('Your Total Payment is: \$$totalPayment');

    // Ask user if they want to order again
    print('\nDo you want to order again? (yes/no):');
    String? response = stdin.readLineSync();
    if (response?.toLowerCase().trim() != 'yes') {
      keepOrdering = false;
      print('Thank you for your order!');
    }
  }
}
