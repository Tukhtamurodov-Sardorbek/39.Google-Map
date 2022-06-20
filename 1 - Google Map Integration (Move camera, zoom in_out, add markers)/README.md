# ```🗺Google map integration🗺```

- ```📷 Move camera```
- ```🔍 Zoom in & zoom out```
- ```📌 Add markers```

1. [Open Google Console](https://console.cloud.google.com/)
2. Create a new project => Open the project
3. Open Google Maps Platform from the side bar
4. Click Maps SDK for Android => Enable
5. Open Credentials from APIs & Services in Side Bar Menu
6. Create Credentials => Choose API key
7. Copy the key to use it in Android Manifest file
8. Put the following code inside the application:
   <meta-data
   android:name="com.google.android.geo.API_KEY"
   android:value="PASTE KEY HERE"/>
9. [Install the plugin for google map support](https://pub.dev/packages/google_maps_flutter)
