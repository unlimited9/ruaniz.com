
/*
 * GET home page.
 */
const express = require('express'),
	path = require('path'),
	realm = require('realm');
	
let PostSchema = {
	name: 'Post',
	properties: {
		timestamp: 'date',
		title: 'string',
		content: 'string'
	}
};

var blogRealm = new realm({
	path: 'data/blog.realm',
	schema: [PostSchema]
});

var router = express.Router();

router.get('/', (req, res) => {
	let posts = blogRealm.objects('Post').sorted('timestamp', true);
	res.render('blog/index.ejs', {posts: posts});
});
router.get('/write', (req, res) => {
	res.sendFile(path.join(__dirname, '../public/contents/blog', 'write.html'));
//	res.sendFile('write.html', { root: path.join(__dirname, '../public/contents/blog') });
});
router.post('/write', (req, res) => {
	let title = req.body['title'],
	content = req.body['content'],
	timestamp = new Date();
	blogRealm.write(() => {
		blogRealm.create('Post', {title: title, content: content, timestamp: timestamp});
	});

	res.sendFile(path.join(__dirname, '../public/contents/blog', 'write-complete.html'));
});

module.exports = router;