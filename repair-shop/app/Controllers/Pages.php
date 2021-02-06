<?php namespace App\Controllers;

class Pages extends BaseController
{
	public function index(string $page,
						  string $title = '',
						  array $data = [],
						  bool $navbar = false,
						  string $style = null)
	{
		if (!is_file(APPPATH . '/Views/' . $page . '.php'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$data['title'] = ucwords($title);
		$data['style'] = $style;

		echo view('templates/header', $data);
		if ($navbar)
		{
			echo view('templates/navbar');
		}
		echo view($page, $data);
		echo view('templates/footer', $data);
	}

}
