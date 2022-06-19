<?php

namespace App\Controllers\Dashboard\Indikatorkinerja;

use App\Controllers\BaseController;
use App\Models\Dashboard\Indikatorkinerja\SubkegiatanModel;

class Subkegiatan extends BaseController
{
    protected $SubkegiatanModel;

    public function __construct()
    {
        $this->SubkegiatanModel = new SubkegiatanModel();
    }

    public function index()
    {
        $bidangbalai = $this->SubkegiatanModel->getBidangbalai();
        // dd($program);
        $data = [
            'judul' => 'Sub Kegiatan',
            'bidangbalai' => $bidangbalai,
        ];
        return view('Dashboard/Indikatorkinerja/Subkegiatan', $data);
    }

    public function getProgramByBidangbalai()
    {
        $data = $_GET['bidangbalaiVal'];
        $program = $this->SubkegiatanModel->getProgramByBidangbalai($data);

        echo json_encode($program);
    }
    public function getKegiatanByProgram()
    {
        $id_program = $_GET['programVal'];
        $id_bidangbalai = $_GET['bidangbalaiVal'];
        $kegiatan = $this->SubkegiatanModel->getKegiatanByProgram($id_program, $id_bidangbalai);
        echo json_encode($kegiatan);
    }
    public function getSubkegiatanByKegiatan()
    {
        $data = $_GET['kegiatanVal'];
        $subkegiatan = $this->SubkegiatanModel->getSubkegiatanByKegiatan($data);
        echo json_encode($subkegiatan);
    }
}
