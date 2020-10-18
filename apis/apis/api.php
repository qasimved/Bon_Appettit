<?php include("includes/connection.php");
 	  include("includes/function.php"); 	
	
	$file_path = 'http://'.$_SERVER['SERVER_NAME'] . dirname($_SERVER['REQUEST_URI']).'/';
 	 
	if(isset($_GET['cat_list']))
 	{
 		$jsonObj= array();
		
		$pro_order=API_CAT_ORDER_BY;


		$query="SELECT * FROM tbl_category ORDER BY tbl_category.".$pro_order."";
		$sql = mysqli_query($mysqli,$query);

		while($data = mysqli_fetch_assoc($sql))
		{
			 

			$row['cid'] = $data['cid'];
			$row['category_name'] = $data['category_name'];
			$row['category_image'] = $file_path.'images/'.$data['category_image'];
  
			array_push($jsonObj,$row);
		
		}

		$set['FOOD_APP'] = $jsonObj;
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
 	}
	else if(isset($_GET['cat_id']))
	{
		$post_order_by=API_CAT_POST_ORDER_BY;

		$cat_id=$_GET['cat_id'];	

		$jsonObj= array();	
	
	    $query="SELECT * FROM tbl_restaurants
		LEFT JOIN tbl_category ON tbl_category.cid= tbl_restaurants.cat_id
		where tbl_restaurants.cat_id='".$cat_id."' AND tbl_restaurants.status='1' ORDER BY tbl_restaurants.id ".$post_order_by."";

		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
			$row['id'] = $data['id'];
			$row['restaurant_name'] = $data['restaurant_name']; 			 
			$row['restaurant_image'] = $file_path.'images/'.$data['restaurant_image'];
  
			$row['restaurant_address'] = $data['restaurant_address'];
			$row['restaurant_open_mon'] = $data['restaurant_open_mon'];
			$row['restaurant_open_tues'] = $data['restaurant_open_tues'];
			$row['restaurant_open_wed'] = $data['restaurant_open_wed'];
			$row['restaurant_open_thur'] = $data['restaurant_open_thur'];
			$row['restaurant_open_fri'] = $data['restaurant_open_fri'];
			$row['restaurant_open_sat'] = $data['restaurant_open_sat'];
			$row['restaurant_open_sun'] = $data['restaurant_open_sun'];

			$row['total_rate'] = $data['total_rate'];
			$row['rate_avg'] = $data['rate_avg'];

			$row['cid'] = $data['cid'];
			$row['category_name'] = $data['category_name'];
			$row['category_image'] = $file_path.'images/'.$data['category_image'];

			array_push($jsonObj,$row);
		
		}

		$set['FOOD_APP'] = $jsonObj;
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

		
	}
	else if(isset($_GET['restaurant_id']))
	{		  
				 
		$jsonObj= array();	
	
	    $query="SELECT * FROM tbl_restaurants
		LEFT JOIN tbl_category ON tbl_category.cid= tbl_restaurants.cat_id
		WHERE tbl_restaurants.id='".$_GET['restaurant_id']."' AND tbl_restaurants.status='1'";

		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
			$row['id'] = $data['id'];
			$row['restaurant_name'] = $data['restaurant_name']; 			 
			$row['restaurant_image'] = $file_path.'images/'.$data['restaurant_image'];
  
			$row['restaurant_address'] = $data['restaurant_address'];
			$row['restaurant_open_mon'] = $data['restaurant_open_mon'];
			$row['restaurant_open_tues'] = $data['restaurant_open_tues'];
			$row['restaurant_open_wed'] = $data['restaurant_open_wed'];
			$row['restaurant_open_thur'] = $data['restaurant_open_thur'];
			$row['restaurant_open_fri'] = $data['restaurant_open_fri'];
			$row['restaurant_open_sat'] = $data['restaurant_open_sat'];
			$row['restaurant_open_sun'] = $data['restaurant_open_sun'];

			$row['total_rate'] = $data['total_rate'];
			$row['rate_avg'] = $data['rate_avg'];

			$row['cid'] = $data['cid'];
			$row['category_name'] = $data['category_name'];
			$row['category_image'] = $file_path.'images/'.$data['category_image'];


			 $query1="SELECT * FROM tbl_rating
				LEFT JOIN tbl_users ON tbl_users.id= tbl_rating.ip
				WHERE tbl_rating.restaurant_id='".$_GET['restaurant_id']."' ORDER BY tbl_rating.r_id DESC";

			$sql1 = mysqli_query($mysqli,$query1)or die(mysqli_error());

			while($data1 = mysqli_fetch_assoc($sql1))
			{
				$row['rating_review'][]=array('r_id'=>$data1['r_id'],'user_name'=>$data1['name'],'rate'=>$data1['rate'],'review'=>$data1['msg']);
			}

			array_push($jsonObj,$row);
		
		}

		$set['FOOD_APP'] = $jsonObj;
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();	
 

	}
	else if(isset($_GET['top_rated']))
	{
  
		$jsonObj= array();	
	
	    $query="SELECT * FROM tbl_restaurants
		LEFT JOIN tbl_category ON tbl_category.cid= tbl_restaurants.cat_id
		WHERE tbl_restaurants.status='1' ORDER BY tbl_restaurants.rate_avg DESC, tbl_restaurants.total_rate DESC";

		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
			$row['id'] = $data['id'];
			$row['restaurant_name'] = $data['restaurant_name']; 			 
			$row['restaurant_image'] = $file_path.'images/'.$data['restaurant_image'];
  
			$row['restaurant_address'] = $data['restaurant_address'];
			$row['restaurant_open_mon'] = $data['restaurant_open_mon'];
			$row['restaurant_open_tues'] = $data['restaurant_open_tues'];
			$row['restaurant_open_wed'] = $data['restaurant_open_wed'];
			$row['restaurant_open_thur'] = $data['restaurant_open_thur'];
			$row['restaurant_open_fri'] = $data['restaurant_open_fri'];
			$row['restaurant_open_sat'] = $data['restaurant_open_sat'];
			$row['restaurant_open_sun'] = $data['restaurant_open_sun'];

			$row['total_rate'] = $data['total_rate'];
			$row['rate_avg'] = $data['rate_avg'];

			$row['cid'] = $data['cid'];
			$row['category_name'] = $data['category_name'];
			$row['category_image'] = $file_path.'images/'.$data['category_image'];

			array_push($jsonObj,$row);
		
		}

		$set['FOOD_APP'] = $jsonObj;
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

		
	}
	else if(isset($_GET['menu_cat']))
	{		  
				 
		$jsonObj= array();	
	
	    $query="SELECT * FROM tbl_menu_category
      WHERE tbl_menu_category.restaurant_id='".$_GET['menu_cat']."' 
      ORDER BY tbl_menu_category.cid DESC";

		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
			$row['cid'] = $data['cid'];
			$row['category_name'] = $data['category_name']; 	
			 
			$row['restaurant_id'] = $data['restaurant_id'];
			
			array_push($jsonObj,$row);
		
		}

		$set['FOOD_APP'] = $jsonObj;
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();	
 

	}
	else if(isset($_GET['menu_list_cat_id']))
	{		  
				 
		$jsonObj= array();	
	
	    $query="SELECT * FROM tbl_menu_list
      LEFT JOIN tbl_menu_category ON tbl_menu_category.cid= tbl_menu_list.menu_cat
      WHERE tbl_menu_list.menu_cat='".$_GET['menu_list_cat_id']."' 
      ORDER BY tbl_menu_list.mid DESC";

		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
			$row['mid'] = $data['mid'];
			$row['menu_name'] = $data['menu_name'];
			$row['menu_info'] = $data['menu_info'];
			$row['menu_price'] = $data['menu_price'];
			$row['menu_image'] = $file_path.'images/'.$data['menu_image'];

			 
			$row['menu_cat_id'] = $data['menu_cat'];
			$row['rest_id'] = $data['rest_id'];
			
			array_push($jsonObj,$row);
		
		}

		$set['FOOD_APP'] = $jsonObj;
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();	
 

	}	 
	else if(isset($_GET['home']))
	{
		
		$jsonObj0= array();	
 
		$query0="SELECT * FROM tbl_restaurants
		LEFT JOIN tbl_category ON tbl_category.cid= tbl_restaurants.cat_id
		where tbl_restaurants.featured_restaurant='1' AND tbl_restaurants.status='1' ORDER BY tbl_restaurants.id DESC";

		$sql0 = mysqli_query($mysqli,$query0)or die(mysqli_error());

		while($data0 = mysqli_fetch_assoc($sql0))
		{
			$row0['id'] = $data0['id'];
			$row0['restaurant_name'] = $data0['restaurant_name']; 			 
			$row0['restaurant_image'] = $file_path.'images/'.$data0['restaurant_image'];
  
			$row0['restaurant_address'] = $data0['restaurant_address'];
			$row0['total_rate'] = $data0['total_rate'];
			$row0['rate_avg'] = $data0['rate_avg'];
 
			array_push($jsonObj0,$row0);
		
		}

		$row['featured_restaurant']=$jsonObj0;

		 
		$jsonObj1= array();	
 
		$query1="SELECT * FROM tbl_restaurants
		LEFT JOIN tbl_category ON tbl_category.cid= tbl_restaurants.cat_id
		WHERE tbl_restaurants.status='1' ORDER BY tbl_restaurants.id DESC";

		$sql1 = mysqli_query($mysqli,$query1)or die(mysqli_error());

		while($data1 = mysqli_fetch_assoc($sql1))
		{
			$row1['id'] = $data1['id'];
			$row1['restaurant_name'] = $data1['restaurant_name']; 			 
			$row1['restaurant_image'] = $file_path.'images/'.$data1['restaurant_image'];
  
			$row1['restaurant_address'] = $data1['restaurant_address'];

			$row1['total_rate'] = $data1['total_rate'];
			$row1['rate_avg'] = $data1['rate_avg'];
 
			array_push($jsonObj1,$row1);
		
		}

		$row['latest_restaurant']=$jsonObj1;
 
		 
		$set['FOOD_APP'] = $row;
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	}
	else if(isset($_GET['all_restaurants']))
  {
    
    $jsonObj= array();  
  
      $query="SELECT * FROM tbl_restaurants
    LEFT JOIN tbl_category ON tbl_category.cid= tbl_restaurants.cat_id
    WHERE tbl_restaurants.status='1' ORDER BY tbl_restaurants.id DESC";

    $sql = mysqli_query($mysqli,$query)or die(mysqli_error());

    while($data = mysqli_fetch_assoc($sql))
    {
      $row['id'] = $data['id'];
      $row['restaurant_name'] = $data['restaurant_name'];        
      $row['restaurant_image'] = $file_path.'images/'.$data['restaurant_image'];
  
      $row['restaurant_address'] = $data['restaurant_address'];
       
      $row['total_rate'] = $data['total_rate'];
      $row['rate_avg'] = $data['rate_avg'];

      $row['cid'] = $data['cid'];
      $row['category_name'] = $data['category_name'];
      $row['category_image'] = $file_path.'images/'.$data['category_image'];

      array_push($jsonObj,$row);
    
    }

    $set['FOOD_APP'] = $jsonObj;
    
    header( 'Content-Type: application/json; charset=utf-8' );
      echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
    die();

    
  }	  	 
	else 
	{
		$jsonObj= array();	

		$query="SELECT * FROM tbl_settings WHERE id='1'";
		$sql = mysqli_query($mysqli,$query)or die(mysqli_error());

		while($data = mysqli_fetch_assoc($sql))
		{
			 
			$row['app_name'] = $data['app_name'];
			$row['app_logo'] = $data['app_logo'];
			$row['app_version'] = $data['app_version'];
			$row['app_author'] = $data['app_author'];
			$row['app_contact'] = $data['app_contact'];
			$row['app_email'] = $data['app_email'];
			$row['app_website'] = $data['app_website'];
			$row['app_description'] = stripslashes($data['app_description']);
 			$row['app_developed_by'] = $data['app_developed_by'];

			$row['app_privacy_policy'] = stripslashes($data['app_privacy_policy']); 	

			array_push($jsonObj,$row);		
		}

		$set['FOOD_APP'] = $jsonObj;
		
		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($set,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();	
	}		
	 
	 
?>