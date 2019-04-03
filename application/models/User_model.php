<?php
	class User_model extends CI_Model{

		public function get_users(){
			$query = $this->db->get('category');
			return $query->result_array();

		}

		public function register($enc_pass){
			//user data array
			$data = array(
					'category_id' => $this->input->post('user'),
					'firstname' => $this->input->post('fname'),
					'lastname' => $this->input->post('lname'),
					'contact' => $this->input->post('contact'),
					'email' => $this->input->post('email'),
					'localaddress' => $this->input->post('l_add'),
					'state' => $this->input->post('state'),
					'country' => $this->input->post('country'),
					'pincode' => $this->input->post('pincode'),
					'username' => $this->input->post('username'),
					'password' => $enc_pass
			);

			return $this->db->insert('users', $data);
		}

		//check username exists
		public function check_username_exists($username){
			$query = $this->db->get_where('users',array('username' => $username));
			if(empty($query->row_array())){
				return true;
			}else{
				return false;
			}
		}

		//login 
		public function login($username,$password){
			$query = $this->db->get_where('users',array('username' => $username, 'password' => $password));
			if(empty($query->row_array())){
				return false;
			}
			else
			{
				return $query->row(0)->category_id;
			}
		}

		//get users id
		public function getuserID($username,$password){
			$query = $this->db->get_where('users',array('username' => $username, 'password' => $password));
			if(empty($query->row_array())){
				return false;
			}
			else
			{
				return $query->row(0)->id;
			}
		}

		//get name  of the logged in user
		public function getuserNAME($username,$password){
			$this->db->select('CONCAT(firstname, " ",lastname) as name');
			$query = $this->db->get_where('users',array('username' => $username, 'password' => $password));
			if(empty($query->row_array())){
				return false;
			}
			else
			{
				return $query->row(0)->name;
			}
		}


		public function get_user_info($u_id){
			$query = $this->db->get_where('users',array('id' => $u_id));
			return $query->result_array();
		}

		//update profile
		public function updateProfile($enc_pass){
			
			$id = $this->input->post('id');		
			//echo $id;	
			//exit();
			$data = array(
					'firstname' => $this->input->post('fname'),
					'lastname' => $this->input->post('lname'),
					'contact' => $this->input->post('contact'),
					'email' => $this->input->post('email'),
					'localaddress' => $this->input->post('l_add'),
					'state' => $this->input->post('state'),
					'country' => $this->input->post('country'),
					'pincode' => $this->input->post('pincode'),
					'username' => $this->input->post('username'),
					'password' => $enc_pass
			);

			$this->db->where('id',$id);
			$query = $this->db->update('users',$data);
			if($query){
				return true;
			}
		}


		//list of a_offs registered
		public function get_a_offs(){
			$query = $this->db->get_where('users', array('category_id' => '2'));
			return $query->result_array();
		}
		
		//list of sellers registered
		public function get_sellers(){
			$query = $this->db->get_where('users', array('category_id' => '3'));
			return $query->result_array();
		}

		//list of buyers registered
		public function get_buyers(){
			$query = $this->db->get_where('users', array('category_id' => '4'));
			return $query->result_array();
		}

		
	}