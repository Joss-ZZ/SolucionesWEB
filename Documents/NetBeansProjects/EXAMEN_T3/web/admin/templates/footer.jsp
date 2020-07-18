  <footer class="main-footer parte2">
    <div class="float-right d-none d-sm-block">
      <b>Tienda</b>
    </div>
    <strong>Copyright &copy; 2020 <a href="#">tienda.com</a>.</strong> Todos los derechos reservados.
  </footer>

</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/EXAMEN_T3/admin/js/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/EXAMEN_T3/admin/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/EXAMEN_T3/admin/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/EXAMEN_T3/admin/js/demo.js"></script>
<!-- DataTables -->

<script src="/EXAMEN_T3/admin/js/jquery.dataTables.min.js"></script>
<script src="/EXAMEN_T3/admin/js/dataTables.bootstrap4.min.js"></script>
<script src="/EXAMEN_T3/admin/js/dataTables.responsive.min.js"></script>
<script src="/EXAMEN_T3/admin/js/responsive.bootstrap4.min.js"></script>


<script >
  $(function () {
    $("#example1").DataTable({
      "responsive": true,
      "autoWidth": false,
    });
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
</body>
</html>