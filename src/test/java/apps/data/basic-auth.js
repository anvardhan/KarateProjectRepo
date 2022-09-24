function BasicAuth(creds) {
  var baseAuthInfo = creds.username + ':' + creds.password;
  var Base64 = Java.type('java.util.Base64');
  var encoded = Base64.getEncoder().encodeToString(baseAuthInfo.toString().getBytes());
  return 'Basic ' + encoded;
}

