
/*
 * GET home page.
 */
const path = require('path');

exports.index = function(req, res){
	res.sendFile(path.join(__dirname, '../public/contents', 'index.html'));
};
