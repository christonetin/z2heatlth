<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Change Password
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Change Password</li>
            </ol>
        </section>
        <style>
        .grid_9 {
            height: 35px;
            margin-bottom: 20px;
            width: 800px;
            margin-left: 25%;
        }

        .info_error {
            background-color: #fbfbfb;
            border: 1px solid #cccccc;
            cursor: pointer;
            display: block;
            font-size: 14px !important;
            height: 40px;
            margin-bottom: 50px !important;
            margin-top: 5px;
            overflow: hidden;
            padding: 0 !important;
            width: 800px;
        }

        #error .info_inner {
            color: green;
            text-align: center;
            font-weight: bolder;
            font-size: 16px;
        }

        .info_error .info_inner {
            color: #003333;
            display: block;
            height: 30px;
            padding: 5px 10px 0 35px;
        }
        </style>

        <script src="scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
        <script type="text/javascript" language="javascript">
        $("#success_msg").delay(4000).fadeOut(100);
        </script>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- left column -->
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Update Password</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
					<form name="f1" action="action.php" method="post"  onsubmit="return matchpass()">
					<input type="hidden" class="form-control" name="id" value="<?php echo$row['id']?>">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">User Name</label>
                                   <input type="text" name="user_name"  class="form-control" required>
                                </div> 
								<div class="form-group">
                                    <label for="exampleInputEmail1">Current Password</label>
                                   <input type="password" name="old_pass"  class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>New Password</label>
                                   <input type="password" name="npwd" id="npwd" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Confirm Password</label>
                                   <input type="password" name="cpwd" id="cpwd"  class="form-control" required>
                                </div>
					
                            </div>
                            <!-- /.box-body -->

                            <div class="box-footer">
                                <button class="btn btn-primary" name="change_pass">Change Password</button>
                            </div>
                        </form>
						<script type="text/javascript">  
				function matchpass(){  
				var firstpassword=document.f1.npwd.value;  
				var secondpassword=document.f1.cpwd.value;  
				  
				if(firstpassword==secondpassword){  
				return true;  
				}  
				else{  
				alert("password must be same!");  
				return false;  
				}  
				}  
				</script>  
			
                    </div>
                    <!-- /.box -->

                </div>

            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <?php include "include/footer.php" ?>

    <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- page script -->

</body>

</html>