<?php namespace App\Controllers;

use CodeIgniter\API\ResponseTrait;
use App\Models\Users;
use App\Models\Parts;
use App\Models\Transactions;
use App\Models\SalesTransactions;

class Sales extends BaseController
{
	public function index()
	{
		$employeeId = session('employeeId');
		if (!$employeeId)
		{
			return redirect()->to('/login');
		}

		$users = new Users();
		$userId = $users->getUserId($employeeId);

		$transactions = new Transactions();
		$transactionId = $transactions->initSale($userId)['kode_transaksi'];

		return redirect()->to('/sale/' . $transactionId);
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

		$pages = new Pages();
		return $pages->index(
			'sale', // page
			'penjualan', // title
			$data, // data
			true,  // navbar
		);
	}

	use ResponseTrait;

	public function update(int $transactionId)
	{
		if ($_POST && $this->validate([
			'partId' => 'required|numeric',
			'qty' => 'required|greater_than[0]']))
		{
			$salesTransactions = new SalesTransactions();
			$cartItem = $salesTransactions->getItems($transactionId,
													$_POST['partId']);

			$currentQty = $cartItem ? $cartItem['qty'] : 0;
			$newQty = $currentQty + $_POST['qty'];

			$parts = new Parts();
			$het = $parts->getSparePart($_POST['partId'])['het'];

			$salesTransactions->addItem($transactionId,
									   $_POST['partId'],
									   $newQty,
									   $het);

			$parts = new Parts();
			$parts->updateStock($_POST['partId'],
								$_POST['qty']);

			return $this->respond(null, 200);
		}

		return $this->failValidationError('Parameter tidak valid.');
	}

	public function commit(int $transactionId)
	{
		$transactions = new Transactions();
		$data = $transactions->closeTransaction($transactionId);

		return $this->respond($data, 200);
	}

}
