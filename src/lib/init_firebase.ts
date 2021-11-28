import _ from 'lodash'
import { getApps, initializeApp } from '@firebase/app'

// must refer as process.env.NEXT_XXX
// see https://nextjs.org/docs/basic-features/environment-variables
const config = {
  apiKey: process.env.NEXT_PUBLIC_API_KEY,
  authDomain: process.env.NEXT_PUBLIC_AUTH_DOMAIN,
  projectId: process.env.NEXT_PUBLIC_PROJECT_ID,
  storageBucket: process.env.NEXT_PUBLIC_STORAGE_BUCKET,
  messagingSenderId: process.env.NEXT_PUBLIC_MESSAGING_SENDER_ID,
  appId: process.env.NEXT_PUBLIC_APP_ID,
}

let app
if (_.isEmpty(getApps())) app = initializeApp(config)

export default app
