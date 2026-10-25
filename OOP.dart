abstract class TransportService {
  void displayService();
}

mixin FareMixin {
  void collectFare(int passengers, int fare) {
    print('Fare collected: PHP ${passengers * fare}');
  }
}

class Vehicle {
  String route;
  String plateNumber;
  int _passengers;

  Vehicle(this.route, this.plateNumber, this._passengers);

  int get passengers => _passengers;

  void pickUpPassengers(int count) {
    if (count > 0 && _passengers + count <= 20) {
      _passengers += count;
    }
  }

  void dropOffPassengers(int count) {
    if (count > 0 && count <= _passengers) {
      _passengers -= count;
    }
  }

  void displayInfo() {
    print('Route: $route');
    print('Plate Number: $plateNumber');
    print('Passengers: $_passengers');
  }
}

class Jeepney extends Vehicle with FareMixin implements TransportService {
  Jeepney(String route, String plateNumber, int passengers)
      : super(route, plateNumber, passengers);

  @override
  void displayInfo() {
    print('Jeepney');
    super.displayInfo();
  }

  @override
  void displayService() {
    print('Service: Public jeepney transportation');
  }
}

class Bus extends Vehicle with FareMixin implements TransportService {
  Bus(String route, String plateNumber, int passengers)
      : super(route, plateNumber, passengers);

  @override
  void displayInfo() {
    print('Bus');
    super.displayInfo();
  }

  @override
  void displayService() {
    print('Service: Public bus transportation');
  }
}

void main() {
  List<Vehicle> vehicles = [
    Jeepney('Cubao - Divisoria', 'PL-002026', 10),
    Bus('Manila - Fairview', 'BUS-5678', 15)
  ];

  for (Vehicle vehicle in vehicles) {
    vehicle.displayInfo();

    if (vehicle is TransportService) {
      (vehicle as TransportService).displayService();
    }

    if (vehicle is Jeepney) {
      vehicle.collectFare(vehicle.passengers, 13);
    } else if (vehicle is Bus) {
      vehicle.collectFare(vehicle.passengers, 15);
    }

    print('');
  }

  vehicles[0].pickUpPassengers(3);
  vehicles[1].dropOffPassengers(2);

  print('After passenger updates:');

  for (Vehicle vehicle in vehicles) {
    vehicle.displayInfo();
    print('');
  }
}
