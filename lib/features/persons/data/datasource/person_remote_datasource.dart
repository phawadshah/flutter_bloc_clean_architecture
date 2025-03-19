import 'dart:convert';

import 'package:sgm_block/core/data/network/api_base_helper.dart';
import 'package:sgm_block/core/data/network/api_urls.dart';
import 'package:sgm_block/features/persons/data/models/person_model.dart';
import 'package:sgm_block/features/persons/domain/entities/person.dart';

abstract class PersonRemoteDatasource {
  Future<Person> getPerson(int id);
}

class PersonRemoteDatasourceImpl extends PersonRemoteDatasource {
  ApiHelper apiHelper = ApiHelper();
  @override
  Future<Person> getPerson(int id) async {
    var response = await apiHelper.get(APiUrls.getPerson(id));
    return PersonModel.fromJson(jsonDecode(response.body));
  }
}
