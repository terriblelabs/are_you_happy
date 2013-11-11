are_you_happy
=============

Get rolling on heroku

1. git clone https://github.com/terriblelabs/are_you_happy
2. cd are_you_happy
3. heroku create
4. git push heroku master
5. heroku run rake db:migrate
6. heroku config:add QUOTE_SOURCE="startrek+simpsons_ralph+simpsons_homer" FLICKR_API_KEY=XXXXXXX
6. heroku open
