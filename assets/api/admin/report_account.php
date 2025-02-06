
<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Content Header (Page header) -->
       <section class="content-header">
            <h1>
             Account Table
                <small>advanced tables</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#"> Total users</a></li>
                <li class="active"> Total users</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title" style="color:#FF0000;"><b>Report</b></h3>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                             <table id="data_table" class="table table-bordered table-striped">  
                          <thead>  
                               <tr>  
                                   <th style="text-align:center;">S.No.</th>
                                        <th style="text-align:center;">User Id</th>
									  <th style="text-align:center;">Join Date</th>
                                        <th style="text-align:center;">Name</th>
                                        <th style="text-align:center;">Mobile</th>
                                        <th style="text-align:center;">Account Number</th>
                                        <th style="text-align:center;">Account Name</th>
                                        <th style="text-align:center;">Bank</th>
                                        <th style="text-align:center;">IFSC</th>
                                        <th style="text-align:center;">Branch</th>
                                        <th style="text-align:center;">G-Pay</th>
                                        <th style="text-align:center;">Phone Pe</th>
                                        <th style="text-align:center;">Pay TM</th>
                                        <th style="text-align:center;">User Panel</th>
                                        <th style="text-align:center;">View</th>
                               </tr>  
                          </thead>  
                             <tbody>
									<?php 
					
				
							$res_pin=mysqli_query($con,"SELECT * FROM reg  ")or die("Query error");
							$i=1;
							while($row_pin=mysqli_fetch_array($res_pin))
							{
					
					?>
						<tr>
							<td><?php echo $i++; ;?></td>
							<td><?php echo$row_pin['user_id'];?></td>
							<td><?php echo$row_pin['join_date'];?></td>
							<td><?php echo$row_pin['name'];?></td>
							<td><?php echo$row_pin['mobile'];?></td>
							<td><?php echo$row_pin['acc_num'];?></td>
							<td><?php echo$row_pin['acc_name'];?></td>
							<td><?php echo$row_pin['ifsc'];?></td>
							<td><?php echo$row_pin['bank'];?></td>
							<td><?php echo$row_pin['branch'];?></td>
							<td><?php echo$row_pin['google_pay'];?></td>
							<td><?php echo$row_pin['phone_pe'];?></td>
							<td><?php echo$row_pin['pay_tm'];?></td>
							
							
							
							
							<td><form method="POST" action="../user/action.php" target="_blank">
								<input type="hidden" name="u_id" value="<?php echo $row_pin['user_id']?>">
								<input type="hidden" name="pass" value="<?php echo $row_pin['password']?>">
                                    <button name="login" class="btn btn-danger">Goto Panel</button>
									</form></td>
							
							<td><a href="view.php?id=<?php echo$row_pin['user_id'];?>" class="btn btn-primary">View</a></td>
						</tr>
						<?php
					}
							
						?>
                                </tbody>
                     </table> 
                        </div>
                        <!-- /.box-body -->
                    </div>
					 
		    <script>  
			 $(document).ready(function(){  
				  $('#employee_data').DataTable();  
			 });  
			 </script>  
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

