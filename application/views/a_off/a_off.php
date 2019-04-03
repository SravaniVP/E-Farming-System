<div class="sidenav">
	<label style="color: green">Crops to be described:</label><br>
		<?php foreach($crops as $crop): ?>			
			<a href="<?php echo base_url(); ?>a_off/process1/<?php echo $crop['id']; ?>"><p class="b"><?php echo $crop['name']; ?></p></a>
		<?php endforeach; ?>
		<label style="color: green">Crops already described:</label>
		<?php foreach($cropsInfo as $crop): ?>
		  <?php if($u_id == $crop['ao_id']): ?>				
		  <p class="b"><?php echo $crop['name']; ?></p>
		  <?php endif; ?>
		<?php endforeach; ?>
</div>

<div class="main">
	<?php echo validation_errors('<div class="error">', '</div>'); ?>
	<?php if($this->session->flashdata('user_logged_in')): ?> 
		<?php echo '<p class="alert alert-success">'.$this->session->flashdata('user_logged_in').'</p>'; ?>
	<?php endif; ?>
  <?php if($this->session->flashdata('updated')): ?>
      <?php echo '<p class="alert alert-success">'.$this->session->flashdata('updated').'</p>'; ?>
    <?php endif; ?>
  <ul class="list-group">
     <?php foreach($cropsInfo as $crop): ?>
    <li class="list-group-item">

    <p class="a"><?php echo $crop['name']; ?><br></p>
      <?php echo $crop['text']; ?><br> 
      <small style="color: grey">
        Described by the Agricultural Officer:<br>
        <?php echo $crop['firstname']; ?>       
        <?php echo $crop['lastname']; ?><br>
        <?php echo $crop['contact']; ?><br>
        <?php echo $crop['localAddress']; ?><br>
        <?php echo $crop['state']; ?><br>
        <?php echo $crop['country']; ?><br>
      </small>
          	<?php if($u_id == $crop['ao_id']): ?>
			<a href="<?php echo base_url(); ?>a_off/edit/<?php echo $crop['crop_id']; ?>" class="btn btn-success"><span class="glyphicon glyphicon-edit"></span> Edit</a>
		<?php endif; ?>
     </li>
     <?php endforeach; ?>
  </ul>
</div>


 
