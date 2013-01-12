# Setting
1. create Heroku app
```sh
heroku create
```

2. create [Facebook app](https://developers.facebook.com/apps)
3. set facebook app info
```sh
heroku config:add FB_APP_ID="YOUR APP ID"
heroku config:add FB_APP_SECRET="YOUR APP SECRET"
heroku config:add FB_ACCESS_TOKEN="YOUR ACCESS TOKEN"
```
