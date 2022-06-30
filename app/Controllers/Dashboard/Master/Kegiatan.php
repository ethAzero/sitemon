<?php

namespace App\Controllers\Dashboard\Master;

use App\Controllers\BaseController;
use App\Models\Dashboard\Master\KegiatanModel;
use App\Models\Dashboard\Master\SubkegiatanModel;
use Hermawan\DataTables\DataTable;

helper(['form', 'url']);


class Kegiatan extends BaseController
{
    protected $KegiatanModel;

    public function __construct()
    {
        $this->KegiatanModel = new KegiatanModel();
    }

    public function index()
    {
        $bidangbalai = $this->KegiatanModel->getBidangbalai();
        // dd($program);
        $data = [
            'judul1' => 'Master Kegiatan',
            'judul2' => 'Kegiatan',
            'bidangbalai' => $bidangbalai,
        ];
        return view('Dashboard/Master/Kegiatan', $data);
    }

    public function getindikator_kegiatan()
    {
        $id_kegiatan = $_GET['kegiatanVal'];
        $id_bidangbalai = $_GET['bidangbalaiVal'];
        if ($this->request->isAJAX()) {
            $indikatorkegiatan = $this->KegiatanModel->getindikator_kegiatan($id_kegiatan, $id_bidangbalai);
            return DataTable::of($indikatorkegiatan)
                ->add('action', function ($row) {
                    return '<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-lg" onclick="editIndikatorkeg(' . $row->id_indikator_kegiatan . ')" ><i class="fas fa-edit"></i></button>
                <button type="button" class="btn btn-danger btn-sm" onclick="deleteIndikatorkeg(' . $row->id_indikator_kegiatan . ')" ><i class="fas fa-trash"></i></button>';
                })
                ->toJson(true);
        }
    }

    public function add_indikator_kegiatan()
    {
        $data = array(
            'id_kegiatan' => $this->request->getPost('id_kegiatan'),
            'id_bidangbalai' => $this->request->getPost('id_bidangbalai'),
            'indikator_kegiatan' => $this->request->getPost('Indikator_kegiatan'),
            'satuan' => $this->request->getPost('satuan'),
            'target_2022' => (int)preg_replace('/[^\d]/', '', $this->request->getPost('target2022')),
            'target_2023' => (int)preg_replace('/[^\d]/', '', $this->request->getPost('target2023')),
        );

        $this->KegiatanModel->add_indikator_kegiatan($data);
        echo json_encode(array("status" => TRUE));
    }

    public function update_indikator_kegiatan()
    {
        $data = array(
            'indikator_kegiatan' => $this->request->getPost('Indikator_kegiatan'),
            'satuan' => $this->request->getPost('satuan'),
            'target_2022' => (int)preg_replace('/[^\d]/', '', $this->request->getPost('target2022')),
            'target_2023' => (int)preg_replace('/[^\d]/', '', $this->request->getPost('target2023')),
        );

        $this->KegiatanModel->update_indikator_kegiatan(array('id_indikator_kegiatan' => $this->request->getPost('id')), $data);
        echo json_encode(array("status" => TRUE));
    }

    public function get_indikator_kegiatan_byId()
    {
        $id_indikatorkegiatan = $_GET['id'];
        $indikatorkegiatan = $this->KegiatanModel->get_indikator_kegiatan_byId($id_indikatorkegiatan);
        echo json_encode($indikatorkegiatan);
    }

    public function delete_indikator_kegatan_byId()
    {
        $id_indikatorkegiatan = $_GET['id'];

        $this->KegiatanModel->delete_indikator_kegatan_byId($id_indikatorkegiatan);
        echo json_encode(array("status" => TRUE));
    }

    // punya subkegiatan
    ///////////////////////
    ///////////////////////
    ///////////////////////
    public function getProgramByBidangbalai()
    {
        $data = $_GET['bidangbalaiVal'];
        $program = $this->KegiatanModel->getProgramByBidangbalai($data);

        echo json_encode($program);
    }
    public function getKegiatanByProgram()
    {
        $id_program = $_GET['programVal'];
        $id_bidangbalai = $_GET['bidangbalaiVal'];
        $kegiatan = $this->KegiatanModel->getKegiatanByProgram($id_program, $id_bidangbalai);
        echo json_encode($kegiatan);
    }
    public function getSubkegiatanByKegiatan()
    {
        $data = $_GET['kegiatanVal'];
        $subkegiatan = $this->KegiatanModel->getSubkegiatanByKegiatan($data);
        echo json_encode($subkegiatan);
    }
    // public function getIndikatorSubkegiatanByBidangbalai()
    // {
    //     $id_subkegiatan = $_GET['subKegaiatanVal'];
    //     $id_bidangbalai = $_GET['bidangbalaiVal'];
    //     $indikatorsubkegiatan = $this->SubkegiatanModel->getIndikatorSubkegiatanByBidangbalai($id_subkegiatan, $id_bidangbalai);
    //     echo json_encode($indikatorsubkegiatan);
    // }





}
