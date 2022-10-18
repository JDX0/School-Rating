<?php

namespace App\Models;

class SchoolModel
{

	var $db;
	function __construct()
	{
		$this->db = \Config\Database::connect();
		$this->pager = \Config\Services::pager();
	}

	function listSchools()
	{
		$builder = $this->db->table('skola as s');
		$builder->select('s.nazev,s.id,s.fotografie,s.link_skoly,m.nazev as mesto_nazev');
		$builder->join('mesto as m', 'm.id = s.mesto_id', 'left');
		$data = $builder->get()->getResult();

		return $data;
	}

	function getSchool($name)
	{
		$builder = $this->db->table('skola as s');
		$builder->select('s.nazev,s.id,s.fotografie,s.link_skoly,m.nazev as mesto_nazev');
		$builder->join('mesto as m', 'm.id = s.mesto_id', 'left');
		$builder->where('s.nazev', $name);
		$data = $builder->get()->getResult();

		return $data;
	}
	function getSchoolById($id)
	{
		$builder = $this->db->table('skola as s');
		$builder->select('s.nazev,s.id,s.fotografie,s.link_skoly,m.nazev as mesto_nazev');
		$builder->join('mesto as m', 'm.id = s.mesto_id', 'left');
		$builder->where('s.id', $id);
		$data = $builder->get()->getResult();

		return $data;
	}
	function submitComment($id,$text)
	{
		$builder = $this->db->table('comments');
		$data = [
			'school_id' => $id,
			'text'  => $text,
		];
		$builder->insert($data);
	}

	function updateComment($id,$text)
	{
		$builder = $this->db->table('comments');
		$data = [
			'id' => $id,
			'text'  => $text,
		];
		$builder->update($data);
	}

	function getSchoolComments($id)
	{
		$builder = $this->db->table('comments');
		$builder->select('text,id');
		$builder->where('school_id', $id);
		$data = $builder->get()->getResult();
		return $data;
	}
	function getComment($id)
	{
		$builder = $this->db->table('comments');
		$builder->select('text,id');
		$builder->where('id', $id);
		$data = $builder->get()->getResult();
		return $data;
	}
	function count()
	{
		$builder = $this->db->table('skola');
		$data = $builder->countAll();
		return $data;
	}
	function deleteBook($id)
	{
		$builder = $this->db->table('kniha');
		$builder->where('nazev', $id);
		$builder->delete();
	}
}
