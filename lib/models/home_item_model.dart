class HomeItemModel {
  HomeItemModel(this._uuid, this._title, this._description, this._status, this._imagePath);
  String _uuid = '';
  String _title = '';
  String _description = '';
  String _createdAt = '';
  String _status = '';
  String _imagePath = '';

  get title => _title;
  set title(value) => _title = value;

  get description => _description;
  set description(value) => _description = value;

  get uuid => _uuid;
  set uuid(value) => _uuid = value;

  get imagePath => _imagePath;
  set imagePath(value) => _imagePath = value;

  get status => _status;
  set status(value) => _status = value;

  HomeItemModel.fromJson(Map json)
      : _uuid = json['uuid'],
        _title = json['title'],
        _description = json['description'],
        _imagePath = json['image_path'],
        _status = json['status'];

  Map<String, dynamic> toJson() => {
        'uuid': _uuid,
        'title': _title,
        'description': _description,
        'image_path': _imagePath,
        'status': _status
      };
}
