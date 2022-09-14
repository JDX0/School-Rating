<?php

namespace App\Controllers;

class SchoolController extends BaseController{

	function __construct() {
        $this->model = new \App\Models\SchoolModel();;
    }

    public function index() {
		$data["count"] = $this->model->count();
        $data["nazvy"] = $this->model->listSchools();
        return view('index', $data);
    }

    public function booksPaginated($n) {
        $pagedArray = array_chunk($this->model->listBooksPaginated(), 30, true);
        $page = $pagedArray[$n-1];
        $data["book"] = $page;
        $data["page"] = $n;
        $data["maxpage"] = sizeof($pagedArray);
        return view('indexPaginated', $data);
    }

    public function deleteBook($id) {
		$this->model->deleteBook($id);
        return $this->booksPaginated(1);
    }
}
