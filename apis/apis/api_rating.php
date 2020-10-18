<?php include("includes/connection.php"); 
      include("includes/function.php");
  
    
    if(isset($_GET['restaurant_id']))
	{
		 
    	//search if the user(ip) has already gave a note
    	$ip = $_GET['user_id'];
    	$therate = $_GET['rate'];
      $msg = $_GET['msg'];
    	$restaurant_id = $_GET['restaurant_id'];
	
    	$query1 = mysqli_query($mysqli,"select * from tbl_rating where restaurant_id  = '$restaurant_id' && ip = '$ip' "); 
    	while($data1 = mysqli_fetch_assoc($query1)){
    		$rate_db1[] = $data1;
    	}
    	if(@count($rate_db1) == 0 ){
			
    		   $data = array(            
              'restaurant_id'  =>$restaurant_id,
              'rate'  =>  $therate,
              'msg'  =>  $msg,
              'ip'  => $ip,
               );  
 	$qry = Insert('tbl_rating',$data); 
     	
					//Total rate result
					 
				$query = mysqli_query($mysqli,"select * from tbl_rating where restaurant_id  = '$restaurant_id' ");
               
			   while($data = mysqli_fetch_assoc($query)){
                  	$rate_db[] = $data;
                    $sum_rates[] = $data['rate'];
               
                }
				
                if(@count($rate_db)){
                    $rate_times = count($rate_db);
                    $sum_rates = array_sum($sum_rates);
                    $rate_value = $sum_rates/$rate_times;
                    $rate_bg = (($rate_value)/5)*100;
                }else{
                    $rate_times = 0;
                    $rate_value = 0;
                    $rate_bg = 0;
                }
				 
				$rate_avg=round($rate_value); 
				
		  $sql="update tbl_restaurants set total_rate=total_rate + 1,rate_avg='$rate_avg' where id='".$restaurant_id."'";
      mysqli_query($mysqli,$sql);
		  
		
				echo '{"FOOD_APP":[{"MSG":"You have succesfully rated","rate_avg":"'.$rate_avg.'"}]}';
				
    	}else{
    						
				echo '{"FOOD_APP":[{"MSG":"You have already rated"}]}';
    	}
   
	}
	else
	{
		echo '{"FOOD_APP":[{"MSG":"Error"}]}';
		
	}
?>