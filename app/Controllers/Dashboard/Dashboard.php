<?php

namespace App\Controllers\Dashboard;

use App\Controllers\BaseController;

class Dashboard extends BaseController
{
    public function index()
    {
        $data = [
            'judul' => 'Dashboar | Sitemon',
        ];
        return view('dashboard/index', $data);
    }
}
