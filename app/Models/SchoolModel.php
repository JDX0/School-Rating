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

	function getSchoolComments($id)
	{
		$builder = $this->db->table('comments');
		$builder->select('text,id');
		$builder->where('school_id', $id);
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
	function deleteAuthor($id)
	{
		$builder = $this->db->table('kniha');
		$builder->where('autor_idautor', $id);
		$builder->delete();
		$builder = $this->db->table('autor');
		$builder->where('idautor', $id);
		$builder->delete();
	}
	function listBooksPaginated()
	{
		$builder = $this->db->table('kniha');
		$builder->select('nazev,datumVydani,hodnoceni,zanr_idZanr,jmeno,prijmeniA,idautor');
		$builder->join('autor', 'autor.idautor = kniha.autor_idautor');

		$data = $builder->get()->getResult();

		return $data;
	}
	function listBooksByAuthor($id)
	{
		$builder = $this->db->table('kniha');
		$builder->select('nazev,datumVydani,hodnoceni,zanr_idZanr');
		$builder->where('autor_idautor=', $id);

		$data = $builder->get()->getResult();

		return $data;
	}

	function author($id)
	{
		$builder = $this->db->table('autor');
		$builder->select('jmeno,prijmeniA,idautor,datumNarozeni,pohlavi,zeme,zivy');
		$builder->where('idautor=', $id);
		$data = $builder->get()->getResult();

		return $data;
	}
	function listBooksByAuthorName($id)
	{
		$builder = $this->db->table('kniha');
		$builder->select('nazev,datumVydani,hodnoceni,zanr_idZanr,jmeno');
		$builder->join('autor', 'autor.idautor = kniha.autor_idautor');
		$split = explode(" ", $id);
		$builder->where('jmeno', $split[0]);
		$builder->where('prijmeniA', $split[1]);

		$data = $builder->get()->getResult();

		return $data;
	}

	function authorName($id)
	{
		$builder = $this->db->table('autor');
		$split = explode(" ", $id);
		$builder->select('jmeno,prijmeniA,idautor,datumNarozeni,pohlavi,zeme,zivy');
		$builder->where('jmeno', $split[0]);
		$builder->where('prijmeniA', $split[1]);

		$data = $builder->get()->getResult();

		return $data;
	}

	function book($id)
	{
		$builder = $this->db->table('kniha');
		$builder->select('nazev,nazevN,datumVydani,pocetStran,zanr_idZanr,jmeno,prijmeniA,nazevZ');
		$builder->join('autor', 'autor.idautor = kniha.autor_idautor');
		$builder->join('nakladatelstvi', 'kniha.nakladatelstvi_idNakladatelstvi = nakladatelstvi.idNakladatelstvi');
		$builder->join('zanr', 'kniha.zanr_idZanr = zanr.idZanr');
		$builder->where('nazev', $id);

		$data = $builder->get()->getResult();

		return $data;
	}
}
