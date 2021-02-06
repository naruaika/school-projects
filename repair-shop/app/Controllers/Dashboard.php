<?php namespace App\Controllers;

use App\Models\Transactions;

class Dashboard extends BaseController
{
	public function index()
	{
		$employeeId = session('employeeId');
		if (!$employeeId)
		{
			return redirect()->to('/login');
		}

		$transactions = new Transactions();
		$data['reparations'] = $transactions->getReparations($employeeId);
		$data['purchases'] = $transactions->getSales($employeeId);

		$pages = new Pages();
		return $pages->index(
			'dashboard/cashier', // page
			'dasbor', // title
			$data, // data
			true,  // navbar
		);
	}

}
