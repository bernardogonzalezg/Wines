<?php
require_once 'libs/Router.php';
require_once 'Controller/CommentApiController.php';



// crea el router
$router = new Router();
// define la tabla de ruteo


$router->addRoute('comment', 'GET', 'CommentApiController', 'getComments');
$router->addRoute('comment/:ID', 'GET', 'CommentApiController', 'getComment');
$router->addRoute('comment', 'POST', 'CommentApiController', 'createComment');
$router->addRoute('comment/:ID', 'DELETE', 'CommentApiController', 'deleteComment');

// rutea
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
