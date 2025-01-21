<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
               Payment Proof
                <small>advanced tables</small>
            </h1>
           
        </section>
					

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title" style="color:#FF0000;"><b>Payment Proof</b></h3>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                            <table   id="data_table" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th style="text-align:center;">S.No.</th>
                                        <th style="text-align:center;">User Id</th>
                                        <th style="text-align:center;">Date</th>
                                        <th style="text-align:center;">Proof</th>
                                        <th style="text-align:center;">Trans ID</th>
                                        <th style="text-align:center;">Amount</th>
                                        <th style="text-align:center;">Details</th>
                                        
                                      
                                    </tr>
                                </thead>
                                <tbody>
									<?php 
					
				
							
							$res_pin=mysqli_query($con,"SELECT * FROM pin_req INNER JOIN reg ON reg.user_id=pin_req.u_id WHERE pin_req.pin_req_status=1")or die("Query error");
							$i=1 ;
							while($row_pin=mysqli_fetch_array($res_pin))
					{
					?>
						<tr>
							<td><?php echo $i++; ;?></td>
							<td><?php echo$row_pin['u_id'];?></td>
							<td><?php echo$row_pin['req_date'];?></td>
                            <td><img src="../payment_proof/<?php echo$row_pin['pic'];?>" width="300px" height="300px"></td>
                            <td><?php echo$row_pin['ref_id'];?></td>
							<td><?php echo$row_pin['amount'];?></td>
							<td><?php echo$row_pin['details'];?></td>
							
							
						
							
							
						</tr>
						<?php
					}
							
						?>
                                </tbody>
                               
								<script>
								$("#page_ign").change(function(){
									var page=$('#page_ign').val();
									  location.href='transaction_history.php?page='+page;
									});
								</script>
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
 
    <?php include "include/footer.php" ?>

