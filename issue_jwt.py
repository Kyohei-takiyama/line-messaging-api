import jwt
from jwt.algorithms import RSAAlgorithm
import time

# 出力した自分の秘密鍵をコピーして貼り付ける
privateKey = {
  "alg": "RS256",
  "d": "*******************",
  "dp": "*******************",
  "dq": "*******************",
  "e": "*******************",
  "kty":"*******************",
  "n": "*******************",
  "p": "*******************",
  "q": "*******************",
  "qi": "*******************",
  "use": "sig"
}

headers = {
    "alg": "RS256",
    "typ": "JWT",
    "kid": "*******************",
}

# ここにChannel IDを入れる
payload = {
  "iss": "**********", # Console から Channel ID を取得
  "sub": "**********", # Console から Channel ID を取得
  "aud": "https://api.line.me/",
  "exp":int(time.time())+(60 * 30),
  "token_exp": 60 * 60 * 24 * 30
}

key = RSAAlgorithm.from_jwk(privateKey)

JWT = jwt.encode(payload, key, algorithm="RS256", headers=headers, json_encoder=None)
print(JWT)