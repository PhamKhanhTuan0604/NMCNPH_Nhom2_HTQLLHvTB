<?php include 'admin/db_connect.php'; ?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xem Bài Tập</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .content {
            padding: 20px;
        }
    </style>
</head>
<body>

<div class="content">
    <h1 class="text-center">Chi tiết Bài Tập</h1>

    <?php
    // Kiểm tra xem có ID bài tập không
    if (isset($_GET['id'])) {
        $homework_id = $_GET['id'];

        // Truy vấn để lấy thông tin bài tập
        $query = "SELECT h.title, h.description, h.due_date, c.course 
                  FROM homework h 
                  JOIN courses c ON h.course_id = c.id 
                  WHERE h.id = ?";
        
        $stmt = $conn->prepare($query);
        $stmt->bind_param("i", $homework_id);
        $stmt->execute();
        $result = $stmt->get_result();

        // Kiểm tra nếu tìm thấy bài tập
        if ($result->num_rows > 0) {
            $homework = $result->fetch_assoc();
            echo "<h2>{$homework['title']}</h2>";
            echo "<p><strong>Mô tả:</strong> {$homework['description']}</p>";
            echo "<p><strong>Ngày hạn nộp:</strong> {$homework['due_date']}</p>";
            echo "<p><strong>Môn học:</strong> {$homework['course']}</p>";
        } else {
            echo "<div class='alert alert-danger'>Không tìm thấy bài tập.</div>";
        }
        $stmt->close();
    } else {
        echo "<div class='alert alert-danger'>ID bài tập không hợp lệ.</div>";
    }

    // Đóng kết nối
    $conn->close();
    ?>
    
    <div class="text-center mt-4">
        <a href="homework.php" class="btn btn-secondary">Quay lại danh sách bài tập</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</body>
</html>