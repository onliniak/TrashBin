<?php namespace App\Controllers;

class Home extends BaseController
{
	public function index()
	{
		$domain = [
			'domain' => site_url(),
		];

		$this->response->setHeader('Link', "<{$domain['domain']}/auth>; rel='authorization_endpoint'")
					   ->appendHeader('Link', "<{$domain['domain']}/token>; rel='token_endpoint'")
					   ->appendHeader('Link', "<{$domain['domain']}/micropub>; rel='micropub_endpoint'");

		return view('welcome_message', $domain);
	}

}
