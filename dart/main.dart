import 'dart:io';

void main() {
  var company = Company();

  while (true) {
    print("\nMenu:");
    print("1. Thêm nhân viên mới");
    print("2. Hiển thị danh sách nhân viên");
    print("3. Cập nhật thông tin nhân viên");
    print("4. Thoát");
    stdout.write("Nhập lựa chọn của bạn: ");
    var choice = int.tryParse(stdin.readLineSync() ?? '');

    switch (choice) {
      case 1:
        // Thêm nhân viên mới
        var newEmployee = readEmployeeDetailsFromUser();
        company.addNewEmployee(newEmployee);
        print("Nhân viên mới đã được thêm.");
        break;
      case 2:
        // Hiển thị danh sách nhân viên
        company.showAllEmployees();
        break;
      case 3:
        // Cập nhật thông tin nhân viên
        var id = readEmployeeIdFromUser();
        var updatedEmployee = readEmployeeDetailsFromUser();
        company.updateEmployee(id, updatedEmployee);
        print("Thông tin nhân viên đã được cập nhật.");
        break;
      case 4:
        // Thoát ứng dụng
        exit(0);
        break;
      default:
        print("Lựa chọn không hợp lệ. Vui lòng thử lại.");
        break;
    }
  }
}

Employee readEmployeeDetailsFromUser() {
  stdout.write("Nhập ID: ");
  var id = int.parse(stdin.readLineSync() ?? '');
  stdout.write("Nhập Họ và Tên: ");
  var fullName = stdin.readLineSync() ?? '';
  stdout.write("Nhập Ngày Sinh (yyyy-MM-dd): ");
  var birthdayStr = stdin.readLineSync() ?? '';
  var birthday = DateTime.tryParse(birthdayStr) ?? DateTime.now();
  stdout.write("Nhập Địa Chỉ: ");
  var address = stdin.readLineSync() ?? '';
  stdout.write("Nhập Số Điện Thoại: ");
  var phoneNumber = stdin.readLineSync() ?? '';

  return Employee(
    id: id,
    fullName: fullName,
    birthday: birthday,
    address: address,
    phoneNumber: phoneNumber,
  );
}

int readEmployeeIdFromUser() {
  stdout.write("Nhập ID của nhân viên cần cập nhật: ");
  return int.tryParse(stdin.readLineSync() ?? '') ?? -1;
}

class Employee {
  int id;
  String fullName;
  DateTime birthday;
  String address;
  String phoneNumber;

  Employee({
    required this.id,
    required this.fullName,
    required this.birthday,
    required this.address,
    required this.phoneNumber,
  });

  void displayInfo() {
    print("Employee ID: $id");
    print("Full Name: $fullName");
    print("Birthday: ${birthday.toLocal()}"); 
    print("Address: $address");
    print("Phone Number: $phoneNumber");
    print("----------------------");
  }
}

class Company {
  List<Employee> employees = [];

  void addNewEmployee(Employee employee) {
    employees.add(employee);
  }

  List<Employee> getAllEmployees() {
    return employees;
  }

  void updateEmployee(int id, Employee updatedEmployee) {
    for (var i = 0; i < employees.length; i++) {
      if (employees[i].id == id) {
        employees[i] = updatedEmployee;
        break;
      }
    }
  }

  void showAllEmployees() {
    if (employees.isEmpty) {
      print("Danh sách nhân viên trống.");
    } else {
      for (var employee in employees) {
        employee.displayInfo();
      }
    }
  }
}
