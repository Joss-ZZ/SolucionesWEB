<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
      <img src="/EXAMEN_T3/admin/img/AdminLTELogo.png"
           alt="Tienda Logo"
           class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">TIENDA</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="info">
            <p id="menuadmin">MENÚ DE ADMINISTRACIÓN</p>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
  
          
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/ControladorProducto?accion=Listar" class="nav-link">
              <i class="fas fa-user-tie nav-icon"></i>
              <p>
                Mantener Productos
              </p>
            </a>
          </li>
          
          <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ControladorCategoria?accion=Listar" class="nav-link">
              <i class="fas fa-user-tie nav-icon"></i>
              <p>
                Mantener Categoria
              </p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/ControladorMarca?accion=Listar" class="nav-link">
              <i class="fas fa-user-tie nav-icon"></i>
              <p>
                Mantener Marca
              </p>
            </a>
          </li>
          
           <li class="nav-item">
            <a href="${pageContext.request.contextPath}/ControladorUnidad?accion=Listar" class="nav-link">
              <i class="fas fa-user-tie nav-icon"></i>
              <p>
                Mantener Unidad
              </p>
            </a>
          </li>

          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/ControladorCliente?accion=ListarCliente" class="nav-link">
              <i class="fas fa-users nav-icon"></i>
              <p>
                Consultar Clientes
              </p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/ControladorReporteprodtienda?accion=Listar_reporteventaproducto"  class="nav-link" class="nav-link">
              <i class="fas fa-users nav-icon"></i>
              <p>
                Consultar Ventas
              </p>
            </a>
          </li>
          
         <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="fas fa-user-tie nav-icon"></i>
              <p>
                REPORTES GENERALES
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/ControladorReporteprodtienda?accion=Listar" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>PRODUCTOS DE LA TIENDA</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/ControladorReporteprodtienda?accion=Listar_marcacategoria" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                   <p>REPORTE DETALLE CARRITO</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/ControladorReporteprodtienda?accion=Listar_productomasvendido" class="nav-link" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>PRODUCTOS MAS VENDIDOS</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/ControladorReporteprodtienda?accion=Listar_reporteproductocliente" class="nav-link" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>REPORTE VENTAS POR CLIENTE</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/ControladorReporteprodtienda?accion=Listar_reportegeneral" class="nav-link" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>REPORTE VENTA GENERAL</p>
                </a>
              </li>
              
            </ul>
          </li>
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>