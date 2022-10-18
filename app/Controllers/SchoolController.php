<?php

namespace App\Controllers;
use CodeIgniter\Controller;

class SchoolController extends Controller{
	function __construct() {
        $this->model = new \App\Models\SchoolModel();;
    }

    public function index() {
		$data["count"] = $this->model->count();
        $data["nazvy"] = $this->model->listSchools();
        return view('index', $data);
    }

    public function schools() {
		$data["count"] = $this->model->count();
        $data["skoly"] = $this->model->listSchools();
        return view('schools', $data);
    }

    public function test() {
		//$data["count"] = $this->model->count();
        //$data["skoly"] = $this->model->listSchools();
    return view('n/index'/*, $data*/);
    }

    public function school($name) {
        $data["info"] = $this->model->getSchool($name);
        $data["comments"] = $this->model->getSchoolComments($data["info"][0]->id);
        return view('school', $data);
    }

    public function editComment($id) {
        $data["comments"] = $this->model->getComment($id);
        return view('editComment', $data);
    }

    public function schoolById($id) {
        $data["info"] = $this->model->getSchoolById($id);
        $data["comments"] = $this->model->getSchoolComments($id);
        return view('school', $data);
    }

    public function submitComment($id) {
        $this->model->submitComment($id,$this->request->getPost('commentText'));
        return $this->schoolById($id);
    }

    public function updateComment($id) {
        $this->model->updateComment($id,$this->request->getPost('commentText'));
        return $this->schools();
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
