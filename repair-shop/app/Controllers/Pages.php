<?php namespace App\Controllers;

class Pages extends BaseController
{
	public function index(string $page,
						  string $title = '',
						  array $data = [],
						  bool $navbar = false,
						  string $style = '')
	{
		if (!is_file(APPPATH . '/Views/' . $page . '.php'))
		{
			throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
		}

		$parser = \Config\Services::parser();
		echo $parser->setData(['title' => $title,
							   'icon' => base_url('icons/site-icon.png'),
							   'bootstrapCss' => base_url('bootstrap/dist/css/bootstrap.min.css'),
							   'bootstrapJs' => base_url('bootstrap/dist/js/bootstrap.min.js'),
							   'mainCss' => base_url('styles/main.css'),
							   'customCss' => base_url('/styles/' . esc($style) . '.css')])
					->render('templates/header');

		if ($navbar)
		{
			echo $parser->setData(['defaultPage' => base_url('dashboard'),
							       'icon' => base_url('icons/site-icon.png'),
								   'userInfo' => ucfirst(session('permission')) . '/' . ucwords(session('employeeId')),
								   'logoutPage' => base_url('logout')])
						->render('templates/navbar');
		}

		$data['title'] = ucfirst($title);
		echo view($page, $data);

		echo $parser->setData(['footer' => session('employeeId'),
							   'icons' => base_url('feather.min.js')])
					->render('templates/footer');
	}

}
