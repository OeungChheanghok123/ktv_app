import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktv_app/api/search.dart';
import 'package:ktv_app/models/post_model.dart';
import 'package:ktv_app/models/remote_data.dart';
import 'package:ktv_app/models/sort_by_model.dart';

class SearchViewModel extends GetxController {
  final searchFormKey = GlobalKey<FormState>();
  final query = TextEditingController();
  final _isQuery = false.obs;
  final _selectedSortBy = SortByModelValue.empty.obs;
  final _searchHistoryData =
      RemoteData<List<String>>(status: RemoteDataStatus.processing, data: null)
          .obs;
  final _searchData = RemoteData<List<PostModel>>(
          status: RemoteDataStatus.processing, data: null)
      .obs;

  bool get isQuery => _isQuery.value;
  SortByModelValue get selectedSortBy => _selectedSortBy.value;
  RemoteData<List<PostModel>> get searchData => _searchData.value;
  RemoteData<List<String>> get searchHistoryData => _searchHistoryData.value;

  @override
  void onInit() {
    loadHistorySearchData();
    super.onInit();
  }

  void search(String search) {
    query.text = search;
    _searchData.value = RemoteData<List<PostModel>>(
        status: RemoteDataStatus.processing, data: null);
    if (query.text.isEmpty) {
      _isQuery.value = false;
    } else {
      _isQuery.value = true;
      _loadSearchData(query.text, selectedSortBy);
    }
  }

  void setSortByIndex(SortByModelValue sortByModelValue) {
    if (_selectedSortBy.value == sortByModelValue) {
      _selectedSortBy.value = SortByModelValue.empty;
      if (query.text.isEmpty) {
        _isQuery.value = false;
      }
    } else {
      _selectedSortBy.value = sortByModelValue;
      _isQuery.value = true;
    }
    _searchData.value = RemoteData<List<PostModel>>(
        status: RemoteDataStatus.processing, data: null);
    _loadSearchData(query.text, sortByModelValue);
  }

  void setIsQuery(bool isQuery) {
    _isQuery.value = isQuery;
  }

  void _loadSearchData(
      String? query, SortByModelValue? sortByModelValue) async {
    try {
      _searchData.value = RemoteData<List<PostModel>>(
          status: RemoteDataStatus.success,
          data: await SearchApi.loadSearch(query, sortByModelValue));
    } catch (e) {
      _searchData.value = RemoteData<List<PostModel>>(
          status: RemoteDataStatus.error, data: null);
    }
  }

  void loadHistorySearchData() async {
    try {
      _searchHistoryData.value = RemoteData<List<String>>(
          status: RemoteDataStatus.success,
          data: await SearchApi.loadHistorySearch());
    } catch (e) {
      _searchHistoryData.value = RemoteData<List<String>>(
          status: RemoteDataStatus.error, data: null);
    }
  }
}
