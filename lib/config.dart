class Config {
  static const kDebugMode = true;

  // TODO: Add models/schemas and generator
  static const guestOfflineUser = {
    "username": "guest_offline_root",
    "department": "Cyber Security Unit",
    "password": "",
    "access": "666",
    "family": "root",
    "type": "offline",
    "permissions": [
      "OFFLINE_AUTHORISATION",
    ]
  };
}
