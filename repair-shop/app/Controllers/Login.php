<?php namespace App\Controllers;

use App\Models\Users;

class Login extends BaseController
{
	public function index()
	{
		if (session('employeeId'))
		{
			return redirect()->to('/');
		}

		$data = [];

		if ($_POST && $this->validate([
			'employee-id' => 'required',
			'password'  => 'required']))
		{
			$employeeId = $_POST['employee-id'];
			$password = $_POST['password'];

			$users = new Users();

			$employee = $users->getUsers($employeeId, $password);

			if ($employee)
			{
				session()->set([
					'employeeId' => $employeeId,
					'permission' => $employee['hak_akses']
				]);

				return redirect()->to('/dashboard');
			}
			else
			{
				$data['error'] = true;
			}
		}

		helper('form');

		$pages = new Pages();
		return $pages->index(
			'login', // page
			'masuk', // title
			$data, // data
			false, // navbar
			'login' // style
		);
	}

}
