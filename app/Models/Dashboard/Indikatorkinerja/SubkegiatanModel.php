<?php

namespace App\Models\Dashboard\Indikatorkinerja;

use CodeIgniter\Model;

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
}
