<?= $this->extend('Templates/index'); ?>

<?= $this->section('page-content'); ?>

<!-- SweetAlert2 -->
<link rel="stylesheet" href="<?= base_url("assets/template") ?>/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
<!-- Toastr -->
<link rel="stylesheet" href="<?= base_url("assets/template") ?>/plugins/toastr/toastr.min.css">

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1><?= $judul2; ?></h1>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Bidang / Balai</label>
                                    <select name="bidangbalai" id="bidangbalai" class="form-control select2" style="width: 100%;" required onchange="getProgram(this.value)">
                                        <?php foreach ($bidangbalai as $bidangbalai) : ?>
                                            <option value="<?= $bidangbalai['id_bidangbalai']; ?>"><?= $bidangbalai['bidangbalai']; ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label>Program</label>
                                    <label for="program">Program</label>
                                    <select name="program" id="program" class="form-control select2" style="width: 100%;" onchange="getKegiatan(this.value)">
                                    </select>
                                </div>
                                <!-- /.col -->
                            </div>
                            <div class="row">
                                <div class="col-md-6 mt-2">
                                    <label>Kegiatan</label>
                                    <select name="kegiatan" id="kegiatan" class="form-control select2" style="width: 100%;" onchange="getIndikatorKegiatan(this.value)">
                                    </select>
                                </div>
                                <!-- /.col -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="row justify-content-between">
                                <div class="col-md-6">
                                    <h3 class="card-title">Indikator <?= $judul2; ?></h3>
                                </div>
                                <div class="col-auto"><button type="button" class="btn btn-success btn-sm" onclick="addData()"><i class="fas fa-folder-plus"> </i> Tambah Data</button></div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div id="data-sub-kegiatan"></div>
                            <table id="tabelindikatorkegiatan" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Indikator Kegiatan</th>
                                        <th>Satuan</th>
                                        <th>Target 2022</th>
                                        <th>Target 2023</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Indikator Kegiatan</th>
                                        <th>Satuan</th>
                                        <th>Target 2022</th>
                                        <th>Target 2023</th>
                                        <th>Aksi</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->

        <div class="modal fade" id="modal-lg">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Default form group -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Form Indikator <?= $judul2; ?></h3>
                            </div>
                            <form action="#" id="form_indikator_kegiatan" class="form-horizontal">
                                <div class="card-body">
                                    <input type="hidden" value="" name="id" />
                                    <input type="hidden" value="" name="id_bidangbalai" />
                                    <input type="hidden" value="" name="id_kegiatan" />
                                    <div class="form-group">
                                        <label class="control-label col-md-12">Indikator Kegiatan</label>
                                        <input name="Indikator_kegiatan" placeholder="Indikator Sub Kegiatan" class="form-control" type="text">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-12">Satuan</label>
                                        <input name="satuan" placeholder="Satuan" class="form-control" type="text">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-12">Target 2022</label>
                                        <input name="target2022" placeholder="Target Tahun 2022" class="form-control formatnumber" type="text">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-12">Target 2023</label>
                                        <input name="target2023" placeholder="Target Tahun 2023" class="form-control formatnumber" type="text">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- Default form group -->
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="save()">Save</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script src="<?= base_url("assets/template") ?>/plugins/jquery/jquery.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="<?= base_url("assets/template") ?>/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<?= base_url("assets/template") ?>/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<?= base_url("assets/template") ?>/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="<?= base_url("assets/template") ?>/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="<?= base_url("assets/template") ?>/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="<?= base_url("assets/template") ?>/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="<?= base_url("assets/template") ?>/plugins/jszip/jszip.min.js"></script>
<script src="<?= base_url("assets/template") ?>/plugins/pdfmake/pdfmake.min.js"></script>
<script src="<?= base_url("assets/template") ?>/plugins/pdfmake/vfs_fonts.js"></script>
<script src="<?= base_url("assets/template") ?>/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="<?= base_url("assets/template") ?>/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="<?= base_url("assets/template") ?>/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- format numbering -->
<script src="<?= base_url("assets/template") ?>/plugins/jquery-number-master/jquery.number.js"></script>
<!-- SweetAlert2 -->
<script src="<?= base_url("assets/template") ?>/plugins/sweetalert2/sweetalert2.all.min.js"></script>
<!-- Toastr -->
<script src="<?= base_url("assets/template") ?>/plugins/toastr/toastr.min.js"></script>
<!-- jquery-validation -->
<script src="<?= base_url("assets/template") ?>/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="<?= base_url("assets/template") ?>/plugins/jquery-validation/additional-methods.min.js"></script>

