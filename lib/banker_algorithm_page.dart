import 'package:ahmed_karam_os_assignment/banker_output.dart';
import 'package:flutter/material.dart';

class BankerAlgorithmPage extends StatefulWidget {
  @override
  _BankerAlgorithmPageState createState() => _BankerAlgorithmPageState();
}

class _BankerAlgorithmPageState extends State<BankerAlgorithmPage> {
  final _formKey = GlobalKey<FormState>();
  final _availableController = TextEditingController();
  final _maxController = TextEditingController();
  final _allocationController = TextEditingController();
  final _resourceNoController = TextEditingController();
  final _processNoController = TextEditingController();

  void Algorithm_Output_Result(String available, String max, String allocation, String resourceNo, String processNo) {
    // TODO: Implement algorithm logic using the provided inputs
    print('Available: $available');
    print('Max: $max');
    print('Allocation: $allocation');
    print('Resource No: $resourceNo');
    print('Process No: $processNo');
  }

  @override
  void dispose() {
    _availableController.dispose();
    _maxController.dispose();
    _allocationController.dispose();
    _resourceNoController.dispose();
    _processNoController.dispose();
    super.dispose();
  }

  List<int> bankerAlgorithm(
      List<List<int>> max,
      List<List<int>> alloc,
      List<int> avail,
      int n,
      int m) {
    List<int> safeSeq = [];
    List<int> work = List.from(avail);
    List<bool> finish = List.filled(n, false);
    int count = 0;

    while (count < n) {
      bool found = false;
      for (int i = 0; i < n; i++) {
        if (!finish[i]) {
          int j;
          for (j = 0; j < m; j++) {
            if (max[i][j] - alloc[i][j] > work[j]) {
              break;
            }
          }
          if (j == m) {
            for (int k = 0; k < m; k++) {
              work[k] += alloc[i][k];
            }
            safeSeq.add(i);
            finish[i] = true;
            found = true;
            count++;
          }
        }
      }
      if (!found) {
        break;
      }
    }

    if (count == n) {
      return safeSeq;
    } else {
      return [];
    }
  }

  List<List<int>> stringTo2DArray(String str) {
    List<String> rows = str.trim().split('\n');
    List<List<int>> array2D = [];
    for (String row in rows) {
      List<String> elements = row.trim().split(' ');
      List<int> rowList = [];
      for (String element in elements) {
        rowList.add(int.parse(element));
      }
      array2D.add(rowList);
    }
    return array2D;
  }

  List<int> stringToArray(String input) {
    return input.split(' ').map(int.parse).toList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Banker Algorithm'),
        ),
        body: Padding(
        padding: EdgeInsets.all(16.0),
    child: Form(
    key: _formKey,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Text(
    'Enter the following inputs:',
    style: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 16.0),
    TextFormField(
    controller: _availableController,
    validator: (value) {
    if (value!.isEmpty) {
    return 'Please enter available resources';
    }
    return null;
    },
    decoration: InputDecoration(
    labelText: 'Available Resources',
    hintText: 'Enter available resources',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    ),
    filled: true,
    fillColor: Colors.grey[200],
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    ),
    ),
    SizedBox(height: 16.0),
    TextFormField(
    controller: _maxController,
    keyboardType: TextInputType.multiline,
    maxLines: null,
    validator: (value) {
    if (value!.isEmpty) {
    return 'Please enter maximum resources';
    }
    return null;
    },
    decoration: InputDecoration(
    labelText: 'Maximum Resources',
    hintText: 'Enter maximum resources',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    ),
    filled: true,
    fillColor: Colors.grey[200],
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    ),
    ),
    SizedBox(height: 16.0),
    TextFormField(
    controller: _allocationController,
    keyboardType: TextInputType.multiline,
    maxLines: null,
    validator: (value) {
    if (value!.isEmpty) {
    return 'Please enter allocation resources';
    }
    return null;
    },
    decoration: InputDecoration(
    labelText: 'Allocation Resources',
    hintText: 'Enter allocation resources',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    ),
    filled: true,
    fillColor: Colors.grey[200],
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    ),
    SizedBox(height: 16.0),
    TextFormField(
    controller: _resourceNoController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter number of resource types';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Number of Resource Types',
        hintText: 'Enter number of resource types',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      ),
    ),
      SizedBox(height: 16.0),
      TextFormField(
        controller: _processNoController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter number of processes';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Number of Processes',
          hintText: 'Enter number of processes',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        ),
      ),
      SizedBox(height: 16.0),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            List<List<int>> max = stringTo2DArray(_maxController.text);
            List<List<int>> alloc = stringTo2DArray(_allocationController.text);
            List<int> avail = stringToArray(_availableController.text);
            int n = int.parse(_processNoController.text);
            int m = int.parse(_resourceNoController.text);
            List<int> nm = bankerAlgorithm(max, alloc, avail, n, m);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OutputProcessPage(safeSeq: nm),
              ),
            );
          }

        },
        child: Text(
          'Run Algorithm',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

    ],
    ),
    ),
        ),
    );
  }
}