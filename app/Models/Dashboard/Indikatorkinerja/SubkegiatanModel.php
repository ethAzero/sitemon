<?php

namespace App\Models\Dashboard\Indikatorkinerja;

use CodeIgniter\Model;
use PHPSQLParser\Test\Parser\selectTest;

class SubkegiatanModel extends Model
{
    // protected $table      = 'tb_program';
    // protected $primaryKey = 'id_program';
    public function getBidangbalai()
    {
        $builder = $this->db->table('tb_bidangbalai');
        $query = $builder->get()->getResultArray();
        return $query;
    }
    public function getProgramByBidangbalai($val)
    {
        $builder = $this->db->table('view_bidangbalai_memiliki');
        $builder->groupBy('id_program');
        $query = $builder->getWhere(['id_bidangbalai' => $val])->getResultArray();
        return $query;
    }
    public function getKegiatanByProgram($id_program, $id_bidangbalai)
    {
        $builder = $this->db->table('view_bidangbalai_memiliki');
        $builder->groupBy('id_kegiatan');
        $query = $builder->getWhere(['id_program' => $id_program, 'id_bidangbalai' => $id_bidangbalai])->getResultArray();
        return $query;
    }
    public function getSubkegiatanByKegiatan($val)
    {
        $builder = $this->db->table('view_bidangbalai_memiliki');
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

    public function getIndikatorSubkegiatanByBidangbalai($id_subkegiatan, $id_bidangbalai)
    {

        $query = $this->db->table('tb_indikator_subkegiatan')
            ->select('id_indikator_subkegiatan, indikator_subkegiatan, satuan, target_anggaran2023, pagu_anggaran2023')
            ->where(['id_subkegiatan' => $id_subkegiatan, 'id_bidangbalai' => $id_bidangbalai]);

        //->select('indikator_subkegiatan')
        //->getWhere(['id_subkegiatan' => $id_subkegiatan, 'id_bidangbalai' => $id_bidangbalai])->getResultArray();
        //$builder->groupBy('id_subkegiatan');
        //$query = $builder->getWhere(['id_subkegiatan' => $id_subkegiatan, 'id_bidangbalai' => $id_bidangbalai])->getResultArray();
        return $query;
    }

    public function getIndikatorSubkegiatanById($id_indikatorsubkegiatan)
    {
        $builder = $this->db->table('tb_indikator_subkegiatan');
        $query = $builder->getWhere(['id_indikator_subkegiatan' => $id_indikatorsubkegiatan])->getRow();
        return $query;
    }


    public function updateindikatorsubkegiatan($id, $data)
    {
        $this->db->table('tb_indikator_subkegiatan')->update($data, $id);
        return $this->db->affectedRows();
    }

    public function addindikatorsubkegiatan($data)
    {
        $query = $this->db->table('tb_indikator_subkegiatan')->insert($data);
        return $this->db->insertID();
    }

    public function deleteindikatorsubkegiatan($id_indikatorsubkegiatan)
    {
        $this->db->table('tb_indikator_subkegiatan')->delete(array('id_indikator_subkegiatan' => $id_indikatorsubkegiatan));
    }
}
