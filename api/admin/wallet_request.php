<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
              Wallet Request
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Total users</a></li>
                <li class="active">User List</li>
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
                <div class="col-md-12 col-xs-12" style="margin-left:2%;margin-right:2%;">
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                           
                       </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                     
                            <div class="box-header with-border">
							<div style="overflow-x: scroll;">
					<table class="table">
							<tr>
								<th>Sl.No</th>
								<th>Date</th>
								<th>u_id</th>
								<th>Amount</th>
								<th>Details</th>
								
								<th>Proof</th>
								<th>View</th>
								
							</tr>
							<?php
							
							$row_msg=mysqli_query($con,"SELECT * FROM payment_proof WHERE  status=1 ORDER BY payment_proof_pic DESC");
							$i=1;
							while($res_message=mysqli_fetch_array($row_msg))
							{
							?>
							<tr>
								<td><?php echo $i++;?></td>
								<td><?php echo $res_message['payment_proof_date'];?></td>
								<td><?php echo $res_message['u_id'];?></td>
								<td><?php echo $res_message['amount'];?></td>
								<td><?php echo $res_message['details'];?></td>
								
							
								<td><img data-enlargeable  style="cursor: zoom-in" src="../payment_proof/<?php echo $res_message['payment_proof_pic'];?>" width="200px" height="100px" class="img-responsive"> </td>
								<td>
								<form method="post" action="action.php">
									<input type="hidden" value="<?php echo$res_message['id'];?>" name="id">
									<button name="accept_wallet_request" class="btn btn-success" onclick="return confirm('Are You Wane Accept Payment?')" >Accept</button>
								</form>
								</td>
								<td><a href="view.php?id=<?php echo$res_message['u_id'];?>" class="btn btn-primary">View</a></td>
								
							</tr>
							<script>
							$('img[data-enlargeable]').addClass('img-enlargeable').click(function() {
					  var src = $(this).attr('src');
					  var modal;

					  function removeModal() {
						modal.remove();
						$('body').off('keyup.modal-close');
					  }
					  modal = $('<div>').css({
						background: 'RGBA(0,0,0,.5) url(' + src + ') no-repeat center',
						backgroundSize: 'contain',
						width: '100%',
						height: '100%',
						position: 'fixed',
						zIndex: '10000',
						top: '0',
						left: '0',
						cursor: 'zoom-out'
					  }).click(function() {
						removeModal();
					  }).appendTo('body');
					  //handling ESC
					  $('body').on('keyup.modal-close', function(e) {
						if (e.key === 'Escape') {
						  removeModal();
						}
					  });
					});
							</script>
							<?php
							}
							?>
						</table>

                                        <!-- </div>-->
                                        <!-- /.box-body -->

                                   
                                </div>
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
