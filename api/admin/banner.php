<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
              Banner Management
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#"> Banner</a></li>
                <li class="active"> Banner</li>
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
                            <h3 class="box-title">Add New Banner</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form action="action.php" method="post" enctype="multipart/form-data">
						
                            <div class="box-body">
								<div class="form-group">
                                    <label>Banner Link (URL)</label>
                                   <input type="text" class="form-control" name="url" required>
                                </div>
								
								<div class="form-group">
                                    <label>Banner Image Size Width : 1280 px * Height :720 px</label>
                                   <input type="file" class="form-control" name="pic" accept="image/*" onchange="loadFile(event)" required>
								   <img id="output" style="width:300px; height:200px" />
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
										<button  name="banner_add"  class="btn btn-primary"> <i class="fa fa-plus-circle" aria-hidden="true"></i> Add Banner</button>
                                            
                                        </div>
                                  
                                </div>
                        </form>
						
						
						
                    </div> 
					
					<div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Banner List</h3>
                        </div>
                       
                            <div class="box-body">
								<table class="table">
									<tr>
									<th>Sl.No</th>
									<th>URL </th>
									<th>Image</th>
									<th>Update</th>
									<th>Delete</th>
									</tr>
									<?php
									$res_cat=mysqli_query($con,"SELECT * FROM banner_admin")or die("Query error");
									$i=1;
									while($row_cat=mysqli_fetch_array($res_cat))
									{
										echo '<tr>';
										echo'<form method="POST" action="action.php" enctype="multipart/form-data">
										<input type="hidden" name="ban_ai" value="'.$row_cat['ban_ai'].'">
										<input type="hidden" name="unlink" value="../banners_admin/'.$row_cat['pic'].'">
										';
									echo '<td>'.$i++.'</td>';
									echo '<td><input type="text" name="url" class="form-control" value="'.$row_cat['url'].'"></td>';
									echo '<td><img src="../banners_admin/'.$row_cat['pic'].'" class="img-thumbnail" style="width:200px;height:100px">
									<input type="file" name="pic"></td>';
									echo '<td><button name="banner_edit" class="btn btn-info"  >Update </button></td>';
									echo '<td><button name="banner_delete" class="btn btn-danger"  >Delete </button></td>';
									echo '</form></tr>';
									}
									
									?>
								</table>
                                  
                                </div>
                      

                </div>

            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <?php include "include/footer.php" ?>
