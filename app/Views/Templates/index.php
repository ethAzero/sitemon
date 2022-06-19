<!DOCTYPE html>
<html lang="en">

<?= $this->include('Templates/header'); ?>

<body class="hold-transition sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">
        <!-- Navbar -->
        <?= $this->include('Templates/navbar'); ?>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <?= $this->include('Templates/mainsidebar'); ?>

        <!-- Content Wrapper. Contains page content -->
        <?= $this->renderSection('page-content'); ?>
        <!-- /.content-wrapper -->

        <?= $this->include('Templates/footer'); ?>
    </div>
    <!-- ./wrapper -->

    <!-- jQuery -->
    <script src="<?= base_url("assets/template") ?>/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="<?= base_url("assets/template") ?>/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Select2 -->
    <script src="<?= base_url("assets/template") ?>/plugins/select2/js/select2.full.min.js"></script>
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
    <!-- AdminLTE App -->
    <script src="<?= base_url("assets/template") ?>/dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="<?= base_url("assets/template") ?>/dist/js/setup.js"></script>
    <!-- Fontawesom Kit -->
    <script src="https://kit.fontawesome.com/3b53d4c589.js" crossorigin="anonymous"></script>
    <!-- Page specific script -->
    <script>
        //Initialize Select2 Elements
        $('.select2').select2()

        $(function() {
            $("#example1").DataTable({
                "responsive": true,
                "lengthChange": false,
                "autoWidth": false,
                "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
            }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
        });
    </script>
</body>

</html>