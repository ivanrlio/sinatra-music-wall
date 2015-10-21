Sinatra
=============

Brought to you by Lighthouse Labs

## Getting Started

1. `bundle install`
2. `shotgun -p 3000 -o 0.0.0.0`
3. Visit `http://localhost:3000/` in your browser


<!-- styling for sqlite3 -->
.headers on
.mode column
.width 30


<!-- seed data -->
<!-- usernames -->
User.create username: "FatCat", first_name: "Ivan", last_name: "Rickard Liow", password: "FatCat"

User.create username: "PrincessMarmaya", first_name: "Stephen", last_name: "Slade", password: "PrincessMarmaya"

<!-- song names -->
Song.create title: 'ABGT150 Sydney: A&B', artist: 'Above & Beyond', url: 'https://www.youtube.com/watch?v=DDQWoe8AoUs' 

Song.create title: 'ABGT150 Sydney: Grum', artist: 'Grum', url: 'https://www.youtube.com/watch?v=N9vtb7ke0lM'