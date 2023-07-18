import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
 

  Future<void> addData(String data) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> listdata=[];
    listdata.addAll(prefs.getStringList('userList') ?? []);
    print('addData: $listdata');
    if (listdata.contains(data)) {
      print('Already Exists');
    }else{ listdata.add(data);}
    await saveUserList(listdata);
  }

  Future<bool> saveUserList(List<String> listdata) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('saveUserList: $listdata');
    return prefs.setStringList('userList', listdata);
  }

  Future<List<String>> getUserList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('getUserList: ${prefs.getStringList('userList')}');
    return prefs.getStringList('userList') ?? [];
    
  }

  Future<List<String>> loadData(List<String> listdata) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('userList', listdata);
    return listdata;
  }

  

}