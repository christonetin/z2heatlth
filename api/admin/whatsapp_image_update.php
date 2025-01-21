
<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
               Add Managament
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">  Add Managament</a></li>
                <li class="active">  Add Managament</li>
            </ol>
        </section>

       
        <script src="scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
        <script type="text/javascript" language="javascript">
        $("#success_msg").delay(4000).fadeOut(100);
        </script>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- left column -->
                <div class="col-md-9" style="margin-left:10%;margin-right:10%;">
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Update Whatsapp Image</h3>
                        </div>
                       
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form action="action.php" method="post" enctype="multipart/form-data">
						<input type="hidden" name="unlink" value="../banners_admin/<?php echo $row_admin['whatsapp_pic']?>">
                            <div class="box-body">
								
								
								<div class="form-group">
                                    <label>Image</label>
                                   <input type="file" class="form-control" name="pic" accept="image/*" onchange="loadFile(event)" required>
								   <img id="output" src="../banners_admin/<?php echo $row_admin['whatsapp_pic']?>" style="width:300px; height:200px" />
										<script>
										  var loadFile = function(event) {
											var output = document.getElementById('output');
											output.src = URL.createObjectURL(event.target.files[0]);
											output.onload = function() {
											  URL.revokeObjectURL(output.src) // free memory
											}
										  };
										</script>
                                </div>
							
								
                                        <div class="box-footer">
										<button  name="update_img_whatsapp"  class="btn btn-primary"> <i class="fa fa-plus" aria-hidden="true"></i> Update Image</button>
                                            
                                        </div>
                                  
                                </div>
                        </form>
						
                    </div> 
				

            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <?php include "include/footer.php" ?>
