<?php include "include/header.php" ?>

<div class="wrapper">
<?php
$id=$_GET['id'];

if($id==1){
	$st=1;
	$head='Binary Request';
}elseif($id==2){
	$st=2;
	$head='SMB Request';
}
elseif($id==3){
	$st=3;
	$head='Re-Purchase Request';
}
elseif($id==4){
	$st=4;
	$head='Add Income Request';
}
elseif($id==5){
	$st=5;
	$head='Team Add Income Request';
}
elseif($id==6){
	$st=6;
	$head='SMB Requrest';
}
?>
    <?php include "include/navbar.php" ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
               <?php echo $head?>
			  <!-- <form action="action.php" method="POST">
			  <button name="cut_off" class="btn btn-info">Cut Off</button>
			  </form>--->
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#"><?php echo $head?></a></li>
                <li class="active"><?php echo $head?></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- left column -->
                <div class="col-md-12" style="margin-left:0%;margin-right:10%;">
                    <!-- general form elements -->
                    <div class="box box-primary" >
                      <div style=" overflow-x: scroll;">
                    <table id="data_table" class="table table-bordered table-striped"> 
					 <thead class="table__head">
						<tr>
							<th>Sl.No</th>
							<th>User Id</th>
							<th>Name</th>
							<th>Mobile</th>
							<th>Acc number</th>
							<th>Acc Name</th>
							<th>IFSC</th>
							<th>Branch</th>
							<th>Bank</th>
                            <th>withdraw request Date</th>
							<th>Withdraw amount</th>
							<th>Deduction</th>
							<th>Net Amount</th>
							<th>Action</th>
							
							
							<th>View User</th>
						</tr>
					</thead>
					<tbody>
					<?php 
					$res_wallet_his=mysqli_query($con,"SELECT * FROM withdraw_request INNER JOIN reg  ON reg.user_id=withdraw_request.user_id WHERE withdraw_request.wr_status=1 AND withdraw_request.withdraw_type=$st")or die("Query Error"); 
					$i=0;
					while($row_wallet_his=mysqli_fetch_array($res_wallet_his))
					{
					?>
						<tr>
							<td><?php $i++; echo $i;?></td>
							<td><?php echo$row_wallet_his['user_id'];?></td>
							<td><?php echo$row_wallet_his['name'];?></td>
							<td><?php echo$row_wallet_his['mobile'];?></td>
							<td><?php echo$row_wallet_his['acc_num'];?></td>
							<td><?php echo$row_wallet_his['acc_name'];?></td>
							<td><?php echo$row_wallet_his['ifsc'];?></td>
							<td><?php echo$row_wallet_his['branch'];?></td>
							<td><?php echo$row_wallet_his['bank'];?></td>
							<td><?php echo$row_wallet_his['wr_date'];?></td>
							<td><?php echo$row_wallet_his['amount'];?></td>
							<td><?php echo$row_wallet_his['net_deduction'];?></td>
							<td><?php echo$row_wallet_his['eligible_withdraw'];?></td>
							
							<td><form method="POST" action="action.php">
								<input type="hidden" name="wr_id" value="<?php echo$row_wallet_his['wr_id'];?>">
								<input type="hidden" name="u_id" value="<?php echo$row_wallet_his['user_id'];?>">
								<input type="hidden" name="amount" value="<?php echo$row_wallet_his['amount'];?>">
								<button name="accept_withdraw_request" class="btn btn-success">Accept</button>
								<!--<a href="reject_requst.php?id=<?php echo $row_wallet_his['user_id']?>&&wr_id=<?php echo$row_wallet_his['wr_id'];?>&&amount=<?php echo$row_wallet_his['amount'];?>" class="btn btn-danger">Reject</a>-->
								</form>
							</td>
							
						
							<td> <a href="view.php?id=<?php echo$row_wallet_his['user_id'];?>" class="btn btn-primary">View</a></td>
							
						</tr>
						<?php
					}
						?>
					</tbody>
				</table>
				</div>
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
