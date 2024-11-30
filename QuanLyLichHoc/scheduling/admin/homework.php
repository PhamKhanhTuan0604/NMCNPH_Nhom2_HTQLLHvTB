<?php include 'db_connect.php'; ?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý bài tập</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            background-color: #343a40;
            height: 100vh;
        }
        .sidebar .nav-item {
            color: #ffffff;
        }
        .sidebar .nav-item:hover {
            background-color: #495057;
        }
        .content {
            padding: 20px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>

<nav id="sidebar" class='sidebar'>
    <div class="sidebar-list">
        <a href="index.php?page=home" class="nav-item nav-home"><span class='icon-field'><i class="fa fa-home"></i></span> Home</a>
        <a href="index.php?page=courses" class="nav-item nav-courses"><span class='icon-field'><i class="fa fa-list"></i></span> Course List</a>
        <a href="index.php?page=homework" class="nav-item nav-homework"><span class='icon-field'><i class="fa fa-pencil-alt"></i></span> Homework</a>
    </div>
</nav>

<div class="content">
    <h1 class="text-center">Quản lý bài tập</h1>

    <!-- Form để thêm hoặc sửa bài tập -->
    <form method="POST" action="homework.php" class="mb-4">
        <input type="hidden" name="id" value="<?php echo isset($homework) ? $homework['id'] : ''; ?>">
        <div class="form-group">
            <label for="title">Tiêu đề:</label>
            <input type="text" name="title" class="form-control" required value="<?php echo isset($homework) ? $homework['title'] : ''; ?>">
        </div>
        
        <div class="form-group">
            <label for="description">Mô tả:</label>
            <textarea name="description" class="form-control" required><?php echo isset($homework) ? $homework['description'] : ''; ?></textarea>
        </div>
        
        <div class="form-group">
            <label for="due_date">Ngày hạn nộp:</label>
            <input type="date" name="due_date" class="form-control" required value="<?php echo isset($homework) ? $homework['due_date'] : ''; ?>">
        </div>
        
        <div class="form-group">
            <label for="course_id">Môn học:</label>
            <select name="course_id" class="form-control" required>
                <?php
                $courses = $conn->query("SELECT * FROM courses");
                while ($course = $courses->fetch_assoc()) {
                    $selected = (isset($homework) && $homework['course_id'] == $course['id']) ? 'selected' : '';
                    echo "<option value='{$course['id']}' $selected>{$course['course']}</option>";
                }
                ?>
            </select>
        </div>
        
        <button type="submit" name="submit" class="btn btn-primary">Lưu bài tập</button>
    </form>

    <?php
    // Xử lý thêm hoặc sửa bài tập
    if (isset($_POST['submit'])) {
        $id = $_POST['id'];
        $title = $_POST['title'];
        $description = $_POST['description'];
        $due_date = $_POST['due_date'];
        $course_id = $_POST['course_id'];

        if (empty($id)) {
            // Thêm bài tập mới
            $stmt = $conn->prepare("INSERT INTO homework (title, description, due_date, course_id) VALUES (?, ?, ?, ?)");
            $stmt ->bind_param("sssi", $title, $description, $due_date, $course_id);
        } else {
            // Cập nhật bài tập
            $stmt = $conn->prepare("UPDATE homework SET title=?, description=?, due_date=?, course_id=? WHERE id=?");
            $stmt->bind_param("ssssi", $title, $description, $due_date, $course_id, $id);
        }

        if ($stmt->execute()) {
            echo "<div class='alert alert-success'>Bài tập đã được lưu thành công!</div>";
        } else {
            echo "<div class='alert alert-danger'>Đã xảy ra lỗi: " . $stmt->error . "</div>";
        }
        $stmt->close();
    }

    // Xử lý xóa bài tập
    if (isset($_GET['delete'])) {
        $delete_id = $_GET['delete'];
        $conn->query("DELETE FROM homework WHERE id = $delete_id");
        echo "<div class='alert alert-success'>Bài tập đã được xóa thành công!</div>";
    }

    // Truy vấn để lấy danh sách bài tập
    $query = "SELECT h.id, h.title, h.description, h.due_date, c.course FROM homework h JOIN courses c ON h.course_id = c.id";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        echo "<table class='table table-bordered'>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tiêu đề</th>
                        <th>Mô tả</th>
                        <th>Ngày hạn nộp</th>
                        <th>Môn học</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>";
        
        // Hiển thị từng bài tập
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>{$row['id']}</td>
                    <td>{$row['title']}</td>
                    <td>{$row['description']}</td>
                    <td>{$row['due_date']}</td>
                    <td>{$row['course']}</td>
                    <td>
                        <a href='homework.php?edit={$row['id']}' class='btn btn-warning btn-sm'>Sửa</a> 
                        <a href='homework.php?delete={$row['id']}' class='btn btn-danger btn-sm' onclick='return confirm(\"Bạn có chắc chắn muốn xóa bài tập này không?\");'>Xóa</a>
                    </td>
                  </tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "<div class='alert alert-info'>Không có bài tập nào.</div>";
    }

    // Xử lý sửa bài tập
    if (isset($_GET['edit'])) {
        $edit_id = $_GET['edit'];
        $result = $conn->query("SELECT * FROM homework WHERE id = $edit_id");
        $homework = $result->fetch_assoc();
    }

    // Đóng kết nối
    $conn->close();
    ?>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script>
    $('.nav-homework').addClass('active');
</script>

</body>
</html>