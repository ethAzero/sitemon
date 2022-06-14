<?php

namespace App\Controllers;

class Dashboard extends BaseController
{
    public function getIndex()
    {
        return view('dashboard/index');
    }

    public function getRegister()
    {
        return view('auth/register');
    }
}