<script>
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': 'jF4aREBbgXk33J3kbX6hfrvZAualnwjTGHEB0fZA'
        }
    });

    function loader(id) {
        $(id).html('<center><img width="100px" height="100px" src="<?= base_url() ?>/loaders.gif" /> <br /><br /> <h2>memuat data..</h2></center>');
    }

    function removeLoader(id) {
        $(id).html("");
    }

    let bidangbalaiVal = () => $('#bidangbalai').val();
    let programVal = () => $('#program').val();
    let kegiatanVal = () => $('#kegiatan').val();
    var save_method;

    $('.formatnumber').number(true, 0, ',', '.');

    // mengambil data Program 
    function getProgram(val) {
        $.ajax({
            type: "GET",
            url: "<?= base_url('getProgramByBidangbalai') ?>",
            data: {
                bidangbalaiVal: val
            },
            dataType: "json",
            beforeSend: function() {
                $("#data-kegiatan").html("");
            },
            error: function() {
                $('#program').append($('<option>').val("").text(" ~~~ Data Tidak Ditemukan ~~~"));
            },
            success: function(data) {
                let options = document.getElementById('program');
                $('option', options).remove();
                for (let i = 0; i < data.length; i++) {
                    options[options.length] = new Option(data[i].program, data[i].id_program);
                }
            }
        }).then(function() {
            getKegiatan(programVal());
        })
    }

    // mengambil data Kegiatan 
    function getKegiatan(val) {
        $.ajax({
            type: "GET",
            url: "<?= base_url('getKegiatanByProgram') ?>",
            data: {
                programVal: val,
                bidangbalaiVal: bidangbalaiVal()
            },
            dataType: "json",
            beforeSend: function() {
                $("#data-sub-kegiatan").html("");
                loader("#data-sub-kegiatan");
            },
            error: function() {
                $('#kegiatan').append($('<option>').val("").text(" ~~~ Data Tidak Ditemukan ~~~"));
                let options = document.getElementById('subKegiatan');
                $('option', options).remove();
                $('#subKegiatan').append($('<option>').val("").text(" ~~~ Data Tidak Ditemukan ~~~"));
            },
            success: function(data) {
                let options = document.getElementById('kegiatan');
                $('option', options).remove();
                for (let i = 0; i < data.length; i++) {
                    options[options.length] = new Option(data[i].kegiatan, data[i].id_kegiatan);
                }
                removeLoader("#data-sub-kegiatan");
            }
        }).then(function() {
            getIndikatorKegiatan(kegiatanVal());
        })
    }


    // load datatable dengan data indikator sub kegiatan baik tampilan awal maupun ketika pilihan select berubah
    function loaddatatable(val) {
        dataindikatorkeg = $('#tabelindikatorkegiatan').DataTable({
            destroy: true,
            processing: true,
            serverSide: true,
            //scrollX: true,
            ajax: {
                url: '<?= base_url('getIndikatorkegiatanByBidangbalai ') ?>',
                type: 'GET',
                data: function(d) {
                    d.kegiatanVal = val;
                    d.bidangbalaiVal = bidangbalaiVal;
                },
            },
            columns: [{
                    data: "indikator_kegiatan"
                },
                {
                    data: "satuan"
                },
                {
                    data: "target_2022",
                    render: $.fn.dataTable.render.number('.', ',', 0, ''),
                    className: "text-center",
                },
                {
                    data: "target_2023",
                    render: $.fn.dataTable.render.number('.', ',', 0, ''),
                    className: "text-right",
                },
                {
                    data: "action",
                    orderable: false,
                    className: "text-center",
                },
            ],
        });
    }

    //load datatable
    function getIndikatorKegiatan(val) {
        loaddatatable(val)
    };

    //mengambil data indikator sub kegiatan berdasarkan id yang ditampilkan pada form
    function editIndikatorkeg(id) {
        save_method = 'update';
        $.ajax({
            type: "GET",
            url: "<?= base_url('getIndikatorkegiatanById') ?>",
            data: {
                id: id
            },
            dataType: "json",
            beforeSend: function() {
                $("#data-sub-kegiatan").html("");
                loader("#data-sub-kegiatan");
            },
            error: function() {
                $('#subKegiatan').append($('<option>').val("").text(" ~~~ Data Tidak Ditemukan ~~~"));
            },
            success: function(data) {
                $('[name="id"]').val(data.id_indikator_kegiatan);
                $('[name="Indikator_kegiatan"]').val(data.indikator_kegiatan);
                $('[name="satuan"]').val(data.satuan);
                $('[name="target2022"]').val(data.target_2022);
                $('[name="target2023"]').val(data.target_2023);
                removeLoader("#data-sub-kegiatan");
            }
        })
    }

    //menambah data indikator sub kegiatan    
    function addData() {
        //alert("woy");
        save_method = 'add';
        $('#form_indikator_kegiatan')[0].reset(); // reset form on modals
        $('[name="id_bidangbalai"]').val(bidangbalaiVal);
        $('[name="id_kegiatan"]').val(kegiatanVal);
        $('#modal-lg').modal('show'); // show bootstrap modal
    }

    //hapus data indikator sub kegiatan
    function deleteIndikatorkeg(id) {
        Swal.fire({
            title: 'Yakin',
            text: "Data Tidak Dapat Dikembalikan",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "<?= base_url('deleteIndikatorkegiatanById') ?>",
                    type: "GET",
                    data: {
                        id: id
                    },
                    dataType: "JSON",
                    success: function(data) {
                        //if success close modal and reload ajax table
                        Swal.fire(
                            'Deleted!',
                            'Data Telah Dihapus.',
                            'success'
                        )
                        loaddatatable(kegiatanVal); // refresh datatable
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        alert('Error adding / update data');
                    }
                });
            }
        })
    }

    //metode simpan perubahan / data baru indikator sub kegiatan
    function save() {
        var url;
        if (save_method == 'add') {
            url = "<?= base_url('addindikatorkegiatan') ?>";
            method = "Ditambahkan";
        } else {
            url = "<?= base_url('updateindikatorkegiatan') ?>";
            method = "Diubah";
        }

        if ($('#form_indikator_kegiatan').valid()) {
            $.ajax({
                url: url,
                type: "POST",
                data: $('#form_indikator_kegiatan').serialize(),
                dataType: "JSON",
                success: function(data) {
                    //if success close modal and reload ajax table
                    $('#modal-lg').modal('hide');
                    Swal.fire(
                        'Berhasil!',
                        'Indikator Sub Kegiatan Berhasil di ' + method,
                        'success'
                    )
                    loaddatatable(kegiatanVal); // refresh datatable
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert('Error adding / update data');
                }
            });
        }
    }



    $(document).ready(function() {
        getProgram(bidangbalaiVal());

        $('#form_indikator_kegiatan').validate({
            rules: {
                Indikator_kegiatan: {
                    required: true
                },
                satuan: {
                    required: true
                },
                target2022: {
                    required: true,
                    number: true
                },
                target2023: {
                    required: true,
                    number: true
                },
            },
            messages: {
                Indikator_kegiatan: "Indikator Kegiatan Tidak Boleh Kosong",
                satuan: "Satuan Tidak Boleh Kosong",
                target2022: {
                    required: "Target Tidak Boleh Kosong",
                    number: "Harus Berupa Angka"
                },
                target2023: {
                    required: "Target Tidak Boleh Kosong",
                    number: "Harus Berupa Angka"
                },
            },
            errorElement: 'span',
            errorPlacement: function(error, element) {
                error.addClass('invalid-feedback');
                element.closest('.form-group').append(error);
            },
            highlight: function(element, errorClass, validClass) {
                $(element).addClass('is-invalid');
            },
            unhighlight: function(element, errorClass, validClass) {
                $(element).removeClass('is-invalid');
            }
        });
        // $("#bidangbalai").change(function() {
        //     getProgram(bidangbalaiVal());
        // });

        // $("#program").change(function() {
        //     getKegiatan(programVal());
        // });

        // $("#kegiatan").change(function() {
        //     getSubKegiatan(kegiatanVal());
        // });

        // $("#subKegiatan").change(function() {
        //     getIndikatorSubKegiatan(subKegaiatanVal());
        // });
    });
</script>

<?= $this->endSection(); ?>