<?php
require_once "./Model/CommentModel.php";
require_once "./View/ProductView.php";





class CommentsController{

    
    private $modelComment;
    private $view;

    function __construct(){
    
    
        $this->modelComment = new CommentModel();
        $this->view = new ProductView();

    }

}
