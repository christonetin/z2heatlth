
<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Content Header (Page header) -->
       <section class="content-header">
            <h1>
            Franchisee All
                <small>advanced tables</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Franchisee</a></li>
                <li class="active">Franchisee</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title" style="color:#FF0000;"><b>Total User</b></h3>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                             <table id="data_table" class="table table-bordered table-striped">  
                          <thead>  
                               <tr>  
                                   <th style="text-align:center;">S.No.</th>
                                        <th style="text-align:center;">User Id</th>
                                        <th style="text-align:center;">Name</th>
                                        <th style="text-align:center;">Mobile</th>
                                        <th style="text-align:center;"> Panel</th>
                                        <th style="text-align:center;">Edit</th>
                               </tr>  
                          </thead>  
                             <tbody>
									<?php 
					
				
							$res_pin=mysqli_query($con,"SELECT * FROM master_franchisee  ")or die("Query error");
							$i=1;
							while($row_pin=mysqli_fetch_array($res_pin))
							{
				
					
					?>
						<tr>
							<td><?php echo $i++; ;?></td>
							<td><?php echo$row_pin['mas_franch_id'];?></td>
							<td><?php echo$row_pin['mas_franch_name'];?></td>
							<td><?php echo$row_pin['mas_franch_mobile'];?></td>
							
							<td><form method="POST" action="../business/action.php" target="_blank">
								<input type="hidden" name="mas_franch_id" value="<?php echo $row_pin['mas_franch_id']?>">
								<input type="hidden" name="mas_franch_password" value="<?php echo $row_pin['mas_franch_password']?>">
                                    <button name="login" class="btn btn-danger">Goto Panel</button>
									</form></td>
							
							<td><a href="franchisee_view.php?id=<?php echo$row_pin['mas_franch_id'];?>" class="btn btn-primary">View</a></td>
						</tr>
						<?php
					}
							
						?>
                                </tbody>
                     </table> 
                        </div>
                        <!-- /.box-body -->
                    </div>
					 
		  
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <?php include "include/footer.php" ?>

