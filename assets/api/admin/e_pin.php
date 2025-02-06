
<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ;
    if($_GET['id']==0){
        $head='Available Pins';
        $status=0;
    }
    else{
        $head='Used Pins';
        $status=1;
    }
    ?>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Content Header (Page header) -->
       <section class="content-header"><h1> <?php echo $head?><small>advanced tables</small></h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#"> <?php echo $head?></a></li>
                <li class="active"> <?php echo $head?></li>
            </ol></section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title" style="color:#FF0000;"><b><?php echo $head?></b></h3>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                             <table id="data_table" class="table table-bordered table-striped">  
                             <thead>  
							 <tr>
								<th>Sl.No</th>
								<th>Pins</th>
								<th>User ID</th>
								<th>Amount</th>
								<th>Date</th>
								
							</tr>
				 </thead>  
                 <tbody>
				 <?php
						
						$res_pin=mysqli_query($con,"SELECT * FROM pin WHERE  status=$status ORDER BY pin_id DESC  ")or die("Query error");
						$i=1 ;
						while($row_pin=mysqli_fetch_array($res_pin))
						{
						?>
						<tr>
							<td><?php echo $i++; ?></td>
							<td><?php echo $row_pin['pin'] ?></td>
							<td><?php echo $row_pin['u_id'] ?></td>
							<td><?php echo $row_pin['amount'] ?></td>
							<td><?php echo $row_pin['pin_date'] ?></td>
							
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

