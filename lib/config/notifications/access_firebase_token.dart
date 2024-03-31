import 'package:googleapis_auth/auth_io.dart';

class AccessTokenFirebase {
  static String firebaseMessagingScope =
      "https://www.googleapis.com/auth/firebase.messaging";
  static String firebaseCloudMessagingScope =
      "https://www.googleapis.com/auth/firebase.messaging";

  Future<String> getAccessToken() async {
    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson(
          {
            "type": "service_account",
            "project_id": "fir-app-48574",
            "private_key_id": "fa8368df881e24a9877df65a19fd5ea5496ba207",
            "private_key":
                "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCc96y8cjYCbly2\nuiuFuvpWls5oaSSMcDBnW96g73SbYDDG4Xd+WWhosmsW6M987z9tTnDQxwoVhLYx\np8Q8h5Y4VTzi28kq/qiDnrYvtYO1t/Ng9wMuDpi1GSgqT616WizUzoI9s8k7Av1b\n+678vCM8/aZMnLMt+yGVwAeySysG3lJouvbNjCG4qDhop2KanqSkB6ojataKdKWC\n0WyjTEgMCoigGYX+gRSgAK1C51d+Og1X3bkF1R3m+J1s+/BS1u+uM1sqZ8DEUjB8\nWssCe4lqPdRPUjq1YwVV2rpvmytg3IHLlTzjm+u8qXcfGoEW5gO9240QZx/4ObrU\noe5CJ87BAgMBAAECggEAAUuifXIoW7QHOBtYe1uwD/mh5bbzbiTJY3r8vwGG6fbc\n5DFNbAmnHNEXJOriNn7ffEKU2AZCgSu1mLqQmirIzLl4XYtwkTYllCOBz6o89mmY\nnLzhJfbJIBp/bDz42q0GmHGFXea/Uwk659DPkIapeEoEHrb+3BLp46tgbOJlriJx\nhmiPmFKrGuwg7rSSWXyclG4J1R9uvDGmOt1CoDeH73m9/sSowFEvKS9TzuMWwDSy\n8h28YgOUzDi216vjjACSGYhcxd/tK7WEQTCEnfxNaAKhpeutC5zR3fLevV1TiMl3\nh4Rl2HJbOn9n8HMIjZ3jvmdWwWzZdGNkaxsXltHGiQKBgQDPJXeJc3noqTvZZfyK\nCOAh5uWOVBqyxVguBUm2cKzGAsRdXVRFJkqM0DPOfLX3BUECnGTfM7BA+HodPHr3\nccPoC+QEJTtFonQvoMGqhsKUPF+Keca1lpLXtpKQEPSoyGsku5ocEUI1gWSVW7PR\nKiQ8GqJ21waddlYNx3NLRggCKQKBgQDB/KQKEky12h/xC4o4kFe2Xmp1qXD7xllh\nxVvveoz6E1262HCj9FieeV4864O56AvX4U9RkVFiQsvbLX7MUlELQNOaWrBVrUkq\nWiNORiiXUP5W01IlyjbWHFwDryP8ARovN+Q84SoAnB1zIxTNylnWK9nvlXHXpjqe\njq+UadFq2QKBgFXO43Gg0EM8t3oa8T4M5yukBjurQ1QCw8BsmFhm3Gs6AjXaz2nF\nruQd6xgCOS6WkpOOTYrYUo7XX151C0staUXahx3gfmkeHpsMMK1/HWNijwFB6LqY\nIUQScSwUmgTA4QFaZUBzNcYMT6o/ToG6vz/WmK457JeVyZfzoyLvY6nhAoGACH69\n2EsQ3O3edDnjJbL8hFoCI4D2F7CJ/YQdEJG3VsQ+WI5d8HAk6Vu7SsOtkxicXCnb\nxWCtxbXTI5gMc3ovXmTKX3oVOstJ5vbnkOf1oxrC6J58fHcsi5fWV7r1wnVx5ht2\nfUwHANvVVlN098YixQRKmPlccOswqfzpp4Ay0ZECgYBhrkYY8q0thcbdq0mCoMhL\nS7SxLEEjyH3H3JL7nKqtUDd1gJmpiCFqQb0BwcpfAXZoLPHqc6bB2Cjn9bwsJPEE\nffwkfZryLq2HL0HbH78AY+LLzb/ar/oWLUQW6H+JJvDWU3jjswUYtqTQgs/btJ1k\ntnDmasiTc8WAwNTIG/g7ig==\n-----END PRIVATE KEY-----\n",
            "client_email":
                "firebase-adminsdk-letxw@fir-app-48574.iam.gserviceaccount.com",
            "client_id": "108897108905197542686",
            "auth_uri": "https://accounts.google.com/o/oauth2/auth",
            "token_uri": "https://oauth2.googleapis.com/token",
            "auth_provider_x509_cert_url":
                "https://www.googleapis.com/oauth2/v1/certs",
            "client_x509_cert_url":
                "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-letxw%40fir-app-48574.iam.gserviceaccount.com",
            "universe_domain": "googleapis.com"
          },
        ),
        [firebaseMessagingScope]);
    final accestoKen = client.credentials.accessToken.data;
    return accestoKen;
  }
}
