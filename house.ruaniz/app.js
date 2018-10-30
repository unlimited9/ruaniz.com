/**
 * 
 */
'use strict';

const express = require('express'),
	bodyParser = require('body-parser');

var config = require('./config.js'),
	routes = require('./routes'),
	blog = require('./routes/blog.js');

var app = express();

//all environments
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({extended: true}));

//route
app.get('/', routes.index);
app.use('/blog', blog);

//development only
if ('development' == app.get('env')) {
//	app.use(express.errorHandler);
}

//error handling
app.use((req, res, next) => { // 404 처리 부분
	res.status(404).send('일치하는 주소가 없습니다!');
});
app.use((err, req, res, next) => { // 에러 처리 부분
	console.error(err.stack); // 에러 메시지 표시
	res.status(500).send('서버 에러!'); // 500 상태 표시 후 에러 메시지 전송
});

app.listen(app.get('port'), function() {
	console.log('Environment '+ app.get('env'));
	console.log('Express server listening on port ' + app.get('port'));
});
/*
http.createServer(app).listen(app.get('port'), function(){
	console.log('Environment '+ app.get('env'));
	console.log('Express server listening on port ' + app.get('port'));
});
*/
