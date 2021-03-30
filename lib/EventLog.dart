class EventLog {
  int id;
  int typeName;
  Type type;
  String data;
  int fromDeviceId;
  FromDevice fromDevice;
  int fromSubsystemId;
  Null fromAccountId;
  Null fromAccount;
  String createdAt;
  Null lastModified;
  int toProcedureId;
  Null toProcedure;
  int acknowledgeStatus;

  EventLog(
      {this.id,
      this.typeName,
      this.type,
      this.data,
      this.fromDeviceId,
      this.fromDevice,
      this.fromSubsystemId,
      this.fromAccountId,
      this.fromAccount,
      this.createdAt,
      this.lastModified,
      this.toProcedureId,
      this.toProcedure,
      this.acknowledgeStatus});

  EventLog.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    typeName = json['TypeName'];
    type = json['Type'] != null ? new Type.fromJson(json['Type']) : null;
    data = json['Data'];
    fromDeviceId = json['FromDeviceId'];
    fromDevice = json['FromDevice'] != null
        ? new FromDevice.fromJson(json['FromDevice'])
        : null;
    fromSubsystemId = json['FromSubsystemId'];
    fromAccountId = json['FromAccountId'];
    fromAccount = json['FromAccount'];
    createdAt = json['CreatedAt'];
    lastModified = json['LastModified'];
    toProcedureId = json['ToProcedureId'];
    toProcedure = json['ToProcedure'];
    acknowledgeStatus = json['AcknowledgeStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['TypeName'] = this.typeName;
    if (this.type != null) {
      data['Type'] = this.type.toJson();
    }
    data['Data'] = this.data;
    data['FromDeviceId'] = this.fromDeviceId;
    if (this.fromDevice != null) {
      data['FromDevice'] = this.fromDevice.toJson();
    }
    data['FromSubsystemId'] = this.fromSubsystemId;
    data['FromAccountId'] = this.fromAccountId;
    data['FromAccount'] = this.fromAccount;
    data['CreatedAt'] = this.createdAt;
    data['LastModified'] = this.lastModified;
    data['ToProcedureId'] = this.toProcedureId;
    data['ToProcedure'] = this.toProcedure;
    data['AcknowledgeStatus'] = this.acknowledgeStatus;
    return data;
  }
}

class Type {
  int name;
  String displayName;
  String displayNameLocalized;
  int securityLevel;
  Null securityLevelRelation;
  Null description;
  int control;

  Type(
      {this.name,
      this.displayName,
      this.displayNameLocalized,
      this.securityLevel,
      this.securityLevelRelation,
      this.description,
      this.control});

  Type.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    displayName = json['DisplayName'];
    displayNameLocalized = json['DisplayNameLocalized'];
    securityLevel = json['SecurityLevel'];
    securityLevelRelation = json['SecurityLevelRelation'];
    description = json['Description'];
    control = json['Control'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['DisplayName'] = this.displayName;
    data['DisplayNameLocalized'] = this.displayNameLocalized;
    data['SecurityLevel'] = this.securityLevel;
    data['SecurityLevelRelation'] = this.securityLevelRelation;
    data['Description'] = this.description;
    data['Control'] = this.control;
    return data;
  }
}

class FromDevice {
  int id;
  int parentSystemId;
  String externalId;
  String name;
  Null namelocalized;
  int type;
  Null typeRelation;
  String userName;
  String password;
  Null atLocationId;
  Null linkDeviceId;
  Null stream;
  Null latitude;
  Null longitude;
  Null description;
  int status;
  int control;

  FromDevice(
      {this.id,
      this.parentSystemId,
      this.externalId,
      this.name,
      this.namelocalized,
      this.type,
      this.typeRelation,
      this.userName,
      this.password,
      this.atLocationId,
      this.linkDeviceId,
      this.stream,
      this.latitude,
      this.longitude,
      this.description,
      this.status,
      this.control});

  FromDevice.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    parentSystemId = json['ParentSystemId'];
    externalId = json['ExternalId'];
    name = json['Name'];
    namelocalized = json['Namelocalized'];
    type = json['Type'];
    typeRelation = json['TypeRelation'];
    userName = json['UserName'];
    password = json['Password'];
    atLocationId = json['AtLocationId'];
    linkDeviceId = json['LinkDeviceId'];
    stream = json['Stream'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    description = json['Description'];
    status = json['Status'];
    control = json['Control'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ParentSystemId'] = this.parentSystemId;
    data['ExternalId'] = this.externalId;
    data['Name'] = this.name;
    data['Namelocalized'] = this.namelocalized;
    data['Type'] = this.type;
    data['TypeRelation'] = this.typeRelation;
    data['UserName'] = this.userName;
    data['Password'] = this.password;
    data['AtLocationId'] = this.atLocationId;
    data['LinkDeviceId'] = this.linkDeviceId;
    data['Stream'] = this.stream;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['Description'] = this.description;
    data['Status'] = this.status;
    data['Control'] = this.control;
    return data;
  }
}
