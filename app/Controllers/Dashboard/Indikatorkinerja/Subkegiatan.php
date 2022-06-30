<?php

namespace App\Controllers\Dashboard\Indikatorkinerja;

use App\Controllers\BaseController;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use App\Models\Dashboard\Indikatorkinerja\SubkegiatanModel;
use Hermawan\DataTables\DataTable;

helper(['form', 'url']);


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
                    return '<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-lg" onclick="editIndikatorsub(' . $row->id_indikator_subkegiatan . ')" ><i class="fas fa-edit"></i></button>
                <button type="button" class="btn btn-danger btn-sm" onclick="deleteIndikatorsub(' . $row->id_indikator_subkegiatan . ')" ><i class="fas fa-trash"></i></button>';
                })
                ->toJson(true);
        }
        //dd($indikatorsubkegiatan);
        //json_encode($indikatorsubkegiatan);
    }

    public function getIndikatorSubkegiatanById()
    {
        $id_indikatorsubkegiatan = $_GET['id'];
        $indikatorsubkegiatan = $this->SubkegiatanModel->getIndikatorSubkegiatanById($id_indikatorsubkegiatan);
        echo json_encode($indikatorsubkegiatan);
    }

    public function updateindikatorsubkegiatan()
    {
        $data = array(
            'indikator_subkegiatan' => $this->request->getPost('Indikator_subkegiatan'),
            'satuan' => $this->request->getPost('satuan'),
            'target_2022' => $this->request->getPost('target2022'),
            'target_2023' => $this->request->getPost('target2023'),
            //'target_2023' => (int)preg_replace('/[^\d]/', '', $this->request->getPost('pagu')),
        );

        $this->SubkegiatanModel->updateindikatorsubkegiatan(array('id_indikator_subkegiatan' => $this->request->getPost('id')), $data);
        echo json_encode(array("status" => TRUE));
    }

    public function addindikatorsubkegiatan()
    {
        $data = array(
            'id_subkegiatan' => $this->request->getPost('id_subkegiatan'),
            'id_bidangbalai' => $this->request->getPost('id_bidangbalai'),
            'indikator_subkegiatan' => $this->request->getPost('Indikator_subkegiatan'),
            'satuan' => $this->request->getPost('satuan'),
            'target_2022' => $this->request->getPost('target2022'),
            'target_2023' => $this->request->getPost('target2023'),
            //'pagu_2022' => (int)preg_replace('/[^\d]/', '', $this->request->getPost('pagu')),
        );

        $this->SubkegiatanModel->addindikatorsubkegiatan($data);
        echo json_encode(array("status" => TRUE));
    }

    public function deleteIndikatorSubkegiatanById()
    {
        $id_indikatorsubkegiatan = $_GET['id'];

        $this->SubkegiatanModel->deleteindikatorsubkegiatan($id_indikatorsubkegiatan);
        echo json_encode(array("status" => TRUE));
    }
}
