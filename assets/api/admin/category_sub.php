<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
               Category Managament
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#"> Category</a></li>
                <li class="active"> Category</li>
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
                            <h3 class="box-title">Add Sub Category</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form action="action.php" method="post" enctype="multipart/form-data">
						 <input type="hidden" class="form-control" value="<?php echo $u_id?>" name="u_id" >
                            <div class="box-body">
								<div class="form-group">
                                    <label>Main Category</label>
                                   <select name="maincat" class="form-control" id="" required>
                                            <option value=" ">--SELECT--</option>
                                            <?php
                                            $res_cat=mysqli_query($con,"SELECT * FROM category")or die("Query error");
                                            $i=1;
                                            while($row_cat=mysqli_fetch_array($res_cat))
                                            {
                                                echo '<option value='.$row_cat['id'].'>'.$row_cat['category_name'].'</option>';
                                            }
                                            
                                            ?>
                                   </select>
                                </div>
								
								<div class="form-group">
                                    <label>Sub Category</label>
                                   <input type="text" class="form-control" name="subcat" required>
                                </div>
							
								
                                        <div class="box-footer">
										<button  name="category_sub_add"  class="btn btn-primary"> <i class="fa fa-plus-circle" aria-hidden="true"></i> Add Category</button>
                                            
                                        </div>
                                  
                                </div>
                        </form>
						
                    </div> 
					
					<div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Category List</h3>
                        </div>
                       
                            <div class="box-body">
								<table class="table">
									<tr>
									<th>Sl.No</th>
									<th>Main Category</th>
									<th>Sub Category</th>
									<th>Update</th>
									<th>Delete</th>
									</tr>
									<?php
									$res_cat=mysqli_query($con,"SELECT * FROM category_sub ")or die("Query error");
									$i=1;
									while($row_cat=mysqli_fetch_array($res_cat))
									{
										echo '<tr>';
										echo'<form method="POST" action="action.php" enctype="multipart/form-data">
										<input type="hidden" name="subcat_ai" value="'.$row_cat['subcat_ai'].'">';
									echo '<td>'.$i++.'</td>';
									echo '<td>'.select_query('category','id',$row_cat['maincat'],'category_name').'</td>';
									echo '<td><input type="text" name="subcat" class="form-control" value="'.$row_cat['subcat'].'"></td>';
									
									echo '<td><button name="sub_cat_edit" class="btn btn-info"  ><i class="fa fa-pencil"></i> </button></td>';
									echo '<td><button name="sub_cat_delete" class="btn btn-danger"  ><i class="fa fa-close"> </button></form></td>';
									echo '</tr>';
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
