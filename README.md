# 前提
- AWSの認証情報（config）が設定されていること
- dockerがインストールされていること
- makeがインストールされていること

# 環境構築

### 構築コマンド
```
make docker-build
```

# makeコマンド

### CloudFormationのコードチェック
```
make cfn-lint
```

### dockerコンテナに接続
```
make bash
```

### AWSのネットワーク関連のリソースをデプロイ
```
make deploy-net ENV=dev PROFILE=dev
```
ENV: 環境名（デフォルト->dev）

PROFILE: AWSのプロファイル（デフォルト->dev）