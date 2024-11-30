<!DOCTYPE html>
<html lang="en">
<?php 
session_start();
include('./db_connect.php');
ob_start();
ob_end_flush();
?>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>School Faculty Scheduling System</title>
  <?php include('./header.php'); ?>
  <?php if(isset($_SESSION['login_id'])) header("location:index.php?page=home"); ?>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background: #f0f0f0;
    }
    main#main {
      display: flex;
      width: 100%;
      height: 100vh;
    }
    #login-left {
      flex: 60%;
      background: url(assets/uploads/<?php echo $_SESSION['system']['cover_img'] ?>) no-repeat center center;
      background-size: cover;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    #login-right {
      flex: 40%;
      display: flex;
      align-items: center;
      justify-content: center;
      background: white;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .card {
      width: 100%;
      max-width: 400px;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }
    .logo {
      margin: auto;
      font-size: 8rem;
      background: white;
      padding: .5em 0.7em;
      border-radius: 50%;
      color: #000000b3;
      z-index: 10;
    }
    .form-group {
      margin-bottom: 15px;
    }
    .btn-primary {
      width: 100%;
      padding: 10px;
      border: none;
      border-radius: 5px;
      background-color: #007bff;
      color: white;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    .btn-primary:hover {
      background-color: #0056b3;
    }
    .alert {
      margin-top: 10px;
    }
  </style>
</head>

<body>
  <main id="main" class="bg-dark">
    <div id="login-left">
      <img src="./assets/img/school.jpg" alt="School Image" style="width: 100%; height: auto;">
    </div>
    <div id="login-right">
      <div class="card">
        <h2 class="text-center">Đăng Nhập</h2>
        <form id="login-form">
          <div class="form-group">
            <label for="username" class="control-label">Username</label>
            <input type="text" id="username" name="username" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="password" class="control-label">Password</label>
            <input type="password" id="password" name="password" class="form-control" required>
          </div>
          <button type="submit" class="btn btn-primary">Login</button>
        </form>
      </div>
    </div>
  </main>

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <script>
    $('#login-form').submit(function(e){
      e.preventDefault();
      $('#login-form button[type="submit"]').attr('disabled', true).html('Logging in...');
      if($(this).find('.alert -danger').length > 0)
        $(this).find('.alert-danger').remove();
      $.ajax({
        url: 'ajax.php?action=login',
        method: 'POST',
        data: $(this).serialize(),
        error: err => {
          console.log(err);
          $('#login-form button[type="submit"]').removeAttr('disabled').html('Login');
        },
        success: function(resp) {
          if (resp == 1) {
            location.href = 'index.php?page=home';
          } else {
            $('#login-form').prepend('<div class="alert alert-danger">Username or password is incorrect.</div>');
            $('#login-form button[type="submit"]').removeAttr('disabled').html('Login');
          }
        }
      });
    });
  </script>
</body>
</html>