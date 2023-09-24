<?php namespace App\Controllers;

class DatabaseCreate extends BaseController
{
	public function index()
	{
		db_connect();
		$forge = \Config\Database::forge();

		if ($forge->createDatabase('my_db', true))
		{
			$this->auth();
			$this->token();
			$this->categories();
			$this->users();
			$this->syndicates();
			$this->micropub();
		}
	}

	public function auth()
	{
		$fields = [
			'client_id' => [
				'type'       => 'VARCHAR',
				'constraint' => 64,
			],
			'code'      => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'timestamp' => [
				'type'       => 'INT',
				'constraint' => 10,
			],
			'POST'      => [
				'type'       => 'INT',
				'constraint' => 1,
				'default'    => 0,
			],
			'PUT'       => [
				'type'       => 'INT',
				'constraint' => 1,
				'default'    => 0,
			],
			'REMOVE'    => [
				'type'       => 'INT',
				'constraint' => 1,
				'default'    => 0,
			],
			'RESTORE'   => [
				'type'       => 'INT',
				'constraint' => 1,
				'default'    => 0,
			],
		];
		$forge->addField('id');
		$forge->addField($fields);
		$forge->createTable('Auth', true);
	}

	public function token()
	{
		$fieldsToken = [
			'client_id' => [
				'type'       => 'VARCHAR',
				'constraint' => 64,
			],
			'token'     => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
		];
		$forge->addField('id');
		$forge->addField($fieldsToken);
		$forge->createTable('Token', true);
	}

	public function categories()
	{
		$fieldsToken = [
			'postID'   => [
				'type'       => 'VARCHAR',
				'constraint' => 64,
			],
			'category' => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
		];
		$forge->addField('id');
		$forge->addField($fieldsToken);
		$forge->createTable('Categories', true);
	}

	public function users()
	{
		$fieldsToken = [
			'p-name' => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'p-note' => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'u-photo' => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'u-url'  => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
		];
		$forge->addField('id');
		$forge->addField($fieldsToken);
		$forge->createTable('Users', true);
	}

	public function syndicates()
	{
		$fieldsToken = [
			'userID'  => [
				'type'       => 'VARCHAR',
				'constraint' => 64,
			],
			'uid'     => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'name'    => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			's-name'  => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			's-url'   => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			's-photo' => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
		];
		$forge->addField('id');
		$forge->addField($fieldsToken);
		$forge->createTable('Syndicates', true);
	}

	public function micropub()
	{
		$fieldsMicropub = [
			'client_id'       => [
				'type'       => 'VARCHAR',
				'constraint' => 64,
			],
			'title'           => [
				'type'       => 'VARCHAR',
				'constraint' => 64,
			],
			'content'         => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'visibility'      => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'h-type'          => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'mp-slug'         => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'photo'           => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'photo-alt'       => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'name'            => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'summary'         => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'updated'         => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'in-reply-to'     => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'like-of'         => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'repost-of'       => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'mp-syndicate-to' => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'video'           => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'audio'           => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'post-status'     => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
			'location'        => [
				'type'       => 'VARCHAR',
				'constraint' => 32,
			],
		];
		$forge->addField('id');
		$forge->addField($fieldsMicropub);
		$forge->createTable('Micropub', true);
	}
}
