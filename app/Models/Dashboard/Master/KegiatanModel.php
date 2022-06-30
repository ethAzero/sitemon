<?php

namespace App\Models\Dashboard\Master;

use CodeIgniter\Model;
use PHPSQLParser\Test\Parser\selectTest;

class KegiatanModel extends Model
{
    public function getindikator_kegiatan($id_kegiatan, $id_bidangbalai)
    {

        $query = $this->db->table('tb_indikator_kegiatan')
            ->select('id_indikator_kegiatan, indikator_kegiatan, satuan, target_2022, target_2023')
            ->where(['id_kegiatan' => $id_kegiatan, 'id_bidangbalai' => $id_bidangbalai]);

        //->select('indikator_subkegiatan')
        //->getWhere(['id_subkegiatan' => $id_subkegiatan, 'id_bidangbalai' => $id_bidangbalai])->getResultArray();
        //$builder->groupBy('id_subkegiatan');
        //$query = $builder->getWhere(['id_subkegiatan' => $id_subkegiatan, 'id_bidangbalai' => $id_bidangbalai])->getResultArray();
        return $query;
    }

    public function add_indikator_kegiatan($data)
    {
        $query = $this->db->table('tb_indikator_kegiatan')->insert($data);
        return $this->db->insertID();
    }

    public function update_indikator_kegiatan($id, $data)
    {
        $this->db->table('tb_indikator_kegiatan')->update($data, $id);
        return $this->db->affectedRows();
    }


    public function delete_indikator_kegatan_byId($id_indikatorkegiatan)
    {
        $this->db->table('tb_indikator_kegiatan')->delete(array('id_indikator_kegiatan' => $id_indikatorkegiatan));
    }

    public function get_indikator_kegiatan_byId($id_indikatorkegiatan)
    {
        $builder = $this->db->table('tb_indikator_kegiatan');
        $query = $builder->getWhere(['id_indikator_kegiatan' => $id_indikatorkegiatan])->getRow();
        return $query;
    }

    // Punya sub kegiatan
    public function getBidangbalai()
    {
        $builder = $this->db->table('tb_bidangbalai');
        $query = $builder->get()->getResultArray();
        return $query;
    }
    public function getProgramByBidangbalai($val)
    {
        $builder = $this->db->table('view_bidangbalai_detail');
        $builder->groupBy('id_program');
        $query = $builder->getWhere(['id_bidangbalai' => $val])->getResultArray();
        return $query;
    }
    public function getKegiatanByProgram($id_program, $id_bidangbalai)
    {
        $builder = $this->db->table('view_bidangbalai_detail');
        $builder->groupBy('id_kegiatan');
        $query = $builder->getWhere(['id_program' => $id_program, 'id_bidangbalai' => $id_bidangbalai])->getResultArray();
        return $query;
    }
    public function getSubkegiatanByKegiatan($val)
    {
        $builder = $this->db->table('view_bidangbalai_detail');
        $builder->groupBy('id_subkegiatan');
        $query = $builder->getWhere(['id_kegiatan' => $val])->getResultArray();
        return $query;
    }
    // public function getIndikatorSubkegiatanByBidangbalai($id_subkegiatan, $id_bidangbalai)
    // {
    //     $builder = $this->db->table('tb_indikator_subkegiatan');
    //     //->select('indikator_subkegiatan')
    //     //->getWhere(['id_subkegiatan' => $id_subkegiatan, 'id_bidangbalai' => $id_bidangbalai])->getResultArray();
    //     $builder->groupBy('id_subkegiatan');
    //     $query = $builder->getWhere(['id_subkegiatan' => $id_subkegiatan, 'id_bidangbalai' => $id_bidangbalai])->getResultArray();
    //     return $query;
    // }


}
