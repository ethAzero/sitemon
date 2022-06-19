<?= $this->extend('Templates/index'); ?>

<?= $this->section('page-content'); ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>DataTables</h1>
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
                                    <select name="subKegiatan" id="subKegiatan" class="form-control select2" style="width: 100%;">
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
                            <h3 class="card-title">DataTable with default features</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Rendering engine</th>
                                        <th>Browser</th>
                                        <th>Platform(s)</th>
                                        <th>Engine version</th>
                                        <th>CSS grade</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Trident</td>
                                        <td>Internet
                                            Explorer 4.0
                                        </td>
                                        <td>Win 95+</td>
                                        <td> 4</td>
                                        <td>X</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Rendering engine</th>
                                        <th>Browser</th>
                                        <th>Platform(s)</th>
                                        <th>Engine version</th>
                                        <th>CSS grade</th>
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
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script src="<?= base_url("assets/template") ?>/plugins/jquery/jquery.min.js"></script>
<script>
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': 'jF4aREBbgXk33J3kbX6hfrvZAualnwjTGHEB0fZA'
        }
    });

    function loader(id) {
        $(id).html('<center><img width="100px" height="100px" src="https://2022.ctl.jatengprov.go.id/media/image/loaders.gif" /> <br /><br /> <h2>memuat data..</h2></center>');
    }

    function removeLoader(id) {
        $(id).html("");
    }

    let bidangbalaiVal = () => $('#bidangbalai').val();
    let programVal = () => $('#program').val();
    let kegiatanVal = () => $('#kegiatan').val();



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
            }
        })
    }

    $(document).ready(function() {
        getProgram(bidangbalaiVal());
        // $("#subKegiatan").change(function() {
        //     getIndikatorSubKegiatan(subKegaiatanVal());
        // });

        // $("#kegiatan").change(function() {
        //     getSubKegiatan(kegiatanVal());
        // });

        // $("#program").change(function() {
        //     getKegiatan(programVal());
        // });

    });
</script>

<?= $this->endSection(); ?>