<?php namespace App\Controllers;
	use BarnabyWalters\Mf2;

class Auth extends BaseController
{
	public function index()
	{
		$method = $this->request->getMethod();

		if ($method === 'get')
		{
			$this->authentication();
		}
		elseif ($method === 'post')
		{
			$this->authorization();
		}
	}

	public function authentication()
	{
		$clientId    = $this->request->getGet('client_id', FILTER_SANITIZE_URL);
		$redirectUri = $this->request->getGet('redirect_uri', FILTER_SANITIZE_URL);
		$state       = $this->request->getGet('state');

		$db      = db_connect();
		$builder = $db->table('Auth');
		$builder->select();
		$builder->where('client_id', $clientId);
		$query = $builder->get();

		$code           = openssl_random_pseudo_bytes(24);
		$redirectServer = $redirectUri . '?code=' . $code . '&state=' . $state;

		if (! empty($query->getResult()))
		{
			return redirect($redirectServer);
		}
		elseif (empty($query->getResult()))
		{
			$myProfile = $this->request->getGet('me', FILTER_SANITIZE_URL);
			$this->request->getGet('response_type', FILTER_SANITIZE_STRING) || 'id' ;

			if ($myProfile === site_url() &&
			parse_url($clientId, PHP_URL_SCHEME) === parse_url($redirectUri, PHP_URL_SCHEME) &&
			parse_url($clientId, PHP_URL_PORT) === parse_url($redirectUri, PHP_URL_PORT) &&
			parse_url($clientId, PHP_URL_HOST) === parse_url($redirectUri, PHP_URL_HOST)
			)
			{
				$mf2     = Mf2\fetch($clientId);
				$hasLogo = Mf2\getPlaintext($mf2, 'u-logo');
				$hasName = Mf2\getPlaintext($mf2, 'p-name');
			}
			$array = [
				'logo'     => $hasLogo,
				'name'     => $hasName,
				'me'       => $myProfile,
				'who'      => $clientId,
				'redirect' => $redirectServer,
			];
			echo view('Auth', $array);
		}
	}
}
