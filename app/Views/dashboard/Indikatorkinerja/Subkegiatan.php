<?= $this->extend('Templates/index'); ?>

<?= $this->section('page-content'); ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1><?= $judul; ?></h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">DataTables</li>
                    </ol>
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
                                    <select name="kegiatan" id="kegiatan" class="form-control select2" style="width: 100%;" onchange="getSubKegiatan(this.value)">
                                    </select>
                                </div>
                                <div class="col-md-6 mt-2">
                                    <label>Sub Kegiatan</label>
                                    <select name="subKegiatan" id="subKegiatan" class="form-control select2" style="width: 100%;" onchange="getIndikatorSubKegiatan(this.value)">
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
                            <h3 class="card-title">Indikator Sub Kegiatan</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div id="data-sub-kegiatan"></div>
                            <table id="tabelindikatorsubkegiatan" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Indikator Sub Kegiatan</th>
                                        <th>Satuan</th>
                                        <th>Target Tahun 2023</th>
                                        <th>Pagu Anggaran 2023</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Indikator Sub Kegiatan</th>
                                        <th>Satuan</th>
                                        <th>Target Tahun 2023</th>
                                        <th>Pagu Anggaran 2023</th>
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
                        <h4 class="modal-title">Edit Indikator Sub Kegiatan</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Default form group -->
                        <form>
                            <!-- Default input -->
                            <div class="form-group">
                                <label for="formGroupExampleInput">Indikator Sub Kegiatan</label>
                                <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Example input">
                            </div>
                            <!-- Default input -->
                            <div class="form-group">
                                <label for="formGroupExampleInput2">Satuan</label>
                                <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input">
                            </div>
                        </form>
                        <!-- Default form group -->
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
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
    let subKegaiatanVal = () => $('#subKegiatan').val();


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
            }
        }).then(function() {
            getSubKegiatan(kegiatanVal());
        })
    }

    function getSubKegiatan(val) {
        $.ajax({
            type: "GET",
            url: "<?= base_url('getSubkegiatanByKegiatan') ?>",
            data: {
                kegiatanVal: val
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
                let options = document.getElementById('subKegiatan');
                $('option', options).remove();
                for (let i = 0; i < data.length; i++) {
                    $('#subKegiatan').append($('<option>').val(data[i].id_subkegiatan).text(data[i].subkegiatan));
                }
                removeLoader("#data-sub-kegiatan");
            }
        }).then(function() {
            getIndikatorSubKegiatan(subKegaiatanVal());
        })
    }

    function loaddatatable(val) {
        dataindikaorsub = $('#tabelindikatorsubkegiatan').DataTable({
            destroy: true,
            processing: true,
            serverSide: true,
            //scrollX: true,
            ajax: {
                url: '<?= base_url('getIndikatorSubkegiatanByBidangbalai ') ?>',
                type: 'GET',
                data: function(d) {
                    d.subKegaiatanVal = val;
                    d.bidangbalaiVal = bidangbalaiVal;
                },
            },
            columns: [{
                    data: "indikator_subkegiatan"
                },
                {
                    data: "satuan"
                },
                {
                    data: "target_anggaran2023",
                    className: "text-center",
                },
                {
                    data: "pagu_anggaran2023",
                    render: $.fn.dataTable.render.number('.', ',', 0, ''),
                    className: "text-right",
                },
                {
                    data: "action",
                    orderable: false
                },
            ],
        });
    }

    function getIndikatorSubKegiatan(val) {
        loaddatatable(val)
    };

    function editIndikatorsub(id) {
        $.ajax({
            type: "GET",
            url: "<?= base_url('getSubkegiatanByKegiatan') ?>",
            data: {
                kegiatanVal: id
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
                let options = document.getElementById('subKegiatan');
                $('option', options).remove();
                for (let i = 0; i < data.length; i++) {
                    $('#subKegiatan').append($('<option>').val(data[i].id_subkegiatan).text(data[i].subkegiatan));
                }
                removeLoader("#data-sub-kegiatan");
            }
        })
    }

    $(document).ready(function() {
        getProgram(bidangbalaiVal());

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