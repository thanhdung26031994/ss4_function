use student_management;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT 
    *
FROM
    subjects
WHERE
    credit IN (SELECT 
            MAX(credit)
        FROM
            subjects);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT 
    s.*
FROM
    subjects s
        JOIN
    mark m ON s.sub_id = m.sub_id
WHERE
    m.mark IN (SELECT 
            MAX(m.mark)
        FROM
            mark);
            
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT 
    student.*, AVG(m.mark) AS `Điểm trung bình`
FROM
    student
        JOIN
    mark m ON student.student_id = m.student_id
GROUP BY m.student_id
ORDER BY `Điểm trung bình` DESC;