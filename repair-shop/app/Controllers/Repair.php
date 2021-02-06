<?php namespace App\Controllers;

use CodeIgniter\API\ResponseTrait;
use App\Models\Users;
use App\Models\Parts;
use App\Models\Customers;
use App\Models\Transactions;
use App\Models\SalesTransactions;
use App\Models\RepairTransactions;

class Repair extends BaseController
{
	public function index()
	{
		$employeeId = session('employeeId');
		if (!$employeeId)
		{
			return redirect()->to('/login');
		}

		$pages = new Pages();
		return $pages->index(
			'repair', // page
			'perbaikan', // title
			[], // data
			true,  // navbar
		);
	}

	public function view(int $transactionId)
	{
		$employeeId = session('employeeId');
		if (!$employeeId)
		{
			return redirect()->to('/login');
		}

		$transactions = new Transactions();
		$data = $transactions->getTransactions($transactionId);

		$salesTransactions = new SalesTransactions();
		$data['cartItems'] = $salesTransactions->getItems($transactionId);

		// $repairTransactions = new RepairTransactions();
		// $data['serviceItems'] = $repairTransactions->getItems($transactionId);

		$data['serviceItems'] = null;
		$data['mekanik'] = [];

		$customers = new Customers;
		$data['customer'] = $customers->getCustomers($data['kode_pelanggan']);

		$pages = new Pages();
		return $pages->index(
			'repair', // page
			'perbaikan', // title
			$data, // data
			true,  // navbar
		);
	}

	// TODO: change to API?
	public function init()
	{
		if ($_POST && $this->validate([
			'police-no' => 'required',
			'complaint' => 'required']))
		{
			$customers = new Customers;
			$customerId = $customers->addCustomer($_POST['name'],
												  $_POST['police-no'],
												  $_POST['chassis-no'],
												  $_POST['machine-no'],
												  $_POST['contact'],
												  $_POST['address'],
												  $_POST['complaint'])['kode_pelanggan'];

			$users = new Users();
			$userId = $users->getUserId(session('employeeId'));

			$transactions = new Transactions();
			$transactionId = $transactions->initReparation($userId,
														   $customerId)['kode_transaksi'];

			return redirect()->to('/repair/' . $transactionId);
		}
	}

}
