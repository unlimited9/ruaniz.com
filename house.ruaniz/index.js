/**
 * 
 */
'use strict';

var express = require('express'),
    bodyParser = require('body-parser'),
    realm = require('realm');

let PostSchema = {
		name: 'Post',
		properties: {
			timestamp: 'date',
			title: 'string',
			content: 'string'
		}
};

var blogRealm = new Realm({
	path: 'data/blog.realm',
	schema: [PostSchema]
});

var app = express();
app.use(bodyParser.urlencoded({extended: true}));
app.set('view engine', 'ejs');

app.get('/', function(req, res) {
	  let posts = blogRealm.objects('Post').sorted('timestamp', true);
	  res.render('index.ejs', {posts: posts});
});

app.get('/write', function(req, res) {
  res.sendFile(__dirname + "/public/contents/blog/write.html");
});
app.post('/write', function(req, res) {
	let title = req.body['title'],
	    content = req.body['content'],
	    timestamp = new Date();
	blogRealm.write(() => {
		blogRealm.create('Post', {title: title, content: content, timestamp: timestamp});
	});
	res.sendFile(__dirname + "/public/contents/blog/write-complete.html");
});
app.listen(3000, function() {
  console.log("application started...");
});
