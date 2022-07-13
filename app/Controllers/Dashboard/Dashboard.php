<?php

namespace App\Controllers\Dashboard;

use App\Controllers\BaseController;

class Dashboard extends BaseController
{
    public function index()
    {
        $data = [
            'judul1' => 'Dashboar | Sitemon',
        ];
        return view('dashboard/index', $data);
    }
}
