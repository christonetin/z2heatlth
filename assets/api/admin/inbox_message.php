
<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Content Header (Page header) -->
        <?php
    
            $head='Inbox';
            $where='';
       
        ?>
       <section class="content-header">
            <h1><?php echo $head?>
                <small>advanced tables</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#"> <?php echo $head?></a></li>
                <li class="active"> <?php echo $head?></li>
            </ol>
        </section>

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
                                   <th style="text-align:center;">S.No.</th>
                                   <th style="text-align:center;">Date</th>
                                        <th style="text-align:center;">From ID</th>
                                        <th style="text-align:center;">Subject</th>
                                        <th style="text-align:center;">Message</th>
                                        <th style="text-align:center;">Reply</th>
                                        
                               </tr>  
                          </thead>  
                             <tbody>
									<?php 
					
				mysqli_query($con,"UPDATE message SET status=1 WHERE to_id='admin'")or die('errror 1');
							$res_pin=mysqli_query($con,"SELECT * FROM `message` WHERE to_id='admin' ORDER BY msd_id DESC")or die("Query error");
							$i=1;
							while($row_pin=mysqli_fetch_array($res_pin))
							{
				
					?>
						<tr>
							<td><?php echo $i++; ;?></td>
							<td><?php echo$row_pin['jdate'];?></td>
							<td><?php echo$row_pin['from_id'];?></td>	
							<td><?php echo$row_pin['subject'];?></td>
							<td><?php echo$row_pin['message'];?></td>
                            <td><a href="./create_message.php?id=<?php echo$row_pin['from_id'];?>" class="btn btn-success">Reply</a></td>
							
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

