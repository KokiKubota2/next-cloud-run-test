## 事前準備と Cloud Build のトリガーの設定

### API の有効化

- Cloud Build API
- Cloud Run Admin API
- Container Registry API
- Firebase Management API
- Firebase Hosting API
- Cloud Resource Manager API

https://console.cloud.google.com/flows/enableapi?apiid=cloudbuild.googleapis.com,run.googleapis.com,containerregistry.googleapis.com,firebase.googleapis.com,firebasehosting.googleapis.com,cloudresourcemanager.googleapis.com

### 必要な IAM

`@cloudbuild.gserviceaccount.com` に下記権限を付与する

- Cloud Build サービス アカウント
- Cloud Run 管理者
- Codelab ApiKeys 管理者
- Firebase Admin SDK 管理者サービス エージェント
- Firebase 管理者
- サービス アカウント ユーザー
- ストレージ管理

### firebase コミュニティ ビルダーの設定

- 「firebase コミュニティ ビルダーの使用」の項目を実行

https://cloud.google.com/build/docs/deploying-builds/deploy-firebase#using_the_firebase_community_builder

この際に
`gcloud config set project YOUR_PROJECT_ID`
で対象のプロジェクトを変更しておく必要あり。

### Cloud Build のトリガーの設定

- 追加する変数
  - \_PROJECT_NAME
  - \_DEPLOY_REGION
  - \_NEXT_PUBLIC_API_KEY
  - \_NEXT_PUBLIC_AUTH_DOMAIN
  - \_NEXT_PUBLIC_PROJECT_ID
  - \_NEXT_PUBLIC_STORAGE_BUCKET
  - \_NEXT_PUBLIC_MESSAGING_SENDER_ID
  - \_NEXT_PUBLIC_APP_ID

### Cloud Run

- 新規で作成されたサービスを選択
- トリガー、認証、未認証の呼び出しを許可に変更

#### 参照サイト

- https://cloud.google.com/build/docs/deploying-builds/deploy-cloud-run
- https://cloud.google.com/build/docs/deploying-builds/deploy-firebase
