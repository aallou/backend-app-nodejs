var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  let users = [{"last_name":"Allou", "first_name": "Abdelhafid"},{"last_name":"ENSAO", "first_name": "GI4"}]
  res.send(users);
});

module.exports = router;
