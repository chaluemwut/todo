class HomeItemModel {
  HomeItemModel(this._uuid, this._title, this._description, this._status);
  String _uuid = '';
  String _title = '';
  String _description = '';
  String _createdAt = '';
  String _status = '';

  get title => _title;
  set title(value) => _title = value;

  get description => _description;
  set description(value) => _description = value;

  HomeItemModel.fromJson(Map json)
      : _uuid = json['uuid'],
        _title = json['title'],
        _description = json['description'],
        // _createdAt = json['created_at'],
        _status = json['status'];

  Map<String, dynamic> toJson() => {
        'uuid': _uuid,
        'title': _title,
        'description': _description,
        'status': _status
      };
}
