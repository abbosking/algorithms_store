import 'package:flutter/material.dart';

class AlgorithmImplementationPage extends StatelessWidget {
  final String algorithmName;
  final String languageName;

  AlgorithmImplementationPage(
      {required this.algorithmName, required this.languageName});

  @override
  Widget build(BuildContext context) {
    // Placeholder code for algorithm implementations in different languages
    String code = '';

    if (languageName == 'Python') {
      code = '''def binary_search(arr, target):
    left = 0
    right = len(arr) - 1

    while left <= right:
        mid = left + (right - left) // 2

        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1

    return -1

# Example usage:
my_list = [2, 4, 6, 8, 10, 12, 14, 16]
target_element = 10
result = binary_search(my_list, target_element)

if result != -1:
    print(f"Element found at index: {result}")
else:
    print("Element not found")''';
    } else if (languageName == 'Java') {
      code = '''class BinarySearch {
    static int binarySearch(int[] arr, int target) {
        int left = 0;
        int right = arr.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;

            if (arr[mid] == target) {
                return mid;
            } else if (arr[mid] < target) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        return -1;
    }

    public static void main(String[] args) {
        int[] myArray = {2, 4, 6, 8, 10, 12, 14, 16};
        int target = 10;
        int result = binarySearch(myArray, target);

        if (result != -1) {
            System.out.println("Element found at index: " + result);
        } else {
            System.out.println("Element not found");
        }
    }
}''';
    } else if (languageName == 'C++') {
      code = '''#include <iostream>
#include <vector>

using namespace std;

int binarySearch(vector<int>& arr, int target) {
    int left = 0;
    int right = arr.size() - 1;

    while (left <= right) {
        int mid = left + (right - left) / 2;

        if (arr[mid] == target) {
            return mid;
        } else if (arr[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }

    return -1;
}

int main() {
    vector<int> myVector = {2, 4, 6, 8, 10, 12, 14, 16};
    int target = 10;
    int result = binarySearch(myVector, target);

    if (result != -1) {
        cout << "Element found at index: " << result << endl;
    } else {
        cout << "Element not found" << endl;
    }

    return 0;
}''';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$algorithmName - $languageName'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            code,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
