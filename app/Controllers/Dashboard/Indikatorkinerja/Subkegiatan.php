<?php

namespace App\Controllers\Dashboard\Indikatorkinerja;

use App\Controllers\BaseController;
use App\Models\Dashboard\Indikatorkinerja\SubkegiatanModel;
use Hermawan\DataTables\DataTable;

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
    // public function getIndikatorSubkegiatanByBidangbalai()
    // {
    //     $id_subkegiatan = $_GET['subKegaiatanVal'];
    //     $id_bidangbalai = $_GET['bidangbalaiVal'];
    //     $indikatorsubkegiatan = $this->SubkegiatanModel->getIndikatorSubkegiatanByBidangbalai($id_subkegiatan, $id_bidangbalai);
    //     echo json_encode($indikatorsubkegiatan);
    // }

    public function getIndikatorSubkegiatanByBidangbalai()
    {
        $id_subkegiatan = $_GET['subKegaiatanVal'];
        $id_bidangbalai = $_GET['bidangbalaiVal'];
        // $id_subkegiatan = 2;
        // $id_bidangbalai = 6;
        if ($this->request->isAJAX()) {
            $indikatorsubkegiatan = $this->SubkegiatanModel->getIndikatorSubkegiatanByBidangbalai($id_subkegiatan, $id_bidangbalai);
            return DataTable::of($indikatorsubkegiatan)
                ->add('action', function ($row) {
                    return '<button type="button" class="btn btn-primary btn-sm" onclick="editIndikatorsub(' . $row->id_indikator_subkegiatan . ')" ><i class="fas fa-edit"></i></button>
                    <button type="button" class="btn btn-danger btn-sm" onclick="alert(\'edit customer: ' . $row->id_indikator_subkegiatan . '\')" ><i class="fas fa-trash"></i></button>';
                })
                ->toJson(true);
        }

        //dd($indikatorsubkegiatan);
    }
}
